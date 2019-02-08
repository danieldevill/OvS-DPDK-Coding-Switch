#!/bin/bash

#Bash script to load n number of virtual machines to the virtual side of the network. 
#Usage setup_vmhosts.sh n 

vm_names='A B C D E F G H'
vm_count=0

for vm_name in $vm_names
do
	if [ $vm_count -lt $1 ]
	then
		#Start VM
		sudo qemu-system-x86_64 ~/vm-images/debian9_"$vm_name".qcow2 -accel kvm -display none -m size=128M -cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic -device e1000,vlan=0 -net user,name=net"$vm_name",vlan=0,hostfwd=tcp::1000"$vm_count"-:22 -device e1000,vlan=1,mac=de:ad:be:ef:00:0"$vm_count" -net tap,vlan=1,ifname=deb"$vm_count"_tap,script=no,downscript=no &
 		#Add VM port to OvS bridge.
	fi
	vm_count=$((vm_count + 1))
done

