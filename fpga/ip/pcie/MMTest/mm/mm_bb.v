
module mm (
	clk_clk,
	master_read_control_fixed_location,
	master_read_control_read_base,
	master_read_control_read_length,
	master_read_control_go,
	master_read_control_done,
	master_read_control_early_done,
	master_read_user_read_buffer,
	master_read_user_buffer_output_data,
	master_read_user_data_available,
	master_write_control_fixed_location,
	master_write_control_write_base,
	master_write_control_write_length,
	master_write_control_go,
	master_write_control_done,
	master_write_user_write_buffer,
	master_write_user_buffer_input_data,
	master_write_user_buffer_full,
	reset_reset_n);	

	input		clk_clk;
	input		master_read_control_fixed_location;
	input	[31:0]	master_read_control_read_base;
	input	[31:0]	master_read_control_read_length;
	input		master_read_control_go;
	output		master_read_control_done;
	output		master_read_control_early_done;
	input		master_read_user_read_buffer;
	output	[31:0]	master_read_user_buffer_output_data;
	output		master_read_user_data_available;
	input		master_write_control_fixed_location;
	input	[31:0]	master_write_control_write_base;
	input	[31:0]	master_write_control_write_length;
	input		master_write_control_go;
	output		master_write_control_done;
	input		master_write_user_write_buffer;
	input	[31:0]	master_write_user_buffer_input_data;
	output		master_write_user_buffer_full;
	input		reset_reset_n;
endmodule
