module MMTest(
	//Clock
	input clk,
	//Reset
	input rst
);

//Master Read Wires
reg         mr_control_fixed_location;
reg [31:0]  mr_control_base;
reg [31:0]  mr_control_length;
reg			mr_control_go;
wire        mr_control_done;
wire        mr_control_early_done;
wire [31:0] mr_buffer_data; 
wire 			mr_data_avali;
reg 			mr_read_buffer;
reg 			mr_read_buffer_d;
wire read_ram_en;
reg [3:0] start_delay;
reg [1:0] read_state;
parameter idle=0, read=1; 
assign read_ram_en = 1'b1;

//Master Write Wires
reg 			mw_control_fixed_location;
reg [31:0]  mw_control_base;
reg [31:0]  mw_control_length;
reg         mw_control_go;
wire        mw_control_done;
reg         mw_write_buffer;
reg [31:0]  mw_buffer_data;
wire        mw_buffer_full;
reg write_ram_en;
reg [1:0] write_state;
parameter write=1;

//Net Encoder Wires
reg 			 encoder_rst;
wire [31:0]  encoder_pkt_out; 
wire [31:0]  encoder_pkt_coeff; 

//MM Module
mm mm0 (

		.clk_clk(clk),                             //                 clk.clk
		.master_read_control_fixed_location(mr_control_fixed_location),  // master_read_control.fixed_location
		.master_read_control_read_base(mr_control_base),       //                    .read_base
		.master_read_control_read_length(mr_control_length),     //                    .read_length
		.master_read_control_go(mr_control_go),              //                    .go
		.master_read_control_done(mr_control_done),            //                    .done
		.master_read_control_early_done(mr_control_early_done),      //                    .early_done
		.master_read_user_read_buffer(mr_read_buffer),        //    master_read_user.read_buffer
		.master_read_user_buffer_output_data(mr_buffer_data), //                    .buffer_output_data
		.master_read_user_data_available(mr_data_avali),     //                    .data_available
		.master_write_control_fixed_location(mw_control_fixed_location), // master_write_control.fixed_location
		.master_write_control_write_base(mw_control_base),     //                     .write_base
		.master_write_control_write_length(mw_control_length),   //                     .write_length
		.master_write_control_go(mw_control_go),             //                     .go
		.master_write_control_done(mw_control_done),           //                     .done
		.master_write_user_write_buffer(mw_write_buffer),      //    master_write_user.write_buffer
		.master_write_user_buffer_input_data(mw_buffer_data), //                     .buffer_input_data
		.master_write_user_buffer_full(mw_buffer_full),       //                     .buffer_full
		.reset_reset_n(rst)                        //               reset.reset_n

);

//Instantiate network encoder VHDL module.
net_encoder	
		#(
			.m(8),
			.h(7),
			.N(64),
			.seed(31)
		)
		net_encoder0 (
		  .clk(clk),
		  .rst(encoder_rst),
		  .pkt32bseg_i(mr_buffer_data),
		  .pkt32bseg_o(mw_buffer_data),
		  .coeffs_out(encoder_pkt_coeff)
);

//Master Read FSM
always @(posedge clk or negedge rst)
begin
	if(~rst)
		read_state = idle;
		write_ram_en = 1'b0;
	else

		//RAM Read Idle and Read states
		case(read_state)
			idle:
				begin
					start_delay = 0;
					//Enable address incrementing while reading RAM
					mr_control_fixed_location = 1'b0;
					//Offset address base to account for FIFO delay. Address Read starts before 32'h0700_0000, so do not populate that memory space.
					mr_control_base =   (32'h0700_0000 - 32'h0000_008) & 32'hFFFF_FFFC;
					mr_control_length = 32'h0000_01B6;
					mr_control_go = 1'b0;
					if(read_ram_en == 1)
						read_state = read;
					else
						read_state = idle;
				end
			read:
				begin
					//Default control go deassert.
					mr_control_go = 1'b0;
					
					//Delay master read transfer begin.
					if(start_delay == 4'h0A)
						mr_control_go = 1'b1;					
					
					//Deassert control go to complete go cycle strobe, and begin transfer.
					if(start_delay == 4'h0B)
						begin
						mr_control_go = 1'b0;
						end
					else
						start_delay = start_delay + 4'h1;
				
					//Begin reading FIFO output.
					if(mr_data_avali == 1)
						begin
							mr_read_buffer = 1'b1;
						end
					else
						mr_read_buffer = 1'b0;
						
					//Delay Read buffer signal
					if(mr_read_buffer ==1)
						mr_read_buffer_d <= 1'b1;
						
					if(read_ram_en == 0 )
						read_state = idle;
					else
						read_state = read;
				end
		endcase				
end

//Master Write FSM
always @(posedge clk or negedge rst)
begin
	if(~rst)
		write_state = idle;
	else
		
		case(write_state)
			idle:
				begin
					//Enable address incrementing while writing RAM
					mw_control_fixed_location = 1'b0;
					
					mw_control_base = 32'h0700_0200 & 32'hFFFF_FFFC;
					mw_control_length = 32'h0000_01B6;
					mw_control_go = 1'b0;
					if(write_ram_en == 1)
						write_state = write;
					else
						write_state = idle;
				end
			write:
				begin
					mw_control_go = 1'b1;
					mw_write_buffer = 1'b0;
					//Only Write when buffer is not full
					if(mw_buffer_full == 0)
						mw_write_buffer = 1'b1;
					//Change States if write_name disabled.	
					if(write_ram_en == 0)
						write_state = idle;
					else
						write_state = write;
				end
		endcase
	
end
	
//Net Encoder Controller
always @(posedge clk or negedge rst)
begin
	if(~rst)
		encoder_rst = 0;
	else
		begin
			encoder_rst = 0;
			if(mr_read_buffer_d == 1)
				encoder_rst = 1;
		end
end



endmodule