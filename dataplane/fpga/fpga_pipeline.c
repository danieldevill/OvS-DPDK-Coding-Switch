#include <stdio.h>
#include <stdlib.h>

//DMA,PCIe
#include <memory.h>
#include "PCIE.h"

#define PCIE_BAR					PCIE_BAR4
#define ENCODER_START				0x4000010
#define CODER_RST				    0x4000020

#define PCIE_MEM_ADDR			0x07000000
#define MEM_SIZE					(512) //512KB

//TUN/TAP
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/if.h>
#include <linux/if_tun.h>

#define RING_SIZE					7 
#define RX_BUFFER					82 //64 + header + preamble
#define TX_BUFFER					82
#define MAC_ADDR_LEN				6

//TAP
struct ifreq tap;
char tap_name[IFNAMSIZ];
unsigned char if_mac [MAC_ADDR_LEN] = {2, 1, 2, 3, 4,8, 0};;
int tapfd;
//TAP Buffers
unsigned char tapRXBuffer[RX_BUFFER];
unsigned char tapTXBuffer[TX_BUFFER];
unsigned char tapRXBufferQueue[RX_BUFFER*RING_SIZE];
unsigned char tapTXBufferQueue[TX_BUFFER*RING_SIZE];
uint RXcount = 0;
uint TXcount = 0;
uint RXDone = 0;
uint TXDone = 0;


//Normally a ring buffer should be used. For this proof on concept h buffers are made.

//Main function
int
main(int argc, char *argv[]) {

	//Input packet counter
	int pkt_in_cnt = 0;
	
	//Create TAP Interface
	strcpy(tap_name,"tapEncoder");
	int tapfd = tap_encoder_alloc(tap_name);
	
	//Get packets until pkt count is = h
	while(RXDone == 0) {

		//Loopback test
		tap_encoder_receive(tapfd,tapRXBuffer);
		memcpy(&tapTXBuffer,&tapRXBuffer,TX_BUFFER);
		tap_encoder_transmit(tapfd,tapTXBuffer);
	}

	FILE *ptr_pkts_in;
	ptr_pkts_in = fopen("packets_in.txt","r");

	void *lib_handle;
	PCIE_HANDLE hPCIe;
	uint bQuit = 0;

	//Load PCIe driver.
	lib_handle = PCIE_Load();
	if (!lib_handle) {
		printf("PCIE_Load failed!\r\n");
		return 0;
	}

	//Open PCIe connection.
	hPCIe = PCIE_Open(DEFAULT_PCIE_VID, DEFAULT_PCIE_DID, 0);
	if (!hPCIe) {
		printf("PCIE_Open failed\r\n");
	} 
	else {
		printf("PCIE_Open success\r\n");
		
		int bPass = 1;
		int i;
		const int nTestSize = MEM_SIZE;
		const PCIE_LOCAL_ADDRESS LocalAddr = PCIE_MEM_ADDR;
		const PCIE_LOCAL_ADDRESS LocalAddr1 = PCIE_MEM_ADDR+512;

		//char *pWrite;
		char *pRead;
		char szError[256];
		char *pWrite;

		pWrite = (char *) malloc(512);
		pRead = (char *) malloc(1024);
		if (!pWrite || !pRead) {
			sprintf(szError, "DMA Memory:malloc failed\r\n");
		}

		//Write
		//for (i = 0; i < nTestSize && bPass; i++)
		uint32_t file_count = 0;
		char hex[9];
		while(fscanf(ptr_pkts_in,"%s",hex) != EOF) {
			uint32_t num = (uint32_t)strtol(hex, NULL, 16);
			
			pWrite[3 + (4*file_count)] = (num >> 24) & 0xFF;
			pWrite[2 + (4*file_count)] = (num >> 16) & 0xFF;
			pWrite[1 + (4*file_count)] = (num >> 8) & 0xFF;
			pWrite[0 + (4*file_count)] = (num) & 0xFF;
			
			//printf("%s %X %d %X %X %X %X\n",hex, num, sizeof(pWrite), pWrite[0], pWrite[1],pWrite[2],pWrite[3]);
			
			file_count+=1;
		}
		PCIE_DmaWrite(hPCIe, LocalAddr, pWrite, MEM_SIZE);

		//Write from Packet
		// unsigned char* readPtr = tapRXBufferQueue;
		// uint h;
		// for (h = 0;h<RING_SIZE;h++) {
		// 	//Get packet data
		//     uint i;
		// 	for (i = 0; i < RX_BUFFER; i++) {
		// 		printf("%02X ",*(readPtr + i + (h*RX_BUFFER)));
		// 	}
		// 	printf("\n\n");
		// }
		PCIE_DmaWrite(hPCIe, LocalAddr1, tapRXBufferQueue, MEM_SIZE);

		//sleep(2);

		//Start Encoder
		/*bPass = PCIE_Write32(hPCIe, PCIE_BAR, ENCODER_START,
			(uint32_t) 1);
		if (bPass)
			printf("Start Encoder\n");*/

		//Reset
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 0);
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 1);
		if (bPass)
			printf("Reset\n");

		//sleep(10);

		// Read DMA
		if (bPass) {
			bPass = PCIE_DmaRead(hPCIe, LocalAddr, pRead, 1024);

			if (!bPass) {
				sprintf(szError, "DMA Memory:PCIE_DmaRead failed\r\n");
			} else {
				for (i = 0; i < 1024 && bPass; i++) {
					printf("index:%d read=%xh\n", i,*(pRead + i));
				}
			}
		}

		// free resource
		/*if (pWrite)
			free(pWrite);*/
		if (pRead)
			free(pRead);

		//Reset
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 0);

		PCIE_Close(hPCIe);
	}

	return 0;
}

/* Creates non-persisten TAP interface
   Taken From tuntap.txt
   Multiqueue does exist if using 
   greater than x1 PCIe.
*/
int tap_encoder_alloc(char *dev) {
	struct ifreq ifr;
	int fd, err;

	if( (fd = open("/dev/net/tun", O_RDWR)) < 0 )
	   return fd;

	memset(&ifr, 0, sizeof(ifr));

	/* Flags: IFF_TUN   - TUN device (no Ethernet headers) 
	 *        IFF_TAP   - TAP device  
	 *
	 *        IFF_NO_PI - Do not provide packet information  
	 */ 
	ifr.ifr_flags = IFF_TAP; 
	if( *dev )
	   strncpy(ifr.ifr_name, dev, IFNAMSIZ);

	if( (err = ioctl(fd, TUNSETIFF, (void *) &ifr)) < 0 ){
	   close(fd);
	   return err;
	}
	strcpy(dev, ifr.ifr_name);

	if(ioctl(fd, TUNSETPERSIST, 0) < 0){
		perror("dssabling TUNSETPERSIST");
	    exit(1);
	}

	//Set link up ; Set MAC address ; Add to OvS br0
	int callStatus = system("ip link set tapEncoder up; ip link set tapEncoder address 02:01:02:03:04:08; ovs-vsctl add-port br0 tapEncoder");
	
	printf("Link Up.\n");
	return fd;

}

/* Inspect Incoming packets.
   Not all packets on TAP 
   are for NC so check first.
*/
int tap_pkt_inspection(unsigned char* tapBuffer)
{
	unsigned char dst_mac [MAC_ADDR_LEN];
	memcpy(dst_mac,tapBuffer+4,MAC_ADDR_LEN);

	if (memcmp(dst_mac,if_mac,MAC_ADDR_LEN) == 0) {
		return 1;
	}

	return 0;
}

/* 

*/
int tap_encoder_packetize()
{

}

/* Receive packets from tap device. 
   Takes number of packets and Buffer
   as input and returns 1 on success 
   or 0 on failure.
*/
int tap_encoder_receive(int tapfd, unsigned char* tapBuffer)
{
	int nread = read(tapfd,tapBuffer,RX_BUFFER);

	if (nread > 0) {

		//Inspect for correct dst_addr
		int pkt_inspc = tap_pkt_inspection(tapBuffer);
		if (pkt_inspc == 1) {
			//Add packet to queue
			memcpy(tapRXBufferQueue+((RXcount)*RX_BUFFER),tapBuffer,RX_BUFFER);

			RXcount++;

			//Begin Using Packets
			if (RXcount == RING_SIZE) {
				RXcount = 0;
				//Get each packet 
				unsigned char* readPtr = tapRXBufferQueue;
				uint h;
				for (h = 0;h<RING_SIZE;h++) {
					//Get packet data
				    uint i;
					for (i = 0; i < RX_BUFFER; i++) {
						printf("%02X ",*(readPtr + i + (h*RX_BUFFER)));
					}
					printf("\n\n");
				}
			
				RXDone = 1;
			}
		}
	}
	else if(nread < 0) {
		perror("Reading from interface");
		close(tapfd);
		exit(1);
	}
}

/* Transmit packets from tap device. 
   Takes number of packets and Buffer
   as input and returns 1 on success 
   or 0 on failure.
*/
int tap_encoder_transmit(int tapfd, unsigned char* tapBuffer)
{
	int nwrite = write(tapfd,tapBuffer,TX_BUFFER);

	if (nwrite > 0) {
		// printf("Tx: %d bytes\n", nwrite, tap_name);
		// uint i;
		// for (i = 0; i < TX_BUFFER; i++) {
		// 	printf("%02X ",*(tapBuffer + i));
		// }
		// printf("\n\n");
	}
	else if(nwrite < 0) {
		perror("Writing from interface");
		close(tapfd);
		exit(1);
	}	
}