#include <linux/fs.h>
#include <linux/module.h>
#include <linux/interrupt.h>
#include <linux/sched.h>
#include <linux/uaccess.h>
#include "altera_pcie.h"
#include "altera_pcie_cmd.h"

#define DEVICE_MAJOR 0x0
static int device_major = DEVICE_MAJOR;
module_param(device_major, int, S_IRUGO);
static int device_minor_count = 0;

/// The default vendor ID that the driver support
static int vendor_id = ALTERA_PCIE_VID;
module_param(vendor_id, int, S_IRUGO);
/// The default device ID that the driver support
static int device_id = ALTERA_PCIE_DID;
module_param(device_id, int, S_IRUGO);

static long altera_pcie_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
    struct altera_pcie_dma_bookkeep *bk_ptr = filp->private_data;
    struct altera_ioctl_arg kernel_arg;

    // verify arg in user process
    if (access_ok(VERIFY_READ, (void __user *)arg, _IOC_SIZE(cmd))) {
        // copy ioctl arg from user space to kernel
        if (copy_from_user(&kernel_arg, (int __user *)arg, sizeof(struct altera_ioctl_arg))){
            return -EFAULT;
        }
    } else {
        return -EFAULT;
    }

    switch (cmd) {
        case ALTERA_IOCX_SET_BAR:
            if (kernel_arg.rw_bar_no < 0 || kernel_arg.rw_bar_no >= ALTERA_PCIE_BAR_NUM) {
                dev_err(&bk_ptr->pci_dev->dev, "Error: invalid BAR number. \n");
                return -EFAULT;
            } else if (bk_ptr->bar[kernel_arg.rw_bar_no] == NULL) {
                dev_err(&bk_ptr->pci_dev->dev, "Error: try to access the unintialized BAR. \n");
                return -EFAULT;
            }
            bk_ptr->rw_bar_no = kernel_arg.rw_bar_no;
            break;
        case ALTERA_IOCX_READ_CONF:
            if (pci_read_config_dword(bk_ptr->pci_dev, kernel_arg.offset, &kernel_arg.data) < 0) {
                dev_err(&bk_ptr->pci_dev->dev, "Read pci config is fail. \n");
                return -EFAULT;
            } else {
                if (access_ok(VERIFY_WRITE, (void __user *)arg, _IOC_SIZE(cmd))) {
                    // copy ioctl arg from kernel space to user
                    if (copy_to_user((struct altera_ioctl_arg *)arg, &kernel_arg, sizeof(struct altera_ioctl_arg))) {
                        return -EFAULT;
                    }
                } else {
                    return -EFAULT;
                }
            }
            break;
        case ALTERA_IOCX_GET_DMA_ADDR:
            kernel_arg.rd_buffer = bk_ptr->rp_rd_buffer_phys_addr;
            kernel_arg.wr_buffer = bk_ptr->rp_wr_buffer_phys_addr;
            kernel_arg.rd_buffer_bus = bk_ptr->rp_rd_buffer_bus_addr;
            kernel_arg.wr_buffer_bus = bk_ptr->rp_wr_buffer_bus_addr;
            if (access_ok(VERIFY_WRITE, (void __user *)arg, _IOC_SIZE(cmd))) {
                // copy ioctl arg from kernel space to user
                if (copy_to_user((struct altera_ioctl_arg *)arg, &kernel_arg, sizeof(struct altera_ioctl_arg))) {
                    return -EFAULT;
                }
            } else {
                return -EFAULT;
            }
            break;
        default:
            return -EINVAL;
    }
    return 0;
}

ssize_t altera_pcie_read(struct file *filp, char __user *buf, size_t count, loff_t *f_pos)
{
    char *kernel_buf;
    ssize_t bytes_read = 0;
    struct altera_pcie_dma_bookkeep *bk_ptr = filp->private_data;

    // error checking
    if (*f_pos + count > bk_ptr->bar_length[bk_ptr->rw_bar_no]) {
        dev_err(&bk_ptr->pci_dev->dev, "Trying to read from the outside of the BAR. \n");
        return -1;
    }

    // allocate kernel buffer for reading
    kernel_buf = kmalloc(count * sizeof(char), GFP_KERNEL);

    // check whether count and file position are multiple of 4
    if ((count % 4 == 0) && (*f_pos % 4 == 0)) {
        while (count > 0) {
            // read 32 bits each time
            ((u32 *)kernel_buf)[bytes_read/4] = ioread32(bk_ptr->bar[bk_ptr->rw_bar_no] + *f_pos);

            count -= sizeof(u32);
            bytes_read += sizeof (u32);
            *f_pos += sizeof(u32);
        }
    } else {
        while (count > 0) {
            // read 8 bits each time
            kernel_buf[bytes_read] = ioread8(bk_ptr->bar[bk_ptr->rw_bar_no] + *f_pos);

            count -= sizeof(u8);
            bytes_read += sizeof (u8);
            *f_pos += sizeof(u8);
        }
    }

    // check the user buffer writable
    if (access_ok(VERIFY_WRITE, (void __user *)buf, bytes_read)) {
        // check the return value, if return not 0, copy imcompletely
        if (copy_to_user(buf, kernel_buf, bytes_read)) {
            dev_err(&bk_ptr->pci_dev->dev, "copy_to_user() failed. \n");
            return -1;
        }
    } else {
        dev_err(&bk_ptr->pci_dev->dev, "access_ok() failed. \n");
        return -1;
    }

    // free the buffer after reading
    kfree(kernel_buf);

    // return the number for bytes read
    return bytes_read;
}

ssize_t altera_pcie_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos)
{
    char *kernel_buf;
    ssize_t bytes_written = 0;
    struct altera_pcie_dma_bookkeep *bk_ptr = filp->private_data;

    // error checking
    if (*f_pos + count > bk_ptr->bar_length[bk_ptr->rw_bar_no]) {
        dev_err(&bk_ptr->pci_dev->dev, "Trying to write to the outside of the BAR. \n");
        return -1;
    }

    // allocate the kernel buffer
    kernel_buf = kmalloc(count * sizeof(char), GFP_KERNEL);

    // check whether the user buffer is readable
    if (access_ok(VERIFY_READ, (void __user *)buf, count)) {
        // check the return value, if return not 0, copy imcompletely
        if (copy_from_user(kernel_buf, buf, count)) {
            dev_err(&bk_ptr->pci_dev->dev, "copy_from_user() failed. \n");
            return -1;
        }
    } else {
        dev_err(&bk_ptr->pci_dev->dev, "access_ok() failed. \n");
        return -1;
    }

    // check whether count and file position are multiple of 4
    if ((count % 4 == 0) && (*f_pos % 4 == 0)) {
        while (count > 0) {
            // write 32 bits each time
            iowrite32(((u32 *)kernel_buf)[bytes_written/4], bk_ptr->bar[bk_ptr->rw_bar_no] + *f_pos);

            count -= sizeof(u32);
            bytes_written += sizeof(u32);
            *f_pos += sizeof(u32);
        }
    } else {
        while (count > 0) {
            // write 8 bits each time
            iowrite8(kernel_buf[bytes_written], bk_ptr->bar[bk_ptr->rw_bar_no] + *f_pos);

            count -= sizeof(u8);
            bytes_written += sizeof(u8);
            *f_pos += sizeof(u8);
        }
    }

    // free the kernel buffer after writing
    kfree(kernel_buf);

    // return the number of bytes written
    return bytes_written;
}

static int altera_pcie_mmap(struct file *filp, struct vm_area_struct *vma)
{
    struct altera_pcie_dma_bookkeep *bk_ptr = filp->private_data;
    unsigned long size = vma->vm_end - vma->vm_start;
    dev_info(&bk_ptr->pci_dev->dev, "mmap, start %lx end %lx off %lx \n", vma->vm_start, vma->vm_end, vma->vm_pgoff);
    remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, size, vma->vm_page_prot);
#ifdef VM_RESERVED
    vma->vm_flags |= VM_IO | VM_RESERVED;
#else
    vma->vm_flags |= VM_IO;
#endif

    return 0;
}

static loff_t  altera_pcie_llseek (struct file *filp, loff_t off, int whence)
{

    loff_t newpos;

    switch (whence) {
        case 0: /* SEEK_SET */ // set the off, starting from the beginning of the file
            newpos = off;
            break;
        case 1: /* SEEK_CUR */ // set the off, starting from the current file position
            newpos = filp->f_pos + off;
            break;
        case 2: /* SEEK_END */
            newpos = -1;  // should not be set outside the range of the BAR address
            break;
        default: /* can't happen */
            return -EINVAL;
    }
    if (newpos < 0)
        return -EINVAL;

    filp->f_pos = newpos;
    return newpos;
}

int altera_pcie_open(struct inode *inode, struct file *filp)
{
    struct altera_pcie_dma_bookkeep *bk_ptr = 0;

    bk_ptr = container_of(inode->i_cdev, struct altera_pcie_dma_bookkeep, cdev);
    filp->private_data = bk_ptr;
    bk_ptr->user_pid = current->pid;

    return 0;
}

int altera_pcie_release(struct inode *inode, struct file *filp)
{
    return 0;
}

struct file_operations altera_pcie_fops = {
    .owner          = THIS_MODULE,
    .read           = altera_pcie_read,
    .write          = altera_pcie_write,
    .open           = altera_pcie_open,
    .release        = altera_pcie_release,
    .unlocked_ioctl = altera_pcie_ioctl,
    .llseek         = altera_pcie_llseek,
    .mmap           = altera_pcie_mmap,
};

static int __init init_chrdev(struct altera_pcie_dma_bookkeep *bk_ptr)
{
    int result;
    int dev_minor = device_minor_count;

    if (device_major == 0) {
        result = alloc_chrdev_region(&bk_ptr->cdevno, 0, 1, ALTERA_PCIE_DEVFILE);
        device_major = MAJOR(bk_ptr->cdevno);
    } else {
        bk_ptr->cdevno = MKDEV(device_major, dev_minor);
        result = register_chrdev_region(bk_ptr->cdevno, 1, ALTERA_PCIE_DEVFILE);
    }

    if (result < 0) {
        dev_err(&bk_ptr->pci_dev->dev, "cannot get major ID");
    }

    cdev_init(&bk_ptr->cdev, &altera_pcie_fops);
    bk_ptr->cdev.owner = THIS_MODULE;
    bk_ptr->cdev.ops = &altera_pcie_fops;
    result = cdev_add(&bk_ptr->cdev, bk_ptr->cdevno, 1);

    if (result)
        return -1;
    device_minor_count++;
    return 0;
}

static int scan_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev)
{
    int i;
    for (i = 0; i < ALTERA_PCIE_BAR_NUM; i++) {
        unsigned long bar_start = pci_resource_start(dev, i);
        unsigned long bar_end = pci_resource_end(dev, i);
        unsigned long bar_flags = pci_resource_flags(dev, i);
        bk_ptr->bar_length[i] = pci_resource_len(dev, i);
        dev_info(&dev->dev, "BAR[%d] 0x%08lx-0x%08lx flags 0x%08lx, length %d", i, bar_start, bar_end, bar_flags, (int)bk_ptr->bar_length[i]);
    }
    return 0;
}

static int __init map_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev)
{
    int i;
    for (i = 0; i < ALTERA_PCIE_BAR_NUM; i++) {
        unsigned long bar_start = pci_resource_start(dev, i);
        bk_ptr->bar_length[i] = pci_resource_len(dev, i);
        if (!bk_ptr->bar_length[i]) {
            bk_ptr->bar[i] = NULL;
            continue;
        }
        bk_ptr->bar[i] = ioremap(bar_start, bk_ptr->bar_length[i]);
        if (!bk_ptr->bar[i]) {
            dev_err(&dev->dev, "could not map BAR[%d]", i);
            return -1;
        } else
            dev_info(&dev->dev, "BAR[%d] mapped to 0x%p, length %lu", i, bk_ptr->bar[i], (long unsigned int)bk_ptr->bar_length[i]);
    }
    return 0;
}

static void unmap_bars(struct altera_pcie_dma_bookkeep *bk_ptr, struct pci_dev *dev)
{
    int i;
    for (i = 0; i < ALTERA_PCIE_BAR_NUM; i++) {
        if (bk_ptr->bar[i]) {
            pci_iounmap(dev, bk_ptr->bar[i]);
            bk_ptr->bar[i] = NULL;
        }
    }
}

static int __init altera_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
{
    int rc = 0;
    struct altera_pcie_dma_bookkeep *bk_ptr = NULL;
    char device_path[100];

    bk_ptr = kzalloc(sizeof(struct altera_pcie_dma_bookkeep), GFP_KERNEL);
    if (!bk_ptr)
        goto err_bk_alloc;

    bk_ptr->pci_dev = dev;
    pci_set_drvdata(dev, bk_ptr);

    rc = init_chrdev(bk_ptr);
    if (rc) {
        dev_err(&dev->dev, "init_chrdev() failed\n");
        goto err_initchrdev;
    }
    rc = pci_enable_device(dev);
    if (rc) {
        dev_err(&dev->dev, "pci_enable_device() failed\n");
        goto err_enable;
    } else {
        dev_info(&dev->dev, "pci_enable_device() successful");
    }
    rc = pci_request_regions(dev, ALTERA_PCIE_DRIVER_NAME);
    if (rc) {
        dev_err(&dev->dev, "pci_request_regions() failed\n");
        goto err_regions;
    }
    pci_set_master(dev);
    rc = pci_enable_msi(dev);
    if (rc) {
        dev_err(&dev->dev, "pci_enable_msi() failed\n");
        bk_ptr->msi_enabled = 0;
    } else {
        dev_info(&dev->dev, "pci_enable_msi() successful\n");
        bk_ptr->msi_enabled = 1;
    }
    pci_read_config_byte(dev, PCI_REVISION_ID, &bk_ptr->revision);

    scan_bars(bk_ptr, dev);
    map_bars(bk_ptr, dev);
    bk_ptr->rw_bar_no = 0;

    // waitqueue for user process
    init_waitqueue_head(&bk_ptr->wait_q);

    bk_ptr->numpages = (PAGE_SIZE >= MAX_NUM_DWORDS*4) ? 1 : (int)((MAX_NUM_DWORDS*4)/PAGE_SIZE);
    bk_ptr->rp_rd_buffer_virt_addr = pci_alloc_consistent(dev, PAGE_SIZE*bk_ptr->numpages, &bk_ptr->rp_rd_buffer_bus_addr);
    if (!bk_ptr->rp_rd_buffer_virt_addr) {
        rc = -ENOMEM;
        goto err_rd_buffer;
    }
    bk_ptr->rp_rd_buffer_phys_addr = virt_to_phys((void *)bk_ptr->rp_rd_buffer_virt_addr);
    bk_ptr->rp_wr_buffer_virt_addr = pci_alloc_consistent(dev, PAGE_SIZE*bk_ptr->numpages, &bk_ptr->rp_wr_buffer_bus_addr);
    if (!bk_ptr->rp_wr_buffer_virt_addr) {
        rc = -ENOMEM;
        goto err_wr_buffer;
    }
    bk_ptr->rp_wr_buffer_phys_addr = virt_to_phys((void *)bk_ptr->rp_wr_buffer_virt_addr);

    sprintf(device_path, "%s%d", ALTERA_PCIE_DEVFILE, MINOR(bk_ptr->cdevno));
    bk_ptr->dev_class = class_create(THIS_MODULE, device_path);
    rc = IS_ERR(bk_ptr->dev_class);
    if (rc) {
        dev_err(&dev->dev, "dev_class create error\n");
        goto err_class;
    }

    bk_ptr->device = device_create(bk_ptr->dev_class, NULL, bk_ptr->cdevno, NULL, device_path);
    if (IS_ERR(bk_ptr->device)) {
        dev_err(&dev->dev, "device create error!\n");
        goto err_device;
    }

    return 0;

    // error clean up
err_device:
    dev_err(&dev->dev, "goto err_device");
    class_destroy(bk_ptr->dev_class);
err_class:
    dev_err(&dev->dev, "goto err_class");
    pci_free_consistent(dev, PAGE_SIZE*bk_ptr->numpages, bk_ptr->rp_wr_buffer_virt_addr, bk_ptr->rp_wr_buffer_bus_addr);
err_wr_buffer:
    dev_err(&dev->dev, "goto err_wr_buffer");
    pci_free_consistent(dev, PAGE_SIZE*bk_ptr->numpages, bk_ptr->rp_rd_buffer_virt_addr, bk_ptr->rp_rd_buffer_bus_addr);
err_rd_buffer:
    dev_err(&dev->dev, "goto err_rd_buffer");
err_regions:
    dev_err(&dev->dev, "goto err_irq");
    pci_disable_device(dev);
err_enable:
    dev_err(&dev->dev, "goto err_enable");
    unregister_chrdev_region(bk_ptr->cdevno, 1);
    device_minor_count--;
err_initchrdev:
    dev_err(&dev->dev, "goto err_initchrdev");
    kfree(bk_ptr);
err_bk_alloc:
    dev_err(&dev->dev, "goto err_bk_alloc");
    return rc;
}

static void __exit altera_pci_remove(struct pci_dev *dev)
{
    struct altera_pcie_dma_bookkeep *bk_ptr = NULL;
    bk_ptr = pci_get_drvdata(dev);
    cdev_del(&bk_ptr->cdev);
    unregister_chrdev_region(bk_ptr->cdevno, 1);
    device_minor_count--;
    pci_disable_device(dev);
    if (bk_ptr) {
        if (bk_ptr->msi_enabled) {
            pci_disable_msi(dev);
            bk_ptr->msi_enabled = 0;
        }
    }
    unmap_bars(bk_ptr, dev);
    pci_release_regions(dev);
    pci_free_consistent(dev, PAGE_SIZE*bk_ptr->numpages, bk_ptr->rp_rd_buffer_virt_addr, bk_ptr->rp_rd_buffer_bus_addr);
    pci_free_consistent(dev, PAGE_SIZE*bk_ptr->numpages, bk_ptr->rp_wr_buffer_virt_addr, bk_ptr->rp_wr_buffer_bus_addr);

    device_unregister(bk_ptr->device);
    class_destroy(bk_ptr->dev_class);

    kfree(bk_ptr);
    dev_err(&dev->dev, ": altera_pcie_remove(), " __DATE__ " " __TIME__ "\n");
}

static struct pci_device_id pci_ids[] = {
    { 0 },
    { 0 }
};

static struct pci_driver dma_driver_ops = {
    .name = ALTERA_PCIE_DRIVER_NAME,
    .id_table = pci_ids,
    .probe = altera_pci_probe,
    .remove = altera_pci_remove,
};

static int __init altera_pcie_init(void)
{
    int rc = 0;

    printk(KERN_DEBUG ALTERA_PCIE_DRIVER_NAME ": altera_pcie_init(), " __DATE__ " " __TIME__ "\n");

    pci_ids[0].vendor = vendor_id;
    pci_ids[0].device = device_id;
    pci_ids[0].subvendor = PCI_ANY_ID;
    pci_ids[0].subdevice = PCI_ANY_ID;

    rc = pci_register_driver(&dma_driver_ops);
    if (rc) {
        printk(KERN_ERR ALTERA_PCIE_DRIVER_NAME ": PCI driver registration failed\n");
        goto exit;
    }

exit:
    return rc;
}

static void __exit altera_pcie_exit(void)
{
    pci_unregister_driver(&dma_driver_ops);
}

#ifdef MEASURE_TIME
static int diff_timeval(struct timeval *result, struct timeval *t2, struct timeval *t1)
{
    long int diff = (t2->tv_usec + 1000000 * t2->tv_sec) - (t1->tv_usec + 1000000 * t1->tv_sec);
    result->tv_sec = diff / 1000000;
    result->tv_usec = diff % 1000000;
    return (diff < 0);
}
#endif

module_init(altera_pcie_init);
module_exit(altera_pcie_exit);

MODULE_AUTHOR("Michael Chen <micchen@altera.com>");
MODULE_DESCRIPTION("256b DMA Driver");
MODULE_VERSION(ALTERA_PCIE_DRIVER_VERSION);
MODULE_LICENSE("Dual BSD/GPL");
MODULE_DEVICE_TABLE(pci, pci_ids);

