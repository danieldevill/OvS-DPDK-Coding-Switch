import os
import sys
import matplotlib.pyplot as plt
import numpy as np
from collections import defaultdict

interval=sys.argv[1]
testsize=4
session_data = defaultdict(list)
hosts = ["debA","debB","debC","debD"]
mcstaddrs = ["224.0.67.67","224.0.67.68","224.0.67.69","224.0.67.70"]
streamer =  {mcstaddrs[0]:"",mcstaddrs[1]:"",mcstaddrs[2]:"",mcstaddrs[3]:""}
streamdata = {"interval":"average","transfer":0.0,"bandwidth":0.0,"jitter":0.0,"lost":0,"total":0,"perct_lost":0.0}

fres = open("/home/daniel/Working/OvS-DPDK-Coding-Switch/tests/multicast_"+str(testsize)+"streams.results","w")

#iperf CSV fields: timestamp, source_address, source_port, destination_address, destination port, stream id, interval, transferred_bytes, bits_per_second, jitter, lost datagrams, total datagrams, % loss.

for mcstaddr in mcstaddrs:
	fout="\n"+str(mcstaddr)
	av_transfer = 0
	av_bandwidth = 0
	av_jitter = 0
	av_lost = 0
	av_total = 0
	hosts_data = defaultdict(list)
	for host in hosts:
		filename="/home/daniel/Working/OvS-DPDK-Coding-Switch/tests/testdata/"+host+"_mcst"+str(testsize)+"_"+str(mcstaddr)[9:]
		try:
			f = open(filename,"r")
			strsrt = f.readline()
			while ("0.0-"+str(interval)+".0") not in  strsrt: #
				strsrt = f.readline()
			#Split csv line
			strsrt = strsrt.split(",") #Split row into each field.
			av_transfer+=float(strsrt[7])/1000000
			av_bandwidth+=float(strsrt[8])/1000000
			av_jitter+=float(strsrt[9])
			av_lost+=float(strsrt[10])
			av_total+=float(strsrt[11])
			fout+=("\n"+host+","+strsrt[6]+","+str(round(float(strsrt[7])/1000000,3))+","+str(round(float(strsrt[8])/1000000,3))+","+strsrt[9]+","+strsrt[10]+","+strsrt[11]+","+strsrt[12]+"")
			hosts_data['host'].append(host)
			hosts_data['interval'].append(strsrt[6])
			hosts_data['transfer'].append(str(round(float(strsrt[7])/1000000,3)))
			hosts_data['bandwidth'].append(str(round(float(strsrt[8])/1000000,3)))
			hosts_data['jitter'].append(strsrt[9])
			hosts_data['lost'].append(strsrt[10])
			hosts_data['total'].append(strsrt[11])
			hosts_data['perct_lost'].append(strsrt[12])
			f.close()
		except IOError:
			print("Error with testdata file")
	session_data[mcstaddr].append(hosts_data)
	streamdata["transfer"]=round(av_transfer/len(hosts),3)
	streamdata["bandwidth"]=round(av_bandwidth/len(hosts),3)	
	streamdata["jitter"]=round(av_jitter/len(hosts),3)	
	streamdata["lost"]=round(av_lost/len(hosts),3)
	streamdata["total"]=round(av_total/len(hosts),3)
	streamdata["perct_lost"]=round(100*streamdata["lost"]/streamdata["total"],2)
	fout+="\n"+streamdata["interval"]+",0.0-"+str(interval)+".0,"+str(streamdata["transfer"])+","+str(streamdata["bandwidth"])+","+str(streamdata["jitter"])+","+str(streamdata["lost"])+","+str(streamdata["total"])+","+str(streamdata["perct_lost"])
	fout+="\n"
	fres.write(fout)
fres.close()

#Plot bar graphs
def plot_bar_x():
	index = np.arange(len(hosts))
	plt.bar(index, list(map(float,session_data['224.0.67.67'][0]['lost'])))
	plt.xlabel('Hosts')
	plt.ylabel('Transfer')
	plt.xticks(index, hosts)
	plt.title('Transfer rate of 224.0.67.67 session')
	plt.show()
	print(index)

#print(session_data)
plot_bar_x()
print(session_data['224.0.67.67'][0]['lost'])


