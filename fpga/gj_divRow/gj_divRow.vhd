library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gj_divRow is
generic(m : integer := 8; -- Galois Field Size, default 8 bits.
		h : integer := 7; -- Generation Size, default 7 bytes.
		N : integer := 64); -- Packet Size, default 64 bytes.
port (
	-- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 a : in std_logic_vector(7 downto 0); -- Number to divide by
	 pkt32bseg_coef_in : in std_logic_vector(55 downto 0); 
	 pkt32bseg_data_in : in std_logic_vector(511 downto 0); 

	-- Outputs
	pkt32bseg_coef_out : out std_logic_vector(55 downto 0); 
	pkt32bseg_data_out : out std_logic_vector(511 downto 0);
	done_o : out std_logic);

end entity ; -- gj_divRow

architecture rtl of gj_divRow is

	component gfdiv is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfdiv;

	type std_logic_vector_array_coefficients is array ((h-1) downto 0) of std_logic_vector(m-1 downto 0);
	type std_logic_vector_array_datain is array ((N-1) downto 0) of std_logic_vector(m-1 downto 0);

	signal coeffs_in : std_logic_vector_array_coefficients;
	signal data_in : std_logic_vector_array_datain;

	signal coeffs_out : std_logic_vector_array_coefficients;
	signal data_out : std_logic_vector_array_datain;

	signal divcount : integer := 0;

	signal done : std_logic := '0';

begin

	--h dividers
	generate_divsh: for i in 0 to (h-1) generate 
		gfdiv_h : gfdiv 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>rst, 
			operand_1=>coeffs_in(i), 
			operand_2=>a, 
			rslt=>coeffs_out(i));
	end generate generate_divsh;

	--N dividers
	generate_divsN: for i in 0 to (N-1) generate 
		gfdiv_N : gfdiv 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>rst, 
			operand_1=>data_in(i), 
			operand_2=>a, 
			rslt=>data_out(i));
	end generate generate_divsN;

	--Process to count to 7 for divider
	process(clk,rst) is
	begin
		if rst = '0' then
			divcount <= 0;
			done <= '0';
		elsif clk'event and clk = '1' then
			divcount <= divcount + 1;
			if divcount = 14 then
				done <= '1';
			else
				done <= '0';
			end if;
		end if;
	end process;

	--Process to split Ri and Rj into std_vector_arrays
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				coeffs_in(i) <= (others=>'0');
			end loop;
			for i in 0 to (N-1) loop
				data_in(i) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			if divcount = 6 then
				for i in 0 to (h-1) loop
					coeffs_in(i) <= pkt32bseg_coef_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
				end loop;
				for i in 0 to (N-1) loop
					data_in(i) <= pkt32bseg_data_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
				end loop;
			end if;
		end if;
	end process;

	--Map output signals to out ports
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				pkt32bseg_coef_out(((i*(h+1))+h) downto ((i*h)+i)) <= (others=>'0');
			end loop;
			for i in 0 to (N-1) loop
				pkt32bseg_data_out(((i*(h+1))+h) downto ((i*h)+i)) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			if done = '1' then
				for i in 0 to (h-1) loop
					pkt32bseg_coef_out(((i*(h+1))+h) downto ((i*h)+i)) <= coeffs_out(i);
				end loop;
				for i in 0 to (N-1) loop
					pkt32bseg_data_out(((i*(h+1))+h) downto ((i*h)+i)) <= data_out(i);
				end loop;
			end if;
		end if;
	end process;

	done_o <= done;

end architecture ; -- rtl