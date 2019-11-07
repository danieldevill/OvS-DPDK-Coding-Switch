#include <stdio.h>
#include <stdlib.h>

//DMA,PCIe
#include <memory.h>
#include "PCIE.h"

#define PCIE_BAR					PCIE_BAR4
#define ENCODER_START				0x4000010
#define CODER_RST				    0x4000020

#define PCIE_MEM_ADDR_RX			0x07000000 //MEM RX from PC -> FPGA
#define PCIE_MEM_ADDR_TX			0x07000200 //MEM TX from FPGA -> PC
#define PCIE_MEM_ADDR_COEFF			0x07000400 //MEM COEFF. If encoder: FPGA -> PC, If decoder: PC -> FPGA


#define MEM_SIZE					512 //512KB
#define MEM_SIZE_COEF				64 //64KB

//TUN/TAP
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <linux/if.h>
#include <linux/if_tun.h>

#define RING_SIZE					7
#define RX_BUFFER					64
#define TX_BUFFER					64
#define COEFF_BUFFER				7
#define MAC_ADDR_LEN				6
#define TAP_HDR_LEN					18
#define ETH_TYPE_LEN				2

//TAP
struct ifreq tap;
char tap_name[IFNAMSIZ];
unsigned char if_mac[MAC_ADDR_LEN] = {2, 1, 2, 3, 4,8, 0};
unsigned char nc_type[2] = {0x20,0x20};
unsigned char src_mac[MAC_ADDR_LEN];
int tapfd;
//TAP Buffers
unsigned char tapRXBuffer[RX_BUFFER] = {0};
unsigned char tapTXBuffer[TX_BUFFER] = {0};
unsigned char coeffBuffer[COEFF_BUFFER] = {0};
unsigned char tapRXBufferQueue[RX_BUFFER*RING_SIZE] = {0};
unsigned char tapTXBufferQueue[TX_BUFFER*RING_SIZE] = {0};
unsigned char coeffBufferQueue[COEFF_BUFFER*RING_SIZE] = {0};
uint RXcount = 0;
uint TXcount = 0;
uint RXDone = 0;
uint TXDone = 0;

//Main function
int
main(int argc, char *argv[]) {

	//Check for arv, else stop.
	if(argc < 2) {
		printf("fpga_pipeline: No coder specified.\n Usage: fpga_pipeline <coder>\n");
		return 0;
	}
	else if(strcmp("encoder",argv[1]) == 0) {
		printf("Encoder interface begin.\n");
		
		//Create TAP Interface
		strcpy(tap_name,"tapEncoder");
		int tapfd = tap_alloc(tap_name);
		
		//Get packets until pkt count is = h
		while(RXDone == 0) {
			tap_encoder_receive(tapfd,tapRXBuffer);
		}

		//Load PCIe driver.
		void *lib_handle;
		PCIE_HANDLE hPCIe;
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
			const PCIE_LOCAL_ADDRESS LocalAddr = PCIE_MEM_ADDR_RX;

			unsigned char *pRead;
			char szError[256];

			pRead = (char *) malloc(1024);

			//Write RX Packet Generation block to DMA.
			printf("Write to DMA.\n");
			PCIE_DmaWrite(hPCIe, LocalAddr, tapRXBufferQueue, MEM_SIZE);

			//Reset coder entity on FPGA. This will begin the coding process.
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 0);
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 1);
			if (bPass)
				printf("Reset Coder\n");

			// Read DMA results.
			if (bPass) {
				bPass = PCIE_DmaRead(hPCIe, LocalAddr, pRead, MEM_SIZE*2);

				if (!bPass) {
					sprintf(szError, "DMA Memory:PCIE_DmaRead failed\r\n");
				} else {
					int lnbr = 0;
					printf("Read from DMA:\n0000: ");
					for (i = 0; i < 1024 && bPass; i++) {
						printf("%02X ",*(pRead + i));
						lnbr++;
						if(lnbr==4)
						{
							lnbr = 0;
							printf("\n%04d: ",i);
						}

					}
				}

				//Cpy RESULTS read to tapTXBufferQueue
				memcpy(tapTXBufferQueue,pRead+MEM_SIZE,MEM_SIZE);
				//Cpy COEFFS to coeffbufferqueue
				memcpy(coeffBufferQueue,pRead+MEM_SIZE,MEM_SIZE);

				//Transmit encoded packets
				tap_encoder_transmit(tapfd,tapTXBufferQueue);
			}

			// free resource
			if (pRead)
				free(pRead);

			//Set encoder to 0.
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 0);

			PCIE_Close(hPCIe);
		}

		return 0;
	}
	else if(strcmp("decoder",argv[1]) == 0) {
		printf("Decoder interface begin.\n");
		
		//Create TAP Interface
		strcpy(tap_name,"tapDecoder");
		int tapfd = tap_alloc(tap_name);
		
		//Get packets until pkt count is = h
		while(RXDone == 0) {
			tap_decoder_receive(tapfd,tapRXBuffer);
		}

		//Load PCIe driver.
		void *lib_handle;
		PCIE_HANDLE hPCIe;
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
			const PCIE_LOCAL_ADDRESS LocalAddr = PCIE_MEM_ADDR_RX;

			unsigned char *pRead;
			char szError[256];

			pRead = (char *) malloc(1024);

			//Write RX Packet Generation block via DMA.
			printf("Write to DMA.\n");
			PCIE_DmaWrite(hPCIe, LocalAddr, tapRXBufferQueue, MEM_SIZE);

			//Write RX Packet Coefficients via DMA.
			PCIE_DmaWrite(hPCIe, LocalAddr, tapRXBufferQueue, MEM_SIZE);
			
			//Reset coder entity on FPGA. This will begin the coding process.
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 0);
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 1);
			if (bPass)
				printf("Reset Coder\n");

			// Read DMA results.
			if (bPass) {
				bPass = PCIE_DmaRead(hPCIe, LocalAddr, pRead, MEM_SIZE*2);

				if (!bPass) {
					sprintf(szError, "DMA Memory:PCIE_DmaRead failed\r\n");
				} else {
					int lnbr = 0;
					printf("Read from DMA:\n0000: ");
					for (i = 0; i < 1024 && bPass; i++) {
						printf("%02X ",*(pRead + i));
						lnbr++;
						if(lnbr==4)
						{
							lnbr = 0;
							printf("\n%04d: ",i);
						}

					}
				}

				//Cpy RESULTS read to tapTXBufferQueue
				memcpy(tapTXBufferQueue,pRead+MEM_SIZE,MEM_SIZE);

				//Transmit encoded packets
				tap_decoder_transmit(tapfd,tapTXBufferQueue);
			}

			// free resource
			if (pRead)
				free(pRead);

			//Set encoder to 0.
			bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
				(uint32_t) 0);

			PCIE_Close(hPCIe);
		}

		return 0;


	}
	else {
		printf("fpga_pipeline: Incorrect coder specified.\n Usage: fpga_pipeline <coder>\n <coder> must be encoder or decoder.\n");
		return 0;
	}

}

/* Creates non-persisten TAP interface
   Taken From tuntap.txt
   Multiqueue does exist if using 
   greater than x1 PCIe.
*/
int tap_alloc(char *dev) 
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
		perror("dssabling TUNSETPERSIST");
	    exit(1);
	}

	//Set link up ; Set MAC address ; Add to OvS br0
	char command[200];
	snprintf(command,sizeof(command),"ip link set %s up; ip link set %s address 02:01:02:03:04:08; ovs-vsctl add-port br0 %s",dev,dev,dev);
	system(command);
	
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

/* Receive packets from tap device. 
   Takes number of packets and Buffer
   as input and returns 1 on success 
   or 0 on failure.
*/
int tap_encoder_receive(int tapfd, unsigned char* tapBuffer)
{
	int nread = read(tapfd,tapBuffer,RX_BUFFER+TAP_HDR_LEN);

	if (nread > 0) {

		//Inspect for correct dst_addr
		int pkt_inspc = tap_pkt_inspection(tapBuffer);
		if (pkt_inspc == 1) {
			//Add packet to queue
			memcpy(tapRXBufferQueue+(RXcount*RX_BUFFER),tapBuffer+TAP_HDR_LEN,RX_BUFFER);
			//Store source mac
			memcpy(src_mac,tapBuffer+MAC_ADDR_LEN+4,MAC_ADDR_LEN);
			RXcount++;

			//Begin Using Packets
			if (RXcount == RING_SIZE) {
				RXcount = 0;
				//Get each packet 
				printf("Read packet data\n");
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
int tap_encoder_transmit(int tapfd, unsigned char* tapTXBufferQueue)
{
	printf("\nTransmit results\n");

	    uint i;
		for (i = 0; i < MAC_ADDR_LEN; i++) {
			printf("%02X ",*(src_mac+i));
		}
		printf("\n\n");

	//Get each packet 
	unsigned char* readPtr = tapTXBufferQueue;
	uint h;
	for (h = 0;h<RING_SIZE;h++) {
		//Get packet data from encoded block
	 	// uint i;
		// for (i = 0; i < TX_BUFFER; i++) {
		// 	printf("%02X ",*(readPtr + i + (h*TX_BUFFER)));
		// }
		// printf("\n\n");
	
		unsigned char *tapBuffer = (unsigned char *) malloc(1024); //Buffer to store packet encoded packet with generation.

		memcpy(tapBuffer,src_mac,MAC_ADDR_LEN); //Add dst_addr
		memcpy(tapBuffer+MAC_ADDR_LEN,if_mac,MAC_ADDR_LEN); //Add src_addr
		memcpy(tapBuffer+(2*MAC_ADDR_LEN),nc_type,ETH_TYPE_LEN); //Add eth_type
		memcpy(tapBuffer+(2*MAC_ADDR_LEN)+ETH_TYPE_LEN,coeffBufferQueue+(h*COEFF_BUFFER),COEFF_BUFFER); //Add coef_vector
		memcpy(tapBuffer+(2*MAC_ADDR_LEN)+ETH_TYPE_LEN+COEFF_BUFFER,tapTXBufferQueue+(h*TX_BUFFER),TX_BUFFER); //Add encoded_data

		//Transmit packets
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

	//Packetize results
	return 0;
}

/* Receive packets from tap device. 
   Takes number of packets and Buffer
   as input and returns 1 on success 
   or 0 on failure.
*/
int tap_decoder_receive(int tapfd, unsigned char* tapBuffer)
{
	int nread = read(tapfd,tapBuffer,RX_BUFFER+TAP_HDR_LEN+COEFF_BUFFER);

	if (nread > 0) {

		//Inspect for correct dst_addr
		int pkt_inspc = tap_pkt_inspection(tapBuffer);
		if (pkt_inspc == 1) {
			//Add packet to queue
			memcpy(tapRXBufferQueue+(RXcount*RX_BUFFER),tapBuffer+TAP_HDR_LEN+COEFF_BUFFER,RX_BUFFER);
			//Add coeffs to queue
			memcpy(coeffBufferQueue+(RXcount*COEFF_BUFFER),tapBuffer+TAP_HDR_LEN,COEFF_BUFFER);
			//Store source mac
			memcpy(src_mac,tapBuffer+MAC_ADDR_LEN+4,MAC_ADDR_LEN);

			RXcount++;

			//Begin Using Packets
			if (RXcount == RING_SIZE) {
				RXcount = 0;
				//Get each packet 
				printf("Read packet data\n");
				// /unsigned char* readPtr = tapRXBufferQueue;
				uint h;
				for (h = 0;h<RING_SIZE;h++) {
					//Get packet data
				    uint i;
					for (i = 0; i < RX_BUFFER; i++) {
						printf("%02X ",*(tapRXBufferQueue + i + (h*RX_BUFFER)));
					}
					printf("\n\n");
				}

				printf("Read coeff data\n");
				for (h = 0;h<RING_SIZE;h++) {
					//Get packet data
				    uint i;
					for (i = 0; i < (COEFF_BUFFER); i++) {
						printf("%02X ",*(coeffBufferQueue + i + (h*COEFF_BUFFER)));
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
int tap_decoder_transmit(int tapfd, unsigned char* tapTXBufferQueue)
{
	printf("\nTransmit results\n");

	    uint i;
		for (i = 0; i < MAC_ADDR_LEN; i++) {
			printf("%02X ",*(src_mac+i));
		}
		printf("\n\n");

	//Get each packet 
	unsigned char* readPtr = tapTXBufferQueue;
	uint h;
	for (h = 0;h<RING_SIZE;h++) {
		//Get packet data from encoded block
	 	// uint i;
		// for (i = 0; i < TX_BUFFER; i++) {
		// 	printf("%02X ",*(readPtr + i + (h*TX_BUFFER)));
		// }
		// printf("\n\n");
	
		unsigned char *tapBuffer = (unsigned char *) malloc(1024); //Buffer to store packet encoded packet with generation.

		memcpy(tapBuffer,src_mac,MAC_ADDR_LEN); //Add dst_addr
		memcpy(tapBuffer+MAC_ADDR_LEN,if_mac,MAC_ADDR_LEN); //Add src_addr
		memcpy(tapBuffer+(2*MAC_ADDR_LEN),nc_type,ETH_TYPE_LEN); //Add eth_type
		memcpy(tapBuffer+(2*MAC_ADDR_LEN)+ETH_TYPE_LEN,coeffBufferQueue+(h*COEFF_BUFFER),COEFF_BUFFER); //Add coef_vector
		memcpy(tapBuffer+(2*MAC_ADDR_LEN)+ETH_TYPE_LEN+COEFF_BUFFER,tapTXBufferQueue+(h*TX_BUFFER),TX_BUFFER); //Add encoded_data

		//Transmit packets
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

	//Packetize results
	return 0;
}