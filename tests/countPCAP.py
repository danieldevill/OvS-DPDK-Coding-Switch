from scapy.all import *
import numpy as np


tx_times = []
rx_times = []


#rxtx_deltas = [[] for range(20000)]

print("Reading pcap file..")
#packets = rdpcap('vm2vmtcpdumpEncoderVNF.pcap')
packets = sniff(offline="encoderVNF_e2e.pcap")

print("Reading done.\nAnalyzing captured packets..")
gencount = 0
packetcount = 0

txcount = 0

for packet in packets[:28]:

	if hex(packet[Ether].type) == "0x2020" or hex(packet[Ether].type) == "0x8000":

		print('%s %.30f' % (hex(packet[Ether].type),packet.time))

		if hex(packet[Ether].type) == "0x8000":
			tx_times.append(packet.time)

		if hex(packet[Ether].type) == "0x2020":
			rx_times.append(packet.time)

#print(rxtx_deltas)
if len(tx_times) > len(rx_times):
	#Remove last elements as packets dropped/lost
	tx_times = tx_times[:len(rx_times)]


#Throughput, based on a single generation, and not over the entire test.. but averaged over the test.
#


#Latency
rxtx_deltas = np.array(rx_times) - np.array(tx_times)
print(len(rxtx_deltas))
rxtx_deltas_split = np.array_split(rxtx_deltas,len(rxtx_deltas)/7)
rxtx_deltas_split_avg = [np.mean(arr) for arr in rxtx_deltas_split]
print("Average Latency between received packet and transmitted packets, corresponding to each generation:")
print(np.mean(rxtx_deltas_split_avg))
print("\n")

#Jitter