// ============================================================================
// Copyright (c) 2016 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// ============================================================================
//
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================

// V1.1.0.0,   4/25/2017, richard
//   - <windows.h> --> <stdint.h> for linux/windows compatible
//   - UINT64 --> uint64_t
//   - DWORD --> uint32_t
//   - WORD --> uint16_t
//   - BYTE --> uint8_t
//   - BOOL --> bool
//   - add export api: PCIE_Read8 & PCIE_Write8

#ifndef _INC_TERASIC_PCIE_mSGDMA_H
#define _INC_TERASIC_PCIE_mSGDMA_H

#include <stdint.h>
/* GNU C/C++ Compiler */
#if defined(__GNUC__)
#include <stdio.h>
#define __export
#define __cdecl
#endif

#ifdef __cplusplus
extern "C" {
#else
typedef int bool;
#endif

#define PCIE_API __cdecl
typedef void *PCIE_HANDLE;
typedef uint64_t PCIE_ADDRESS;
typedef uint64_t PCIE_LOCAL_ADDRESS;
typedef uint64_t PCIE_LOCAL_FIFO_ID;

#define DEFAULT_PCIE_VID 0x1172
#define DEFAULT_PCIE_DID 0xE001

typedef enum {
	PCIE_BAR0 = 0,  // do not change it
	PCIE_BAR1,
	PCIE_BAR2,
	PCIE_BAR3,
	PCIE_BAR4,
	PCIE_BAR5
} PCIE_BAR;

typedef enum {
	DMA_AVMM = 0x01
} DMA_ENGINE_TYPE;

typedef struct {
	uint32_t dwCounter;   // number of interrupts received
	uint32_t dwLost;      // number of interrupts not yet dealt with
	bool fStopped;     // was interrupt disabled during wait
} PCIE_INT_RESULT;

//================================================================================
// function prototype used for "static load DLL"
#if 0
PCIE_HANDLE PCIE_API PCIE_Open(uint16_t wVendorID, uint16_t wDeviceID, uint16_t wCardNum);
void PCIE_API PCIE_Close(PCIE_HANDLE hFPGA);
bool PCIE_API PCIE_Read32 (PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint32_t *pdwData);
bool PCIE_API PCIE_Write32 (PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint32_t dwData);
bool PCIE_API PCIE_DmaRead (PCIE_HANDLE hFPGA, PCIE_LOCAL_ADDRESS LocalAddress, void *pBuffer, uint32_t dwBufSize);
bool PCIE_API PCIE_DmaWrite (PCIE_HANDLE hFPGA, PCIE_LOCAL_ADDRESS LocalAddress, void *pData, uint32_t dwDataSize);
bool PCIE_API PCIE_ConfigRead32 (PCIE_HANDLE hFPGA, uint32_t Offset, uint32_t *pData32);
bool PCIE_API PCIE_Read8 (PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint8_t *pByte);
bool PCIE_API PCIE_Write8 (PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint8_t Byte);
#endif
//================================================================================
// function prototype used for "dynamic load DLL"
typedef PCIE_HANDLE (PCIE_API *LPPCIE_Open)(uint16_t wVendorID, uint16_t wDeviceID, uint16_t wCardNum);
typedef void (PCIE_API *LPPCIE_Close)(PCIE_HANDLE hFPGA);
typedef bool (PCIE_API *LPPCIE_Read32)(PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint32_t *pdwData);
typedef bool (PCIE_API *LPPCIE_Write32)(PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint32_t dwData);
typedef bool (PCIE_API *LPPCIE_DmaRead) (PCIE_HANDLE hFPGA, PCIE_LOCAL_ADDRESS LocalAddress, void *pBuffer, uint32_t dwBufSize);
typedef bool (PCIE_API *LPPCIE_DmaWrite) (PCIE_HANDLE hFPGA, PCIE_LOCAL_ADDRESS LocalAddress, void *pData, uint32_t dwDataSize);
typedef bool (PCIE_API *LPPCIE_ConfigRead32) (PCIE_HANDLE hFPGA, uint32_t Offset, uint32_t *pData32);
typedef bool (PCIE_API *LPPCIE_Read8)(PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint8_t *pByte);
typedef bool (PCIE_API *LPPCIE_Write8)(PCIE_HANDLE hFPGA, PCIE_BAR PciBar, PCIE_ADDRESS PciAddress, uint8_t Byte);

#ifdef __cplusplus
}
#endif

#endif /* _INC_TERASIC_PCIE_mSGDMA_H */

