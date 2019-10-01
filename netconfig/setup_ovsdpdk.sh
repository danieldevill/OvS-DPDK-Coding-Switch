#!/bin/bash

#Start OVS with DPDK setup.

#Export $RTE_SDK
export RTE_SDK=/usr/src/dpdk-stable-18.11.2

#Clean ovs enviroment
sudo killall ovsdb-server ovs-vswitchd
sudo rm -f /var/run/openvswitch/vhost-user*
sudo rm -f /etc/openvswitch/conf.db

#Enable PMD
sudo modprobe vfio-pci

#Start ovsdb
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
sudo /usr/local/sbin/ovsdb-server --remote=punix:$DB_SOCK --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile --detach

#Start OVS with dpdk config enabled
echo Starting OVS with dpdk config enabled..
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socket-mem=512,0
sudo /usr/local/bin/ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-lcore-mask=0x4 #Set non-datapath OVS-DPDK threads such as handler and revalidator to core 2
sudo /usr/local/share/openvswitch/scripts/ovs-ctl --no-ovsdb-server --db-sock="$DB_SOCK" start
sudo /usr/local/sbin/ovs-vswitchd unix:$DB_SOCK --pidfile --detach --log-file=/var/log/openvswitch/ovs-vswitchd.log

#Create OVS-DPDK Bridge
echo Adding bridge br0..
sudo /usr/local/bin/ovs-vsctl --if-exists del-br br0
sudo /usr/local/bin/ovs-vsctl add-br br0 -- set bridge br0 datapath_type=netdev

#Set Controller to Ryu
sudo /usr/local/bin/ovs-vsctl set-controller br0 tcp:10.10.11.117:6633

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