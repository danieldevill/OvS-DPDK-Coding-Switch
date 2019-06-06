transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/gfadd/gfadd.vhd}

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/gfadd/gfaddTb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  gfaddTb

add wave *
view structure
view signals
run -all
