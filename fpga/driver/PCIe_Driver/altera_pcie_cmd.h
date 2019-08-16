#ifndef _ALTERA_PCIE_CMD_H
#define _ALTERA_PCIE_CMD_H

#define ALTERA_PCIE_DRIVER_VERSION "2.02"

#define ALTERA_PCIE_DID 0xE001
#define ALTERA_PCIE_VID 0x1172

#define ALTERA_IOCTL_SET_BAR        18
#define ALTERA_IOCTL_READ_CONF      19
#define ALTERA_IOCTL_GET_DMA_ADDR   20

#include <linux/ioctl.h>

#define ALTERA_IOC_MAGIC   0x66
#define ALTERA_IOCX_SET_BAR          _IOW(ALTERA_IOC_MAGIC, ALTERA_IOCTL_SET_BAR, struct altera_ioctl_arg)
#define ALTERA_IOCX_READ_CONF        _IOR(ALTERA_IOC_MAGIC, ALTERA_IOCTL_READ_CONF, struct altera_ioctl_arg)
#define ALTERA_IOCX_GET_DMA_ADDR     _IOR(ALTERA_IOC_MAGIC, ALTERA_IOCTL_GET_DMA_ADDR, struct altera_ioctl_arg)

#ifdef __KERNEL__

#include <linux/pci.h>

#else

#include <sys/ioctl.h>
#include <inttypes.h>
typedef uint64_t dma_addr_t;
typedef uint64_t phys_addr_t;

#endif

#define ALTERA_DMA_DESCRIPTOR_NUM 128

#define DESC_CTRLLER_BASE               0x0000
#define ALTERA_DMA_CHUNK_SIZE           0x8000//32K bytes
#define DMA_TIMEOUT                     0x200000

struct altera_ioctl_arg {

    /// The BAR to read from/write to in read and write functions
    int rw_bar_no;

    /// user buffer
    char *user_buffer_addr;
    /// the slave address to read/write
    dma_addr_t dma_rw_slave_addr;
    /// length of the DMA transaction in bytes
    unsigned long dma_length_byte;

    /// Read config data
    unsigned int offset;
    unsigned int data;

    /// DMA address
    phys_addr_t rd_buffer;
    phys_addr_t wr_buffer;
    dma_addr_t rd_buffer_bus;
    dma_addr_t wr_buffer_bus;
};

struct dma_descriptor {
    uint32_t src_addr_ldw;
    uint32_t src_addr_udw;
    uint32_t dest_addr_ldw;
    uint32_t dest_addr_udw;
    uint32_t ctl_dma_len;
    uint32_t reserved[3];
} __attribute__ ((packed));

#endif /* _ALTERA_PCIE_CMD_H */
