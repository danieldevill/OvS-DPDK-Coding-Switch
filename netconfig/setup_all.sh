#!/bin/bash

#Bash script to setup all other scripts.

sudo ./setup_ovsdpdk.sh ;
sudo ./setup_fpga.sh ;

sudo ./setup_vmhosts.sh ;
sudo ./setup_nichosts.sh ;

sudo ovs-vsctl show
