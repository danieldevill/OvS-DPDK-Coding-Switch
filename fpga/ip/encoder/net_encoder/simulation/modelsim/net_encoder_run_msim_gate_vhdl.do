transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {net_encoder.vho}

vcom -93 -work work {/home/daniel/Dropbox/Academics/MEng/Working/OvS-DPDK-Coding-Switch/fpga/net_encoder/net_encoderTb.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=net_encoder_vhd.sdo -L altera -L altera_lnsim -L cyclonev -L gate_work -L work -voptargs="+acc"  net_encoderTb

add wave *
view structure
view signals
run -all
