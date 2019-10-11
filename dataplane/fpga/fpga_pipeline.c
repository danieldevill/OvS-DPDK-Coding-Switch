#include <stdio.h>
#include <stdlib.h>

//TUN/TAP
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/if.h>
#include <linux/if_tun.h>

#define RX_BUFFER					100
#define TX_BUFFER					100

//DMA,PCIe
#include <memory.h>
#include "PCIE.h"

#define PCIE_BAR					PCIE_BAR4
#define ENCODER_START				0x4000010
#define CODER_RST				    0x4000020


#define DEMO_PCIE_MEM_ADDR			0x07000000
#define MEM_SIZE					(512) //512KB


//TAP
char tap_name[IFNAMSIZ];
int tapfd;

//Main function
int
main(int argc, char *argv[]) {

	//Input packet counter
	int pkt_in_cnt = 0;
	
	//Create TAP Interface
	strcpy(tap_name,"tapEncoder");
	int tapfd = tap_alloc(tap_name);
	
	//Buffers
	unsigned char tapRXBuffer[RX_BUFFER];
	unsigned char tapTXBuffer[TX_BUFFER];


	//Get packets
	while(1) {

		//Loopback test
		tap_receive(tapfd,tapRXBuffer);
		memcpy(&tapTXBuffer,&tapRXBuffer,TX_BUFFER);
		tap_transmit(tapfd,tapTXBuffer);
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
		const PCIE_LOCAL_ADDRESS LocalAddr = DEMO_PCIE_MEM_ADDR;
		//char *pWrite;
		char *pRead;
		char szError[256];
		char *pWrite;

		pWrite = (char *) malloc(512);
		pRead = (char *) malloc(1024);
		if (!pWrite || !pRead) {
			sprintf(szError, "DMA Memory:malloc failed\r\n");
		}


		// // Read DMA
		// if (bPass) {
		// 	bPass = PCIE_DmaRead(hPCIe, LocalAddr, pRead, 1024);

		// 	if (!bPass) {
		// 		sprintf(szError, "DMA Memory:PCIE_DmaRead failed\r\n");
		// 	} else {
		// 		for (i = 0; i < 1024 && bPass; i++) {
		// 			printf("index:%d read=%xh\n", i,*(pRead + i));
		// 		}
		// 	}
		// }

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
		PCIE_DmaWrite(hPCIe, LocalAddr, pWrite, 512);

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

		// // Read DMA
		// if (bPass) {
		// 	bPass = PCIE_DmaRead(hPCIe, LocalAddr, pRead, 1024);

		// 	if (!bPass) {
		// 		sprintf(szError, "DMA Memory:PCIE_DmaRead failed\r\n");
		// 	} else {
		// 		for (i = 0; i < 1024 && bPass; i++) {
		// 			printf("index:%d read=%xh\n", i,*(pRead + i));
		// 		}
		// 	}
		// }

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
int tap_alloc(char *dev) {
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

	//Set link up
	int callStatus = system("ip link set tapEncoder up");
	//Set MAC address
	callStatus = system("ip link set tapEncoder address 02:01:02:03:04:08");
	//Add to OvS br0
	callStatus = system("ovs-vsctl add-port br0 tapEncoder");

	return fd;

}

/* Receive packets from tap device. 
   Takes number of packets and Buffer
   as input and returns 1 on success 
   or 0 on failure.
*/
int tap_receive(int tapfd, unsigned char* tapBuffer)
{
	int nread = read(tapfd,tapBuffer,RX_BUFFER);

	if (nread > 0) {
		printf("Rx: %d bytes\n", nread, tap_name);
		uint i;
		for (i = 0; i < RX_BUFFER; i++) {
			printf("%02X ",*(tapBuffer + i));
		}
		printf("\n\n");
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
int tap_transmit(int tapfd, unsigned char* tapBuffer)
{
	int nwrite = write(tapfd,tapBuffer,TX_BUFFER);

	if (nwrite > 0) {
		printf("Tx: %d bytes\n", nwrite, tap_name);
		uint i;
		for (i = 0; i < TX_BUFFER; i++) {
			printf("%02X ",*(tapBuffer + i));
		}
		printf("\n\n");
	}
	else if(nwrite < 0) {
		perror("Writing from interface");
		close(tapfd);
		exit(1);
	}	
}