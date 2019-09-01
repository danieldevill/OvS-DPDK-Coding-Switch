	mm u0 (
		.clk_clk                             (<connected-to-clk_clk>),                             //                  clk.clk
		.master_read_control_fixed_location  (<connected-to-master_read_control_fixed_location>),  //  master_read_control.fixed_location
		.master_read_control_read_base       (<connected-to-master_read_control_read_base>),       //                     .read_base
		.master_read_control_read_length     (<connected-to-master_read_control_read_length>),     //                     .read_length
		.master_read_control_go              (<connected-to-master_read_control_go>),              //                     .go
		.master_read_control_done            (<connected-to-master_read_control_done>),            //                     .done
		.master_read_control_early_done      (<connected-to-master_read_control_early_done>),      //                     .early_done
		.master_read_user_read_buffer        (<connected-to-master_read_user_read_buffer>),        //     master_read_user.read_buffer
		.master_read_user_buffer_output_data (<connected-to-master_read_user_buffer_output_data>), //                     .buffer_output_data
		.master_read_user_data_available     (<connected-to-master_read_user_data_available>),     //                     .data_available
		.master_write_control_fixed_location (<connected-to-master_write_control_fixed_location>), // master_write_control.fixed_location
		.master_write_control_write_base     (<connected-to-master_write_control_write_base>),     //                     .write_base
		.master_write_control_write_length   (<connected-to-master_write_control_write_length>),   //                     .write_length
		.master_write_control_go             (<connected-to-master_write_control_go>),             //                     .go
		.master_write_control_done           (<connected-to-master_write_control_done>),           //                     .done
		.master_write_user_write_buffer      (<connected-to-master_write_user_write_buffer>),      //    master_write_user.write_buffer
		.master_write_user_buffer_input_data (<connected-to-master_write_user_buffer_input_data>), //                     .buffer_input_data
		.master_write_user_buffer_full       (<connected-to-master_write_user_buffer_full>),       //                     .buffer_full
		.reset_reset_n                       (<connected-to-reset_reset_n>)                        //                reset.reset_n
	);

