import os
import sys

interval=sys.argv[1]
testsize=4
hosts = ["debA","debB","debC","debD"]
mcstaddrs = [67,68,69,70]
streamer =  {mcstaddrs[0]:"",mcstaddrs[1]:"",mcstaddrs[2]:"",mcstaddrs[3]:""}
streamdata = {"interval":"average","transfer":0.0,"bandwidth":0.0,"jitter":0.0,"lost":0,"total":0,"perct_lost":0.0}

fres = open("/home/daniel/Working/OvS-DPDK-Coding-Switch/tests/multicast_"+str(testsize)+"streams.results","w")

#iperf CSV fields: timestamp, source_address, source_port, destination_address, destination port, stream id, interval, transferred_bytes, bits_per_second, jitter, lost datagrams, total datagrams, % loss.

for mcstaddr in mcstaddrs:
	fout="\nMulticast stream: 224.0.67."+str(mcstaddr)
	fout+="\n           [ Interval ]  [Transfer]    [Bandwidth]     [Jitter]   [Lost/Total Datagrams]"
	av_transfer = 0
	av_bandwidth = 0
	av_jitter = 0
	av_lost = 0
	av_total = 0
	for host in hosts:
		filename="/home/daniel/Working/OvS-DPDK-Coding-Switch/tests/testdata/"+host+"_mcst"+str(testsize)+"_"+str(mcstaddr)
		try:
			f = open(filename,"r")
			strsrt = f.readline()
			while ("0.0-"+str(interval)+".0") not in  strsrt: #
				strsrt = f.readline()
				print(strsrt)
			#Split csv line
			strsrt = strsrt.split(",") #Split row into each field.
			print(strsrt)
			av_transfer+=float(strsrt[7])/1000000
			av_bandwidth+=float(strsrt[8])/1000000
			av_jitter+=float(strsrt[9])
			av_lost+=float(strsrt[10])
			av_total+=float(strsrt[11])
			fout+=("\n -> "+host+"    "+strsrt[6]+"sec  "+str(round(float(strsrt[7])/1000000,3))+" MBytes  "+str(round(float(strsrt[8])/1000000,3))+" Mbits/sec  "+strsrt[9]+" ms       "+strsrt[10]+"/"+strsrt[11]+"("+strsrt[12]+"%)")
			f.close()
		except IOError:
			print("Error with testdata file")
	streamdata["transfer"]=round(av_transfer/len(hosts),3)
	streamdata["bandwidth"]=round(av_bandwidth/len(hosts),3)	
	streamdata["jitter"]=round(av_jitter/len(hosts),3)	
	streamdata["lost"]=round(av_lost/len(hosts),3)
	streamdata["total"]=round(av_total/len(hosts),3)
	streamdata["perct_lost"]=round(100*streamdata["lost"]/streamdata["total"],2)
	fout+="\n "+streamdata["interval"]+"                "+str(streamdata["transfer"])+" MBytes   "+str(streamdata["bandwidth"])+" Mbits/sec  "+str(streamdata["jitter"])+" ms      "+str(streamdata["lost"])+"/"+str(streamdata["total"])+"("+str(streamdata["perct_lost"])+"%)"
	fout+="\n"
	fres.write(fout)
fres.close()
