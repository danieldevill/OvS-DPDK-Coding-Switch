from scapy.all import *
import numpy as np


tx_times = []
rx_times = []


#rxtx_deltas = [[] for range(20000)]

print("Reading pcap file..")
#packets = rdpcap('vm2vmtcpdumpEncoderVNF.pcap')
packets = sniff(offline=str(sys.argv[1]))

print("Reading done.\nAnalyzing captured packets..")
gencount = 0
packetcount = 0

txcount = 0

for packet in packets:

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
#7 packets x (64 + headers!?) bytes / rx_time[6] - tx_times[0]. Gives the overall throughput over the entire packet transfer period.
#Or is it from packet to packet?
throughputs_t = []
pkt_count = 0
for i,tx in enumerate(tx_times):
	if  i % 7 == 0:
		throughputs_t.append(rx_times[i+6] - tx)
print("Throughput  times:")
print(np.mean(np.array(throughputs_t)))


#Latency
rxtx_deltas = np.array(rx_times) - np.array(tx_times)
print(len(rxtx_deltas))
rxtx_deltas_split = np.array_split(rxtx_deltas,len(rxtx_deltas)/7)
rxtx_deltas_split_avg = [np.mean(arr) for arr in rxtx_deltas_split]
print("Average Latency between received packet and transmitted packets, corresponding to each generation:")
print(np.mean(rxtx_deltas_split_avg))
print("\n")

#Jitter