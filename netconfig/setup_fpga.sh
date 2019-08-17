#!/bin/bash

#Configure Intel FGPA Environment

#Insert drivers into running kernel 
sudo insmod ~/opae/opae-intel-fpga-driver-1.3.0-2/fpga-mgr-mod.ko
sudo insmod ~/opae/opae-intel-fpga-driver-1.3.0-2/intel-fpga-pci.ko
sudo insmod ~/opae/opae-intel-fpga-driver-1.3.0-2/intel-fpga-afu.ko
sudo insmod ~/opae/opae-intel-fpga-driver-1.3.0-2/intel-fpga-fme.ko