#ifndef _ALTERA_PCIE_H
#define _ALTERA_PCIE_H

#include <linux/cdev.h>
#include <linux/pci.h>
#include "altera_pcie_cmd.h"

#define ALTERA_PCIE_DRIVER_NAME    "Altera PCIE"
#define ALTERA_PCIE_DEVFILE        "altera_pcie"

#define ALTERA_PCIE_BAR_NUM (6)

#define RD_CTRL_BUF_BASE_LOW			0x80000000
#define RD_CTRL_BUF_BASE_HI				0x0000
#define WR_CTRL_BUF_BASE_LOW			0x80002000
#define WR_CTRL_BUF_BASE_HI				0x0000

#define MAX_NUM_DWORDS                  0x100000//1M DWORDS
struct altera_pcie_dma_bookkeep {
    struct pci_dev *pci_dev;
    struct class *dev_class;
    struct device *device;

    u8 revision;
    u8 irq_pin;
    char msi_enabled;
    u8 irq_line;
    char dma_capable;

    void * __iomem bar[ALTERA_PCIE_BAR_NUM];
    size_t bar_length[ALTERA_PCIE_BAR_NUM];
    u32 rw_bar_no;

    int numpages;
    u8 *rp_rd_buffer_virt_addr;
    dma_addr_t rp_rd_buffer_bus_addr;
    phys_addr_t rp_rd_buffer_phys_addr;
    u8 *rp_wr_buffer_virt_addr;
    dma_addr_t rp_wr_buffer_bus_addr;
    phys_addr_t rp_wr_buffer_phys_addr;

    dev_t cdevno;
    struct cdev cdev;

    int user_pid;
    struct task_struct *user_task;
    wait_queue_head_t wait_q;
    atomic_t status;

};

static int scan_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev) __init;
static int map_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev) __init;
//static irqreturn_t dma_isr(int irq, void *dev_id);

static int altera_pci_probe(struct pci_dev *dev, const struct pci_device_id *id) __init;
static int scan_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev);
static void altera_pci_remove(struct pci_dev *dev) __exit;
//static int eplast_busy_wait(struct altera_pcie_dma_bookkeep *bk_ptr, u32 expected_eplast, u8 rw);
#ifdef MEASURE_TIME
static int diff_timeval(struct timeval *result, struct timeval *t2, struct timeval *t1);
#endif
static int init_chrdev (struct altera_pcie_dma_bookkeep *bk_ptr) __init;

ssize_t altera_pcie_read(struct file *file, char __user *buf, size_t count, loff_t *pos);
ssize_t altera_pcie_write(struct file *file, const char __user *buf, size_t count, loff_t *pos);
int altera_pcie_open(struct inode *inode, struct file *file);
int altera_pcie_release(struct inode *inode, struct file *file);
static long altera_pcie_ioctl (struct file *filp, unsigned int cmd, unsigned long arg);

#endif /* _ALTERA_PCIE_H */
