#!/bin/bash

#Bash script to setup OvS coding ports.

# coders='1 2 3' #Port IDs for encoder, decoder and recoder respectively.
# for coder in $coders
# do 
# 	#Add each port to OvS bridge.
# 	sudo ovs-vsctl add-port br0 dpdkr"$coder"0  -- set Interface dpdkr"$coder"0 type=dpdkr
# 	sudo ovs-vsctl add-port br0 dpdkr"$coder"1  -- set Interface dpdkr"$coder"1 type=dpdkr

# done

#Temp add flows for dpdkr ports. 
#Send all packets to encoder.
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp0",ip_proto="17",actions=output:"dpdkr10"
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp1",ip_proto="17",actions=output:"dpdkr10"
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp2",ip_proto="17",actions=output:"dpdkr10"
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp3",ip_proto="17",actions=output:"dpdkr10"
# Send encoded packets to decoder.
# sudo ovs-ofctl add-flow br0 in_port="dpdkr11",actions=output:"dpdkr20"
# Send decoded packets to multicast hosts.
# sudo ovs-ofctl add-flow br0 in_port="dpdkr21",dl_dst="01:00:5e:00:43:43",actions=output:"vhp0",output:"vhp1",output:"vhp2",output:"vhp3"
# sudo ovs-ofctl add-flow br0 in_port="dpdkr21",dl_dst="01:00:5e:00:43:44",actions=output:"vhp0",output:"vhp1",output:"vhp2",output:"vhp3"
# sudo ovs-ofctl add-flow br0 in_port="dpdkr21",dl_dst="01:00:5e:00:43:45",actions=output:"vhp0",output:"vhp1",output:"vhp2",output:"vhp3"
# sudo ovs-ofctl add-flow br0 in_port="dpdkr21",dl_dst="01:00:5e:00:43:46",actions=output:"vhp0",output:"vhp1",output:"vhp2",output:"vhp3"

#Temp add vhost-user ports and flows for vhost-user ports.
sudo ovs-vsctl add-port br0 dpdkvhostclient20 -- set Interface dpdkvhostclient20 type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient20
sudo ovs-vsctl add-port br0 dpdkvhostclient21 -- set Interface dpdkvhostclient21 type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient21
sudo ovs-vsctl add-port br0 dpdkvhostclient22 -- set Interface dpdkvhostclient22 type=dpdkvhostuserclient options:vhost-server-path=/tmp/dpdkvhostclient22
#Send all packets to encoder.
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp0",ip_proto="17",actions=output:9,output:10,output:11
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp1",ip_proto="17",actions=output:9,output:10,output:11
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp2",ip_proto="17",actions=output:9,output:10,output:11
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp3",ip_proto="17",actions=output:9,output:10,output:11
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp0",actions=flood
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp1",actions=flood
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp2",actions=flood
# sudo ovs-ofctl add-flow br0 ip,in_port="vhp3",actions=flood