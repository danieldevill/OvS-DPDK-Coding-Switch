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

	--Data-in FIFO
	signal rdreq_datain, wrreq_datain, rdempty_datain, wrfull_datain : std_logic;
	signal data_datain, q_datain : std_logic_vector(31 downto 0);
	signal q_datain_bytes : std_logic_vector_array_datain;

	-- Pseudo-Random Coefficients
	signal rcoeffs :  std_logic_vector_array_coefficients;

	--Pseudo-Random FIFO
	signal rdreq_pseudoin, wrreq_pseudoin, rdempty_pseudoin, wrfull_pseudoin : std_logic;
	signal data_pseudoin, q_pseudoin : std_logic_vector(55 downto 0);
	signal q_pseudoin_bytes  : std_logic_vector_array_coefficients;

	-- Multiplier Results
	signal rslt_m : std_logic_vector_array;	

	-- Multiplier operands
	signal mul1, mul2 : std_logic_vector_array;

	--Multiplier counter
	signal mulcount : integer := 0;

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
		q=>q_pseudoin,
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
			rst=>rst, 
			operand_1=>mul1(i), 
			operand_2=>mul2(i), 
			rslt=>rslt_m(i));
	end generate generate_muls;

	multiply: process(clk, rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop 
				rslt_m(i) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			
			mulcount <= mulcount + 1;

			if mulcount = 7 then
				mulcount <= 0;
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

	--coded_byte_0 <= 

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
	rdreq_datain <= '1' when read_state_datain = rd and mulcount=7  else '0';

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

			data_pseudoin(7 downto 0) <= rcoeffs(0);
			data_pseudoin(15 downto 8) <= rcoeffs(1);
			data_pseudoin(23 downto 16) <= rcoeffs(2);
			data_pseudoin(31 downto 24) <= rcoeffs(3);
			data_pseudoin(39 downto 32) <= rcoeffs(4);
			data_pseudoin(47 downto 40) <= rcoeffs(5);
			data_pseudoin(55 downto 48) <= rcoeffs(6);

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
	rdreq_pseudoin <= '1' when read_state_pseudoin = rd and mulcount=7 else '0';

	--Divide q_pseudoin into bytes
	generate_pin_divide: for i in 0 to (h-1) generate
		q_pseudoin_bytes(i) <= q_pseudoin(((i*(h+1))+h) downto ((i*h)+i));
	end generate;

end architecture ; -- rtl