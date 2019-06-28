library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity gj_eliminationTb is
end entity ; -- gj_eliminationTb

architecture sim of gj_eliminationTb is
	-- Constants
	constant m : integer := 8; 
	constant h : integer := 7;
	constant N : integer := 64; 

	-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';

	signal pkt32bseg_coef_in : std_logic_vector(55 downto 0);
	signal pkt32bseg_data_in : std_logic_vector(511 downto 0); 

	file file_pkt32bseg_i : text;
	file file_coeffs_i : text;

	-- Outputs
	file file_pkt32bseg_o, file_coeffs_o : text;
	signal pkt32bseg_data_out : std_logic_vector(511 downto 0);
	signal pkt32bseg_coef_out : std_logic_vector(55 downto 0);

begin

	-- The Device Under Test (DUT)
	i_gj_elimination1: entity work.gj_elimination
	generic map(
		m => m,
		h => h,
		N => N)
	port map(
		clk => clk,
		rst => rst,
		pkt32bseg_coef_in => pkt32bseg_coef_in,
		pkt32bseg_data_in => pkt32bseg_data_in,
		pkt32bseg_data_out => pkt32bseg_data_out,
		pkt32bseg_coef_out => pkt32bseg_coef_out);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;

	process is 
		variable v_ILINE : line;
		variable v_OLINE : line;
		variable v_pkt32bseg_i : std_logic_vector(511 downto 0);
		variable v_pkt32bseg_o : std_logic_vector(511 downto 0);
		variable v_coeffs_i : std_logic_vector(55 downto 0);
		variable v_coeffs_o : std_logic_vector(55 downto 0);
		variable count_row : integer := 0;

	begin 
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- Take the DUT out of resetz
		rst <= '1';

		file_open(file_pkt32bseg_i,"./../../packets_in.txt",read_mode);
		file_open(file_pkt32bseg_o,"./../../packets_out.txt",write_mode);
		file_open(file_coeffs_o,"./../../coeffs_out.txt",write_mode);
		file_open(file_coeffs_i,"./../../coeffs_in.txt",read_mode);

		while (count_row < 7) loop

			readline(file_coeffs_i, v_ILINE);
			hread(v_ILINE,v_coeffs_i);
			pkt32bseg_coef_in <= v_coeffs_i;

			readline(file_pkt32bseg_i, v_ILINE);
			hread(v_ILINE,v_pkt32bseg_i);
			pkt32bseg_data_in <= v_pkt32bseg_i;

			wait for 10 ns;

			hwrite(v_OLINE, pkt32bseg_data_out);
			writeline(file_pkt32bseg_o,v_OLINE);

			hwrite(v_OLINE, pkt32bseg_coef_out);
			writeline(file_coeffs_o,v_OLINE);
			
			count_row := count_row + 1;

		end loop;

		while 1 = 1 loop
			hwrite(v_OLINE, pkt32bseg_data_out);
			writeline(file_pkt32bseg_o,v_OLINE);

			hwrite(v_OLINE, pkt32bseg_coef_out);
			writeline(file_coeffs_o,v_OLINE);
			wait for 10 ns;
		end loop;

		file_close(file_pkt32bseg_i);
		file_close(file_coeffs_i);
		file_close(file_coeffs_o);
		file_close(file_pkt32bseg_o);

	end process;

end architecture ; -- sim