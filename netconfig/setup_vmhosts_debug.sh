#!/bin/bash

vm_name=A 
vm_ram='1024M'
vm_count=0

sudo killall qemu-system-x86_64

sudo rm /tmp/dpdkvhostclient"$vm_count"
sudo /usr/local/bin/ovs-vsctl del-port br0 vhp"$vm_count"
sudo /usr/local/bin/ovs-vsctl add-port br0 vhp"$vm_count" -- set Interface vhp"$vm_count" type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient"$vm_count"

#Start VM #Debug -nographic -serial mon:stdio
sudo qemu-system-x86_64 -hda /sdata/encoderVNF.qcow2 -enable-kvm -nographic -serial mon:stdio -m "$vm_ram" \
	-cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic \
	-netdev user,id=hostnet"$vm_name",hostfwd=tcp::1002"$vm_count"-:22 \
	-device e1000,netdev=hostnet"$vm_name" \
	# -chardev socket,id=char"$vm_count",path=/tmp/dpdkvhostclient"$vm_count",server \
	# -netdev type=vhost-user,id=net"$vm_count",chardev=char"$vm_count",vhostforce \
	# -device virtio-net-pci,mac=de:ad:be:ef:00:0"$vm_count",netdev=net"$vm_count" \
	# -object memory-backend-file,id=mem,size="$vm_ram",mem-path=/dev/hugepages,share=on \
	# -numa node,memdev=mem -mem-prealloc
