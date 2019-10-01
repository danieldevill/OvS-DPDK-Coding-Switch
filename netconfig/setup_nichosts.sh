#!/bin/bash

#Export $RTE_SDK
export RTE_SDK=/usr/src/dpdk-stable-18.11.2

#Bring NIC links down to be used by DPDK.
sudo ip link set enp7s0f0 down
sudo ip link set enp7s0f1 down
sudo ip link set enp8s0f0 down
sudo ip link set enp8s0f1 down

#Bind NICs to DPDK
sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp7s0f0
sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp7s0f1
sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp8s0f0
sudo $RTE_SDK/usertools/dpdk-devbind.py --bind=vfio-pci enp8s0f1

#Add ports to OvS
sudo /usr/local/bin/ovs-vsctl add-port br0 enp7s0f0 -- set Interface enp7s0f0 type=dpdk options:dpdk-devargs=0000:07:00.0 ofport_request=1
sudo /usr/local/bin/ovs-vsctl add-port br0 enp7s0f1 -- set Interface enp7s0f1 type=dpdk options:dpdk-devargs=0000:07:00.1 ofport_request=2
sudo /usr/local/bin/ovs-vsctl add-port br0 enp8s0f0 -- set Interface enp8s0f0 type=dpdk options:dpdk-devargs=0000:08:00.0 ofport_request=3
sudo /usr/local/bin/ovs-vsctl add-port br0 enp8s0f1 -- set Interface enp8s0f1 type=dpdk options:dpdk-devargs=0000:08:00.1 ofport_request=4

#Output DPDK and OvS Config
sudo $RTE_SDK/usertools/dpdk-devbind.py -s
sudo /usr/local/bin/ovs-vsctl show