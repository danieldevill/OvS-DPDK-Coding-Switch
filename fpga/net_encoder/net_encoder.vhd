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
	 pkt32bseg_i : in std_logic_vector(31 downto 0); -- This is not a 64 byte packet .....

	 -- Outputs
	 pkt32bseg_o : out std_logic_vector(31 downto 0));

end entity net_encoder;

architecture rtl of net_encoder is
type write_state_Type is (idle, wr);
type read_state_Type is (idle, rd);

	signal write_state_datain : write_state_Type := idle;
	signal read_state_datain : read_state_Type := idle;

	signal write_state_pseudoin : write_state_Type := idle;
	signal read_state_pseudoin : read_state_Type := idle;

	component fifo32x1024 is
		port (
			-- Inputs
			data : in std_logic_vector(31 downto 0); 
			rdclk, rdreq, wrclk, wrreq : in std_logic;

			-- Outputs
			q : out std_logic_vector(31 downto 0); 
			rdempty, wrfull : out std_logic);
	end component fifo32x1024;

	component fifo56x16 is
		port (
			-- Inputs
			data : in std_logic_vector(55 downto 0); 
			rdclk, rdreq, wrclk, wrreq : in std_logic;

			-- Outputs
			q : out std_logic_vector(55 downto 0); 
			rdempty, wrfull : out std_logic);
	end component fifo56x16;

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
	signal din_ready : std_logic := '1';	

	-- Pseudo-Random Coefficients
	signal rcoeffs :  std_logic_vector_array_coefficients;
	--Pseudo-Random FIFO
	signal rdreq_pseudoin, wrreq_pseudoin, rdempty_pseudoin, wrfull_pseudoin : std_logic;
	signal data_pseudoin, q_pseudoin0, q_pseudoin : std_logic_vector(55 downto 0);
	signal q_pseudoin_bytes  : std_logic_vector_array_coefficients;
	signal pseudo_done : std_logic := '0';

	-- Multiplier Signals
	signal rslt_m : std_logic_vector_array;	
	signal mul1, mul2 : std_logic_vector_array;
	signal mulready : std_logic := '1';
	signal mulcount : integer := 0;	
	signal mulsrst : std_logic := '0';
	signal muldone : std_logic := '0';
	--Multiplier FIFOs
	signal rdreq_mulfifos, wrreq_mulfifos, rdempty_mulfifos, wrfull_mulfifos : std_logic_vector(h downto 0);
	signal data_mulfifos, q_mulfifos : std_logic_vector_array_mulfifos;
	signal write_state_mulrslts : write_state_mulrslt;
	signal read_state_mulrslts : read_state_mulrslt;

	--Packet counter
	signal packetCount : integer := 0;
	signal rowCount : integer := -1;

	--Sum Signals
	signal sumready : std_logic := '0';
	signal sum_vectors : std_logic_vector_array_sumops;

begin

	fifo32x1024_datain : fifo32x1024
	port map(
		data=>data_datain,
		rdclk=>clk,
		rdreq=>rdreq_datain,
		wrclk=>clk,		
		wrreq=>wrreq_datain,
		q=>q_datain,
		rdempty=>rdempty_datain,
		wrfull=>wrfull_datain); 

	fifo56x16_pseudoin : fifo56x16
	port map(
		data=>data_pseudoin,
		rdclk=>clk,
		rdreq=>rdreq_pseudoin,
		wrclk=>clk,		
		wrreq=>wrreq_pseudoin,
		q=>q_pseudoin0,
		rdempty=>rdempty_pseudoin,
		wrfull=>wrfull_pseudoin); 

	generate_coeffs: for i in 0 to (h-1) generate --h coeffs, Per single packet
		prngen_1 : prngen
		generic map(seed => seed+i, m => m)
		port map(clk=>clk,
			rst=>rst,
			rslt=>rcoeffs(i));
		end generate generate_coeffs;

	generate_muls: for i in 0 to ((h*4)-1) generate --h multipliers
		gfmul_1 : gfmul 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>mulsrst, 
			operand_1=>mul1(i), 
			operand_2=>mul2(i), 
			rslt=>rslt_m(i));
	end generate generate_muls;

	multiply: process(clk, rst) is
	begin
		if rst = '0' then

		elsif clk'event and clk = '1' then
			
				mulcount <= mulcount +1;

				if (mulcount=7) then
					mulready <= '1';
					mulcount <= 0;
					muldone <= '0';
					rowCount  <= (rowCount + 1);
				elsif mulcount=0 then
					muldone <= '1';
					mulready <= '0';
				else
					mulready <= '0';
					muldone <= '0';
				end if;

				if rowCount = 16 then
					rowCount <= 0;
					packetCount <= packetCount + 1;
				end if;

				if packetCount = h then
					sumready <= '1';
					packetCount <= 0;
				else
					sumready <= '0';
				end if;


				if mulready = '1' then 
					mulsrst <= '1';
					for i in 0 to (h-1) loop 
						mul1(i) <= q_datain_bytes(0);-- Packet in
						mul2(i) <= q_pseudoin_bytes(i);-- Random Coeff
					end loop;
					for i in (h*1) to ((h*1)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(1);-- Packet in
						mul2(i) <= q_pseudoin_bytes(i-(h*1));-- Random Coeff
					end loop;
					for i in (h*2) to ((h*2)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(2);-- Packet in
						mul2(i) <= q_pseudoin_bytes(i-(h*2));-- Random Coeff
					end loop;
					for i in (h*3) to ((h*3)+(h-1)) loop 
						mul1(i) <= q_datain_bytes(3);-- Packet in
						mul2(i) <= q_pseudoin_bytes(i-(h*3));-- Random Coeff
					end loop;
				end if;
		end if;
	end process;

	generate_mulfifos: for i in 0 to (h-1) generate
		fifo32x1024_mulfifos : fifo32x1024
		port map(
			data=>data_mulfifos(i),
			rdclk=>clk,
			rdreq=>rdreq_mulfifos(i),
			wrclk=>clk,
			wrreq=>wrreq_mulfifos(i),
			q=>q_mulfifos(i),
			rdempty=>rdempty_mulfifos(i),
			wrfull=>wrfull_mulfifos(i)); 
	end generate generate_mulfifos;

	--FIFO mul_results FSM
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				write_state_mulrslts(i) <= idle;
				read_state_mulrslts(i) <= idle;
			end loop;
		elsif clk'event and clk = '1' then

			for i in 0 to (h-1) loop

				data_mulfifos(i)(7 downto 0) <= rslt_m(i);
				data_mulfifos(i)(15 downto 8) <= rslt_m(i+h);
				data_mulfifos(i)(23 downto 16) <= rslt_m(i+(h*2));
				data_mulfifos(i)(31 downto 24) <= rslt_m(i+(h*3));

				case write_state_mulrslts(i) is
					when idle =>
						if wrfull_mulfifos(i) = '0' then
							write_state_mulrslts(i) <= wr;
						end if;
					when wr =>
						if wrfull_mulfifos(i) = '1' then
							write_state_mulrslts(i) <= idle;
						end if;
					when others => 
						write_state_mulrslts(i) <= idle;
				end case;

				case read_state_mulrslts(i) is
					when idle =>
						if rdempty_mulfifos(i) = '0' then
							read_state_mulrslts(i) <= rd;
						end if;
					when rd =>
						if rdempty_mulfifos(i) = '1' then
							read_state_mulrslts(i) <= idle;
						end if;
					when others => 
						read_state_mulrslts(i) <= idle;
				end case;

			end loop;	

		end if;

	end process;

	--FIFO mulfifos Requests
	generate_mulrsltstates: for i in 0 to (h-1) generate
		wrreq_mulfifos(i) <= '1' when write_state_mulrslts(i) = wr and muldone = '1' else '0';
		rdreq_mulfifos(i) <= '1' when read_state_mulrslts(i) = rd else '0';
	end generate generate_mulrsltstates;
	
	--FIFO data_in FSM
	process(clk,rst) is
	begin
		if rst = '0' then
			write_state_datain <= idle;
			read_state_datain <= idle;
		elsif clk'event and clk = '1' then

			data_datain <= pkt32bseg_i;

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

	--FIFO pseudo_in FSM
	process(clk,rst) is
	begin
		if rst = '0' then
			write_state_pseudoin <= idle;
			read_state_pseudoin <= idle;
		elsif clk'event and clk = '1' then

			--Turn rcoeffs off for testing
			--data_pseudoin(7 downto 0) <= rcoeffs(0);
			--data_pseudoin(15 downto 8) <= rcoeffs(1);
			--data_pseudoin(23 downto 16) <= rcoeffs(2);
			--data_pseudoin(31 downto 24) <= rcoeffs(3);
			--data_pseudoin(39 downto 32) <= rcoeffs(4);
			--data_pseudoin(47 downto 40) <= rcoeffs(5);
			--data_pseudoin(55 downto 48) <= rcoeffs(6);

			case packetCount is
				when 0 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(157, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(19, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(20, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(213, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(244, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(92, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(201, 8));
				when 1 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(181, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(109, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(170, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(47, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(95, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(183, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(224, 8));
				when 2 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(214, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(185, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(19, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(207, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(247, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(235, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(155, 8));
				when 3 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(252, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(21, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(69, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(139, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(36, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(115, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(217, 8));
				when 4 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(153, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(255, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(7, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(226, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(116, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(11, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(41, 8));
				when 5 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(49, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(84, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(83, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(14, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(154, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(71, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(113, 8));
				when 6 =>
					q_pseudoin(7 downto 0) <= std_logic_vector(to_unsigned(207, 8));
					q_pseudoin(15 downto 8) <= std_logic_vector(to_unsigned(105, 8));
					q_pseudoin(23 downto 16) <= std_logic_vector(to_unsigned(131, 8));
					q_pseudoin(31 downto 24) <= std_logic_vector(to_unsigned(107, 8));
					q_pseudoin(39 downto 32) <= std_logic_vector(to_unsigned(33, 8));
					q_pseudoin(47 downto 40) <= std_logic_vector(to_unsigned(241, 8));
					q_pseudoin(55 downto 48) <= std_logic_vector(to_unsigned(151, 8));
				when others =>
					q_pseudoin(7 downto 0) <= rcoeffs(0);
					q_pseudoin(15 downto 8) <= rcoeffs(1);
					q_pseudoin(23 downto 16) <= rcoeffs(2);
					q_pseudoin(31 downto 24) <= rcoeffs(3);
					q_pseudoin(39 downto 32) <= rcoeffs(4);
					q_pseudoin(47 downto 40) <= rcoeffs(5);
					q_pseudoin(55 downto 48) <= rcoeffs(6);
			end case;

			--pseudo_done <= '1';

			case write_state_pseudoin is
				when idle =>
					if wrfull_pseudoin = '0' then
						write_state_pseudoin <= wr;
					end if;
				when wr =>
					if wrfull_pseudoin = '1' then
						write_state_pseudoin <= idle;
					end if;
				when others => 
					write_state_pseudoin <= idle;
			end case;

			case read_state_pseudoin is
				when idle =>
					if rdempty_pseudoin = '0' then
						read_state_pseudoin <= rd;
					end if;
				when rd =>
					if rdempty_pseudoin = '1' then
						read_state_pseudoin <= idle;
					end if;
				when others => 
					read_state_pseudoin <= idle;
			end case;
		end if;
	end process;

	--FIFO pseudo_in Requests
	wrreq_pseudoin <= '1' when write_state_pseudoin = wr else '0';
	rdreq_pseudoin <= '1' when read_state_pseudoin = rd and mulready = '1' else '0';

	--Divide q_pseudoin into bytes
	generate_pin_divide: for i in 0 to (h-1) generate
		q_pseudoin_bytes(i) <= q_pseudoin(((i*(h+1))+h) downto ((i*h)+i));
	end generate;

	--Divide q_mulfifos into sum_vectors
	--generate_mulfifos_divide: for i in 0 to (h-1) generate
	--	sum_vectors(i)(packetCount*4)       <= q_mulfifos(i)(7 downto 0);
	--	sum_vectors(i)((packetCount*4) + 1) <= q_mulfifos(i)(15 downto 8);
	--	sum_vectors(i)((packetCount*4) + 2) <= q_mulfifos(i)(23 downto 16);
	--	sum_vectors(i)((packetCount*4) + 3) <= q_mulfifos(i)(31 downto 24);	
	--end generate;

	--Add
	process(clk,rst)
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				for j in 0 to 63 loop
					sum_vectors(i)(j) <= (others=>'0');
				end loop;
			end loop;
		elsif (clk'event and clk = '1') and rowCount > 2 and mulready = '1' then
			for i in 0 to (h-1) loop
					sum_vectors(i)((rowCount-3)*4)       <= sum_vectors(i)((rowCount-3)*4)  xor q_mulfifos(i)(7 downto 0);
					sum_vectors(i)(((rowCount-3)*4) + 1) <= sum_vectors(i)(((rowCount-3)*4) + 1) xor q_mulfifos(i)(15 downto 8);
					sum_vectors(i)(((rowCount-3)*4) + 2) <= sum_vectors(i)(((rowCount-3)*4) + 2) xor q_mulfifos(i)(23 downto 16);
					sum_vectors(i)(((rowCount-3)*4) + 3) <= sum_vectors(i)(((rowCount-3)*4) + 3) xor q_mulfifos(i)(31 downto 24);	
			end loop;
		end if;
	end process;


end architecture ; -- rtl