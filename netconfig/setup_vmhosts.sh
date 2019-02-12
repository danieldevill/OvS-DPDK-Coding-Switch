#!/bin/bash

#Bash script to load n number of virtual machines to the virtual side of the network. 
#Usage setup_vmhosts.sh n 

vm_names='A B C D E F G H'
vm_count=0
vm_ram='128M'

for vm_name in $vm_names
do
	if [ $vm_count -lt $1 ]
	then
 		#Add VM port to OvS bridge.
		sudo ovs-vsctl add-port br0 vhp"$vm_count" -- set Interface vhp"$vm_count" type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient"$vm_count"
		echo 
		#Start VM
		sudo qemu-system-x86_64 -drive file=~/vm-images/debian9_"$vm_name".qcow2 -accel kvm -display none -m size="$vm_ram" \
			-cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic \
			-netdev user,id=hostnet"$vm_name",hostfwd=tcp::1002"$vm_count"-:22 \
			-device e1000,netdev=hostnet"$vm_name" \
			-chardev socket,id=char"$vm_count",path=/tmp/dpdkvhostclient"$vm_count",server \
			-netdev type=vhost-user,id=net"$vm_count",chardev=char"$vm_count",vhostforce \
			-device virtio-net-pci,mac=de:ad:be:ef:00:0"$vm_count",netdev=net"$vm_count" \
			-object memory-backend-file,id=mem,size="$vm_ram",mem-path=/dev/hugepages,share=on \
			-numa node,memdev=mem -mem-prealloc &
	fi
	vm_count=$((vm_count + 1))
done

