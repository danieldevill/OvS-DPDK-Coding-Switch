#!/bin/bash

#Bash script to setup all other scripts.

~/netconfig/setup_ovsdpdk.sh
~/netconfig/setup_vmhosts.sh 4
~/netconfig/setup_coding.sh

sudo ovs-vsctl show