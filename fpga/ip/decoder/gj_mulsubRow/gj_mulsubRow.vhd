library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gj_mulsubRow is
generic(m : integer := 8; -- Galois Field Size, default 8 bits.
		h : integer := 7; -- Generation Size, default 7 bytes.
		N : integer := 64); -- Packet Size, default 64 bytes.
port (
	-- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 a : in std_logic_vector(7 downto 0); -- Number to multiply by

	 pkt_coef_i_in : in std_logic_vector(55 downto 0); 
	 pkt_coef_j_in : in std_logic_vector(55 downto 0); 

	 pkt_data_i_in : in std_logic_vector(511 downto 0); 
	 pkt_data_j_in : in std_logic_vector(511 downto 0); 

	-- Outputs
	pkt_coef_out : out std_logic_vector(55 downto 0); 
	pkt_data_out : out std_logic_vector(511 downto 0);
	done_o : out std_logic);

end entity ; -- gj_mulsubRow

architecture rtl of gj_mulsubRow is

	component gfmul is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfmul;

	type std_logic_vector_array_coefficients is array ((h-1) downto 0) of std_logic_vector(m-1 downto 0);
	type std_logic_vector_array_datain is array ((N-1) downto 0) of std_logic_vector(m-1 downto 0);

	signal coeffs_in_Ri : std_logic_vector_array_coefficients;
	signal coeffs_in_Rj : std_logic_vector_array_coefficients;

	signal data_in_Ri : std_logic_vector_array_datain;
	signal data_in_Rj : std_logic_vector_array_datain;

	signal coeffs_mul_out : std_logic_vector_array_coefficients;
	signal data_mul_out : std_logic_vector_array_datain;

	signal coeffs_out : std_logic_vector_array_coefficients;
	signal data_out : std_logic_vector_array_datain;

	signal mulcount : integer := 0;

	signal done : std_logic := '0';

begin

	--h multipliers
	generate_mulsh: for i in 0 to (h-1) generate 
		gfmul_h : gfmul 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>rst, 
			operand_1=>coeffs_in_Ri(i), 
			operand_2=>a, 
			rslt=>coeffs_mul_out(i));
	end generate generate_mulsh;

	--N multipliers
	generate_mulsN: for i in 0 to (N-1) generate 
		gfmul_N : gfmul 
		generic map(m => m)
		port map(clk=>clk, 
			rst=>rst, 
			operand_1=>data_in_Ri(i), 
			operand_2=>a, 
			rslt=>data_mul_out(i));
	end generate generate_mulsN;

	--Process to count to 15 for multiplier
	process(clk,rst) is
	begin
		if rst = '0' then
			mulcount <= 0;
			done <= '0';
		elsif clk'event and clk = '1' then
			mulcount <= mulcount + 1;
			if mulcount = 15 then
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
				coeffs_in_Ri(i) <= (others=>'0');
				coeffs_in_Rj(i) <= (others=>'0');
			end loop;
			for i in 0 to (N-1) loop
				data_in_Ri(i) <= (others=>'0');
				data_in_Rj(i) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			if mulcount = 6 then
				for i in 0 to (h-1) loop
					coeffs_in_Ri(i) <= pkt_coef_i_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					coeffs_in_Rj(i) <= pkt_coef_j_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
				end loop;
				for i in 0 to (N-1) loop
					data_in_Ri(i) <= pkt_data_i_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					data_in_Rj(i) <= pkt_data_j_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
				end loop;
			end if;
		end if;
	end process;

	--Process: Subtract aRi from Rj
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				coeffs_out(i) <= (others=>'0');
			end loop;
			for i in 0 to (N-1) loop
				data_out(i) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			for i in 0 to (h-1) loop
				coeffs_out(i) <= coeffs_mul_out(i) xor coeffs_in_Rj(i);
			end loop;
			for i in 0 to (N-1) loop
				data_out(i) <= data_mul_out(i) xor data_in_Rj(i);
			end loop;
		end if;
	end process;

	--Map output signals to out ports
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				pkt_coef_out(((i*(h+1))+h) downto ((i*h)+i)) <= (others=>'0');
			end loop;
			for i in 0 to (N-1) loop
				pkt_data_out(((i*(h+1))+h) downto ((i*h)+i)) <= (others=>'0');
			end loop;
		elsif clk'event and clk = '1' then
			if done = '1' then
				for i in 0 to (h-1) loop
					pkt_coef_out(((i*(h+1))+h) downto ((i*h)+i)) <= coeffs_out(i);
				end loop;
				for i in 0 to (N-1) loop
					pkt_data_out(((i*(h+1))+h) downto ((i*h)+i)) <= data_out(i);
				end loop;
			end if;
		end if;
	end process;

	done_o <= done;

end architecture ; -- rtl