#!/bin/bash

#Start OVS with DPDK setup.

#Export $RTE_SDK
export RTE_SDK=/usr/src/dpdk-stable-18.11.2

#Add hugepages. Specifically 4GB of 2mb page files
#sudo  bash -c "echo 2048 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages"

#Clean ovs enviroment
sudo killall ovsdb-server ovs-vswitchd
sudo rm -f /var/run/openvswitch/vhost-user*
sudo rm -f /etc/openvswitch/conf.db

#Bind devices to DPDK
# sudo ip link set enp7s0f0 down
# sudo ip link set enp7s0f1 down
# sudo ip link set enp8s0f0 down
# sudo ip link set enp8s0f1 down

#Enable PMD
#sudo modprobe uio_pci_generic
#sudo modprobe igb_uio
#sudo insmod /usr/src/dpdk-stable-17.11.1/build/kmod/igb_uio.ko
sudo modprobe vfio-pci

# #Bind NICs to DPDK
# sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp7s0f0
# sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp7s0f1
# sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp8s0f0
# sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp8s0f1

#Start ovsdb
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
sudo /usr/local/sbin/ovsdb-server --remote=punix:$DB_SOCK --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile --detach
#sudo ovsdb-server --remote=punix:$DB_SOCK --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile --detach

#Start OVS with dpdk config enabled
echo Starting OVS with dpdk config enabled..
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
#sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socket-mem=512,0
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-lcore-mask=0x4 #Set non-datapath OVS-DPDK threads such as handler and revalidator to core 2
sudo /usr/local/share/openvswitch/scripts/ovs-ctl --no-ovsdb-server --db-sock="$DB_SOCK" start
sudo /usr/local/sbin/ovs-vswitchd unix:$DB_SOCK --pidfile --detach --log-file=/var/log/openvswitch/ovs-vswitchd.log

#Create OVS-DPDK Bridge
echo Adding bridge br0..
sudo /usr/local/bin/ovs-vsctl --if-exists del-br br0
sudo /usr/local/bin/ovs-vsctl add-br br0 -- set bridge br0 datapath_type=netdev
# sudo /usr/local/bin/ovs-vsctl add-port br0 enp7s0f0 -- set Interface enp7s0f0 type=dpdk options:dpdk-devargs=0000:07:00.0 ofport_request=1
# sudo /usr/local/bin/ovs-vsctl add-port br0 enp7s0f1 -- set Interface enp7s0f1 type=dpdk options:dpdk-devargs=0000:07:00.1 ofport_request=2
# sudo /usr/local/bin/ovs-vsctl add-port br0 enp8s0f0 -- set Interface enp8s0f0 type=dpdk options:dpdk-devargs=0000:08:00.0 ofport_request=3
# sudo /usr/local/bin/ovs-vsctl add-port br0 enp8s0f1 -- set Interface enp8s0f1 type=dpdk options:dpdk-devargs=0000:08:00.1 ofport_request=4

#Set Controller to Ryu
sudo /usr/local/bin/ovs-vsctl set-controller br0 tcp:10.10.11.117:6633
#Set fail mode to secure, so that only the Ryu controller can control the switch, even when connection is lost.
#sudo ovs-vsctl set-fail-mode br0 secure

#Setup test flows to forward packets between DPDK ports
# sudo ovs-ofctl del-flows br0
# sudo ovs-ofctl add-flow br0 in_port=1,action=output:2
# sudo ovs-ofctl add-flow br0 in_port=2,action=output:1
# sudo ovs-ofctl add-flow br0 in_port=3,action=output:4
# sudo ovs-ofctl add-flow br0 in_port=4,action=output:3

#Print outputs of dpdk drivers and ovs-vsctl/ovs-ofctl to confirm.
sudo $RTE_SDK/usertools/dpdk-devbind.py -s
sudo /usr/local/bin/ovs-vsctl show
sudo /usr/local/bin/ovs-ofctl -O OpenFlow13 dump-flows br0

#Validate OVS-DPDK
sudo /usr/local/sbin/ovs-vswitchd --version
echo Is DPDK initialized:
sudo /usr/local/bin/ovs-vsctl get Open_vSwitch . dpdk_initialized

#Print number of Hugepages
grep Huge /proc/meminfo