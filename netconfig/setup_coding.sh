#!/bin/bash

#Bash script to setup OvS coding ports.

coders='0 1 2' #Port IDs for encoder, decoder and recoder respectively.
for coder in $coders
do 
	#Add each port to OvS bridge.
	sudo ovs-vsctl add-port br0 dpdkr"$coder"0  -- set Interface dpdkr"$coder"0 type=dpdkr
	sudo ovs-vsctl add-port br0 dpdkr"$coder"1  -- set Interface dpdkr"$coder"1 type=dpdkr
done
