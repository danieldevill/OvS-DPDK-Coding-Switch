#!/bin/bash

#Bash script to load n number of virtual machines to the virtual side of the network. 
#Usage setup_vmhosts.sh n 

vm_names='A B C D E F G H'
vm_count=0
vm_ram='2048M'

# if pgrep -f "qemu-system-x86_64" > /dev/null
# then
	for vm_name in $vm_names
	do
		if [ $vm_count -lt $1 ]
		then
	 		#Add VM port to OvS bridge.
			sudo /usr/local/bin/ovs-vsctl add-port br0 vhp"$vm_count" -- set Interface vhp"$vm_count" type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient"$vm_count"

			#Start VM
			sudo /usr/local/bin/qemu-system-x86_64 -drive file=/sdata/debian9_"$vm_name".qcow2 -enable-kvm -display none -m size="$vm_ram" \
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
# fi

# if pgrep -f "qemu-system-x86_64" > /dev/null
# then
	for vm_name in $vm_names
	do
		if [ $vm_count -lt $1 ]
		then
	 		#Add VM port to OvS bridge.
			sudo /usr/local/bin/ovs-vsctl add-port br0 vhp"$vm_count" -- set Interface vhp"$vm_count" type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient"$vm_count"
		fi
		vm_count=$((vm_count + 1))
	done
# fi

#sudo ovs-vsctl add-port br0 vhp0 -- set Interface vhp0 type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient0



