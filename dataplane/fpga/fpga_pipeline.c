//System
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include <sys/types.h>
#include <sys/queue.h>
#include <netinet/in.h>
#include <setjmp.h>
#include <stdarg.h>
#include <ctype.h>
#include <errno.h>
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>

//DPDK
// #include <rte_common.h>
// #include <rte_log.h>
// #include <rte_malloc.h>
// #include <rte_memory.h>
// #include <rte_memcpy.h>
// #include <rte_eal.h>
// #include <rte_launch.h>
// #include <rte_atomic.h>
// #include <rte_cycles.h>
// #include <rte_prefetch.h>
// #include <rte_lcore.h>
// #include <rte_per_lcore.h>
// #include <rte_branch_prediction.h>
// #include <rte_interrupts.h>
// #include <rte_random.h>
// #include <rte_debug.h>
// #include <rte_ether.h>
// #include <rte_ethdev.h>
// #include <rte_mempool.h>
// #include <rte_mbuf.h>
// #include <rte_hash.h>
// #include <rte_jhash.h>


//PCIe
#include <memory.h>
#include "PCIE.h"

//PCIe Definitions
#define PCIE_BAR					PCIE_BAR4
#define ENCODER_START				0x4000010
#define CODER_RST				    0x4000020

#define PCIE_MEM_ADDR				0x07000000
#define MEM_SIZE					(512) //512KB

int
main(int argc, char *argv[])
{

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
		const PCIE_LOCAL_ADDRESS LocalAddr = PCIE_MEM_ADDR;
		//char *pWrite;
		char *pRead;
		char szError[256];
		char *pWrite;

		pWrite = (char *) malloc(512);
		pRead = (char *) malloc(1024);
		if (!pWrite || !pRead) {
			sprintf(szError, "DMA Memory:malloc failed\r\n");
		}

		//Write Packets to DMA
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

		//Reset Coder
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 0);
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 1);
		if (bPass)
			printf("Reset\n");


		// Read Packets from DMA
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

		// free resources
		if (pWrite)
			free(pWrite);
		if (pRead)
			free(pRead);

		//Reset Coder
		bPass = PCIE_Write32(hPCIe, PCIE_BAR, CODER_RST,
			(uint32_t) 0);

		//Close PCIe connection
		PCIE_Close(hPCIe);
	}

	return 0;
}

