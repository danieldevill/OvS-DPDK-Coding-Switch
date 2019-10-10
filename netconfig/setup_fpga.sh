#!/bin/bash

#Configure Intel FGPA Environment

#Insert drivers into running kernel 
cd ~/Working/OvS-DPDK-Coding-Switch/fpga/driver/PCIe_Driver
sudo sh unload
sudo sh load_driver
