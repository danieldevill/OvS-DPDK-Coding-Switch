#!/bin/bash

#Start OVS with DPDK setup.

#Export $DPDK_DIR
export DPDK_DIR=/usr/src/dpdk-18.11

#Add hugepages. Specifically 4GB of 2mb page files
#sudo  bash -c "echo 2048 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages"

#Clean ovs enviroment
sudo killall ovsdb-server ovs-vswitchd
sudo rm -f /var/run/openvswitch/vhost-user*
sudo rm -f /etc/openvswitch/conf.db

#Bind devices to DPDK
sudo ip link set enp4s0f0 down
sudo ip link set enp4s0f1 down
sudo ip link set enp5s0f0 down
sudo ip link set enp5s0f1 down

#Enable PMD
#sudo modprobe uio_pci_generic
#sudo modprobe igb_uio
#sudo insmod /usr/src/dpdk-stable-17.11.1/build/kmod/igb_uio.ko
sudo modprobe vfio-pci

#Bind NICs to DPDK
sudo $DPDK_DIR/usertools/dpdk-devbind.py --bind=vfio-pci enp4s0f0
sudo $DPDK_DIR/usertools/dpdk-devbind.py --bind=vfio-pci enp4s0f1
sudo $DPDK_DIR/usertools/dpdk-devbind.py --bind=vfio-pci enp5s0f0
sudo $DPDK_DIR/usertools/dpdk-devbind.py --bind=vfio-pci enp5s0f1


#Start ovsdb
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
sudo ovsdb-server --remote=punix:$DB_SOCK --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile --detach

#Start OVS with dpdk config enabled
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo /usr/local/share/openvswitch/scripts/ovs-ctl --no-ovsdb-server --db-sock="$DB_SOCK" start
sudo ovs-vswitchd unix:$DB_SOCK --pidfile --detach --log-file=/var/log/openvswitch/ovs-vswitchd.log

#Create OVS-DPDK Bridge and Ports
sudo ovs-vsctl --if-exists del-br br0
sudo ovs-vsctl add-br br0 -- set bridge br0 datapath_type=netdev
sudo ovs-vsctl add-port br0 enp4s0f0 -- set Interface enp4s0f0 type=dpdk options:dpdk-devargs=0000:04:00.0 ofport_request=1
sudo ovs-vsctl add-port br0 enp4s0f1 -- set Interface enp4s0f1 type=dpdk options:dpdk-devargs=0000:04:00.1 ofport_request=2
sudo ovs-vsctl add-port br0 enp5s0f0 -- set Interface enp5s0f0 type=dpdk options:dpdk-devargs=0000:05:00.0 ofport_request=3
sudo ovs-vsctl add-port br0 enp5s0f1 -- set Interface enp5s0f1 type=dpdk options:dpdk-devargs=0000:05:00.1 ofport_request=4

#Setup test flows to forward packets between DPDK ports
sudo ovs-ofctl del-flows br0
sudo ovs-ofctl add-flow br0 in_port=1,action=output:2
sudo ovs-ofctl add-flow br0 in_port=2,action=output:1
sudo ovs-ofctl add-flow br0 in_port=3,action=output:4
sudo ovs-ofctl add-flow br0 in_port=4,action=output:3

#Print outputs of dpdk drivers and ovs-vsctl/ovs-ofctl to confirm.
sudo $DPDK_DIR/usertools/dpdk-devbind.py -s
sudo ovs-vsctl show
sudo ovs-ofctl dump-flows br0

#Validate OVS-DPDK
sudo ovs-vswitchd --version
echo Is DPDK initialized:
sudo ovs-vsctl get Open_vSwitch . dpdk_initialized

#Print number of Hugepages
grep Huge /proc/meminfo


