#!/bin/bash

vm_name=EN 
vm_ram='8196M'
vm_lcores=4
vm_count=9

sudo killall qemu-system-x86_64

sudo rm /tmp/dpdkvhostclient"$vm_count"
sudo /usr/local/bin/ovs-vsctl del-port br0 vhp"$vm_count"
sudo /usr/local/bin/ovs-vsctl add-port br0 vhp"$vm_count" -- set Interface vhp"$vm_count" type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient"$vm_count"

#Start VM #Debug -nographic -serial mon:stdio
sudo qemu-system-x86_64 -hda /sdata/encoderVNF.qcow2 -enable-kvm -serial mon:stdio \
	-m "$vm_ram" \
	-cpu host,+ssse3,+sse4.1,+sse4.2,+x2apic \
	-smp "$vm_lcores" \
	-netdev user,id=hostnet"$vm_name",hostfwd=tcp::10029-:22 \
	-device e1000,netdev=hostnet"$vm_name" \
	# -boot d \
	# -cdrom ~/ISOs/ubuntu-18.04.1.0-live-server-amd64.iso \
	-chardev socket,id=char"$vm_count",path=/tmp/dpdkvhostclient"$vm_count",server \
	-netdev type=vhost-user,id=net"$vm_count",chardev=char"$vm_count",vhostforce \
	-device virtio-net-pci,mac=de:ad:be:ef:00:0"$vm_count",netdev=net"$vm_count" \
	-object memory-backend-file,id=mem,size="$vm_ram",mem-path=/dev/hugepages,share=on \
	-numa node,memdev=mem -mem-prealloc

