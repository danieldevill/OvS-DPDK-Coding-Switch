transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/fifo32x128/fifo32x128.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/prngen/prngen.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/net_encoder_fifo_delay/net_encoder.vhd}
vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/gfmul/gfmul.vhd}

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/ip/encoder/net_encoder_fifo_delay/net_encoderTb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  net_encoderTb

add wave *
view structure
view signals
run -all
