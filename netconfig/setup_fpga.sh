#!/bin/bash

#Configure Intel FGPA Environment

#Insert drivers into running kernel 
cd ./../fpga/driver/PCIe_Driver
sudo sh load_driver
