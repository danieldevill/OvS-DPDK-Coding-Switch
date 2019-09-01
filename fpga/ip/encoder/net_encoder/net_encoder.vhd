library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity net_encoder is
generic(m : integer := 8; -- Galois Field Size, default 8 bits.
		h : integer := 7; -- Generation Size, default 7 bytes.
		N : integer := 64; -- Packet Size, default 64 bytes.
		seed : integer := 31); -- Seed for Encoder Pseudo-Random Generator
port(
	-- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 pkt32bseg_i : in std_logic_vector(31 downto 0); -- 4 byte packet segment input

	 -- Outputs
	 pkt32bseg_o : out std_logic_vector(31 downto 0); -- 4 byte packet segment output
	 coeffs_out : out std_logic_vector(31 downto 0));
	
end entity net_encoder;

architecture rtl of net_encoder is
type write_state_Type is (idle, wr);
type read_state_Type is (idle, rd);

	signal write_state_datain : write_state_Type := idle;
	signal read_state_datain : read_state_Type := idle;

	component fifo32x128 is
		port (
			-- Inputs
			data : in std_logic_vector(31 downto 0); 
			clock, rdreq, wrreq : in std_logic;

			-- Outputs
			q : out std_logic_vector(31 downto 0); 
			empty, full : out std_logic);
	end component fifo32x128;

	component prngen is
		generic(seed : integer := 31;
				m : integer := 8);
		port (
			-- Inputs 
			clk,rst : in std_logic;

			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component prngen;

	component gfmul is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfmul;

	type std_logic_vector_array is array (((h*4)-1) downto 0) of std_logic_vector(m-1 downto 0);

	type std_logic_vector_array_coefficients is array ((h-1) downto 0) of std_logic_vector(m-1 downto 0);
	type std_logic_vector_array_datain is array ((3) downto 0) of std_logic_vector(m-1 downto 0);
	type std_logic_vector_array_mulfifos is array ((h-1) downto 0) of std_logic_vector(31 downto 0);

	type write_state_mulrslt is array ((h-1) downto 0) of write_state_Type;
	type read_state_mulrslt is array ((h-1) downto 0) of read_state_Type;

	type std_logic_vector_array_sumop is array (63 downto 0) of std_logic_vector(7 downto 0);
	type std_logic_vector_array_sumops is array ((h-1) downto 0) of std_logic_vector_array_sumop;

	--Data-in FIFO
	signal rdreq_datain, wrreq_datain, rdempty_datain, wrfull_datain : std_logic;
	signal data_datain, q_datain : std_logic_vector(31 downto 0);
	signal q_datain_bytes : std_logic_vector_array_datain;

	-- Pseudo-Random Coefficients
	signal rcoeffs :  std_logic_vector_array_coefficients;
	--Pseudo-Random FIFO
	signal pseudoin : std_logic_vector(55 downto 0);
	signal pseudoin_bytes  : std_logic_vector_array_coefficients;

	-- Multiplier Signals
	signal rslt_m : std_logic_vector_array;	
	signal mul1, mul2 : std_logic_vector_array;
	signal mulready : std_logic := '1';
	signal mulcount : integer := 0;
	signal mulsrst : std_logic := '0';
	--Multiplier FIFOs
	signal rdreq_mulfifos, wrreq_mulfifos, rdempty_mulfifos, wrfull_mulfifos : std_logic_vector(h downto 0);
	signal data_mulfifos, q_mulfifos : std_logic_vector_array_mulfifos;
	signal write_state_mulrslts : write_state_mulrslt;
	signal read_state_mulrslts : read_state_mulrslt;

	--Packet counter
	signal inPacketCount,outPacketCount : integer := 0;
	signal rowCount : integer := -1;

	--Sum Signals
	signal sum_vectors : std_logic_vector_array_sumops;
	signal sumCount : integer := 0;

	--Output Counter
	signal outCount,outVectorCount : integer := 0;
	signal en_output : std_logic := '0';


begin

	--h coeffs, Per single packet
	generate_coeffs: for i in 0 to (h-1) generate 
		prngen_1 : prngen
		generic map(seed => seed+i, m => m)
		port map(clk=>clk,
			rst=>rst,
			rslt=>rcoeffs(i));
		end generate generate_coeffs;

	--h*4 multipliers
	generate_muls: for i in 0 to ((h*4)-1) generate 
		gfmul_1 : gfmul 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>mulsrst, 
			operand_1=>mul1(i), 
			operand_2=>mul2(i), 
			rslt=>rslt_m(i));
	end generate generate_muls;

	--Data-in begin.
		--Load data into and out-if FIFO for buffering. Incoming packets are faster than encoder processing.

		--data_in FIFO
		fifo32x128_datain : fifo32x128
		port map(
			data=>data_datain,
			clock=>clk,
			rdreq=>rdreq_datain,	
			wrreq=>wrreq_datain,
			q=>q_datain,
			empty=>rdempty_datain,
			full=>wrfull_datain); 

		--FIFO data_in FSM 
		data_in: process(clk,rst) is
		begin
			if rst = '0' then
				write_state_datain <= idle;
				read_state_datain <= idle;
			elsif clk'event and clk = '1' then

				--Add incoming packet to FIFO
				data_datain <= pkt32bseg_i;

				--Write state for data_in
				case write_state_datain is
					when idle =>
						if wrfull_datain = '0' then
							write_state_datain <= wr;
						end if;
					when wr =>
						if wrfull_datain = '1' then
							write_state_datain <= idle;
						end if;
					when others => 
						write_state_datain <= idle;
				end case;

				--Read state for data_in
				case read_state_datain is
					when idle =>
						if rdempty_datain = '0' then
							read_state_datain <= rd;
						end if;
					when rd =>
						if rdempty_datain = '1' then
							read_state_datain <= idle;
						end if;
					when others => 
						read_state_datain <= idle;
				end case;
			end if;
		end process;

		--FIFO data_in Requests
		wrreq_datain <= '1' when write_state_datain = wr else '0';
		rdreq_datain <= '1' when read_state_datain = rd and mulready = '1' else '0';

		--Divide q_data_in into bytes
		generate_din_divide: for i in 0 to (3) generate
			q_datain_bytes(i) <= q_datain(((i*(h+1))+h) downto ((i*h)+i));
		end generate;
	--Data-in end.

	--Counters begin.
		count: process(clk, rst) is
		begin
			if rst = '0' then
				mulready <= '1';
				mulcount <= 0;
				inPacketCount <= 0;
				outPacketCount <= 0;
				rowCount <= -1;
				sumCount <= 0;
				outCount <= 0;
				outVectorCount <= 0;
				en_output <= '0';
			elsif clk'event and clk = '1' then

				--Increment multiplier counter. 
				mulcount <= mulcount +1;

				--Count if multiplier is finished. Takes m-1 cycles.
				if mulcount = (m-1) then
					--Set multiplier ready flag.
					mulready <= '1';
					--Reset multiplier counter
					mulcount <= 0;
					--Increment rows counted (Number of 32 bit packet segments)
					rowCount  <= (rowCount + 1);
					--Offset rowCount by 1 for sumCount
					if rowCount = 1 then
						sumCount <= 0;
					else
						sumCount  <= sumCount + 1;
					end if;
					outCount  <= outCount + 1;
				elsif mulcount = 0 then
					mulready <= '0';
					--Begin outPacketCounter when rowCount is at 2, the multiplier output is only valid from then on. This is due to the data_in FIFO delay.
					if rowCount = 2 then
						outPacketCount <= outPacketCount + 1;
					end if;
					--Begin outCount, at offset to mulCount. outCount is used to index the output result as 32b segments. 
					outCount  <= outCount + 1;
				elsif mulcount = 1 then
					mulready <= '0';
					--Reset outCounter index.
					outCount <= 0;
				else
					mulready <= '0';
					--Increment outCount
					outCount  <= outCount + 1;
				end if;

				--Check if all input packet segments have been seen
				if rowCount = 16 then
					rowCount <= 0;
					--16, 4 byte input packet segments have been received, therefore a new packet. 
					--Increment input packet counter. 
					inPacketCount <= inPacketCount + 1;
				end if;

				--Check if packets should be output or not.
				--Ouput only when outPacketCount reaches h, and stop when h + 1. Encoding is complete.
				if outPacketCount = h then
					en_output <= '1';
				elsif outPacketCount = (h + 1) then
					en_output <= '0';
				end if;

				--Offset sumCount by one clk cycle, for output vector counter. 
				outVectorCount <= sumCount;

			end if;
		end process;
	--Counters end.

	--Pseudo-random-gen begin.
		--Pseudo-random number generator input and output.
		pseudo: process(clk,rst) is
		begin
			if rst = '0' then
				pseudoin(7 downto 0) <= (others=>'0');
				pseudoin(15 downto 8) <= (others=>'0');
				pseudoin(23 downto 16) <= (others=>'0');
				pseudoin(31 downto 24) <= (others=>'0');
				pseudoin(39 downto 32) <= (others=>'0');
				pseudoin(47 downto 40) <= (others=>'0');
				pseudoin(55 downto 48) <= (others=>'0');
			elsif clk'event and clk = '1' then

				--Pseudo-random inputs.
				--Generate new set of coding coefficients for each input packet. Changes as inputPacketCount increases.
				case inPacketCount is
					when 0 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(157, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(19, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(20, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(213, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(244, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(92, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(201, 8));
					when 1 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(181, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(109, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(170, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(47, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(95, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(183, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(224, 8));
					when 2 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(214, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(185, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(19, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(207, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(247, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(235, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(155, 8));
					when 3 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(252, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(21, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(69, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(139, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(36, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(115, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(217, 8));
					when 4 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(153, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(255, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(7, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(226, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(116, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(11, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(41, 8));
					when 5 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(49, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(84, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(83, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(14, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(154, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(71, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(113, 8));
					when 6 =>
						pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(207, 8));
						pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(105, 8));
						pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(131, 8));
						pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(107, 8));
						pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(33, 8));
						pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(241, 8));
						pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(151, 8));
					when others =>
						pseudoin(7 downto 0) <= rcoeffs(0);
						pseudoin(15 downto 8) <= rcoeffs(1);
						pseudoin(23 downto 16) <= rcoeffs(2);
						pseudoin(31 downto 24) <= rcoeffs(3);
						pseudoin(39 downto 32) <= rcoeffs(4);
						pseudoin(47 downto 40) <= rcoeffs(5);
						pseudoin(55 downto 48) <= rcoeffs(6);
				end case;

				--Pseudo-random outputs.
				--Output Coding Coeffs as 32b segments. 
				if mulcount = 2 and rowCount = 0 then
					coeffs_out(7 downto 0) <= pseudoin_bytes(0);
					coeffs_out(15 downto 8) <= pseudoin_bytes(1);
					coeffs_out(23 downto 16) <= pseudoin_bytes(2);
					coeffs_out(31 downto 24) <= pseudoin_bytes(3);
				elsif mulcount = 3 and rowCount = 0 then
					coeffs_out(7 downto 0) <= pseudoin_bytes(4);
					coeffs_out(15 downto 8) <= pseudoin_bytes(5);
					coeffs_out(23 downto 16) <= pseudoin_bytes(6);
					coeffs_out(31 downto 24) <= (others=>'0');
				else --Set remaining to zero
					coeffs_out(7 downto 0) <= (others=>'0');
					coeffs_out(15 downto 8) <= (others=>'0');
					coeffs_out(23 downto 16) <= (others=>'0');
					coeffs_out(31 downto 24) <= (others=>'0');
				end if;

			end if;
		end process;

		--Divide pseudoin into individual bytes for processing.
		generate_pin_divide: for i in 0 to (h-1) generate
			pseudoin_bytes(i) <= pseudoin(((i*(h+1))+h) downto ((i*h)+i));
		end generate;
	--Pseudo-random-gen end.

	--Data-multiply  begin.
		multiply: process(clk, rst) is
		begin
			if rst = '0' then

			elsif clk'event and clk = '1' then
				
				--Check if multipliers are ready, then update Multiplier Operands.
				--Multiplication is done on each incoming packet.
				if mulready = '1' then 
					--Reset multiplier
					mulsrst <= '1';
					for i in 0 to (h-1) loop 
						mul1(i) <= q_datain_bytes(0);-- Packet in
						mul2(i) <= pseudoin_bytes(i);-- Random Coeff
					end loop;
					for i in (h*1) to ((h*1)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(1);-- Packet in
						mul2(i) <= pseudoin_bytes(i-(h*1));-- Random Coeff
					end loop;
					for i in (h*2) to ((h*2)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(2);-- Packet in
						mul2(i) <= pseudoin_bytes(i-(h*2));-- Random Coeff
					end loop;
					for i in (h*3) to ((h*3)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(3);-- Packet in
						mul2(i) <= pseudoin_bytes(i-(h*3));-- Random Coeff
					end loop;
				end if;

			end if;
		end process;
	--Data-multiply end.

	--Data-add begin.
		--Add all multiplied values.
		add: process(clk,rst)
		begin
			if rst = '0' then
				--Reset all sum vectors.
				for i in 0 to (h-1) loop
					for j in 0 to 63 loop
						sum_vectors(i)(j) <= (others=>'0');
					end loop;
				end loop;
			elsif (clk'event and clk = '1') then --and rowCount > 2

				--Add numbers once multiplication has completed. 
				--Addition happens as rows are multiplied.
				if mulready = '1' then

					for i in 0 to (h-1) loop
							sum_vectors(i)((sumCount)*4)       <= sum_vectors(i)((sumCount)*4)  xor rslt_m(i);
							sum_vectors(i)(((sumCount)*4) + 1) <= sum_vectors(i)(((sumCount)*4) + 1) xor rslt_m(i+h);
							sum_vectors(i)(((sumCount)*4) + 2) <= sum_vectors(i)(((sumCount)*4) + 2) xor rslt_m(i+(h*2));
							sum_vectors(i)(((sumCount)*4) + 3) <= sum_vectors(i)(((sumCount)*4) + 3) xor rslt_m(i+(h*3));	
					end loop;

				end if;

			end if;
		end process;
	--Data-add end.

	--Data-out begin.
		data_out: process(clk, rst) is
		begin
			if rst = '0' then
				--Reset output packet.
				pkt32bseg_o(7 downto 0)   <= (others=>'0');
				pkt32bseg_o(15 downto 8)  <= (others=>'0');
				pkt32bseg_o(23 downto 16) <= (others=>'0');
				pkt32bseg_o(31 downto 24) <= (others=>'0');
			elsif clk'event and clk = '1' then

				--Output encoded packets.
				--Cant output at outCount = 7, as that is when multipliers are reset.
				if (outCount < 7) and (en_output = '1') then
					pkt32bseg_o(7 downto 0)   <= sum_vectors(outCount)(outVectorCount*4);
					pkt32bseg_o(15 downto 8)  <= sum_vectors(outCount)((outVectorCount*4) + 1);
					pkt32bseg_o(23 downto 16) <= sum_vectors(outCount)((outVectorCount*4) + 2);
					pkt32bseg_o(31 downto 24) <= sum_vectors(outCount)((outVectorCount*4) + 3);
				else
					pkt32bseg_o(7 downto 0)   <= (others=>'0');
					pkt32bseg_o(15 downto 8)  <= (others=>'0');
					pkt32bseg_o(23 downto 16) <= (others=>'0');
					pkt32bseg_o(31 downto 24) <= (others=>'0');
				end if;

			end if;
		end process;
	--Data-out end.

end architecture ; -- rtl
