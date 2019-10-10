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

//DMA,PCIe
#include <memory.h>
#include "PCIE.h"

#define PCIE_BAR					PCIE_BAR4
#define ENCODER_START				0x4000010
#define CODER_RST				    0x4000020


#define DEMO_PCIE_MEM_ADDR			0x07000000
#define MEM_SIZE					(512) //512KB

/*
 * Application main function
 */
int
main(int argc, char *argv[])
{
	//Create TAP Interface
	char tap_name[IFNAMSIZ];
	strcpy(tap_name,"tapEncoder");
	int tapfd = tun_alloc(tap_name);
	char tapBuffer[1500];



	//Test tx to tap device.
	while(1) {
		
		int nread = read(tapfd,tapBuffer,sizeof(tapBuffer));
		if(nread < 0) {
			perror("Reading from interface");
			close(tapfd);
			exit(1);
		}
		else if (nread > 0) {
			uint i;
			for (i = 0; i < sizeof(tapBuffer); i++) {
				printf("%x ",*(tapBuffer + i));
			}
			printf("\n\n");
		}

	}


	FILE *ptr_pkts_in;
	ptr_pkts_in = fopen("packets_in.txt","r");

	void *lib_handle;
	PCIE_HANDLE hPCIe;
	uint bQuit = 0;

	//Load PCIe driver.
	lib_handle = PCIE_Load();
	if (!lib_handle) 
	{
		printf("PCIE_Load failed!\r\n");
		return 0;
	}

	//Open PCIe connection.
	hPCIe = PCIE_Open(DEFAULT_PCIE_VID, DEFAULT_PCIE_DID, 0);
	if (!hPCIe) 
	{
		printf("PCIE_Open failed\r\n");
	} 
	else 
	{
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
		while(fscanf(ptr_pkts_in,"%s",hex) != EOF)
		{
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
/*		bPass = PCIE_Write32(hPCIe, PCIE_BAR, ENCODER_START,
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
/*		if (pWrite)
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

//From tuntap.txt
//Multiqueue does exist if using greater than x1 PCIe
int tun_alloc(char *dev)
{
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
		perror("enabling TUNSETPERSIST");
	    exit(1);
	}


	return fd;

}