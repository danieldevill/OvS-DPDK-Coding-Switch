library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity net_encoderTb is
end entity net_encoderTb;

architecture sim of net_encoderTb is
	-- Constants
	constant m : integer := 8; 
	constant h : integer := 7;
	constant N : integer := 64;
	constant seed : integer := 32;   

	-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';
	signal pkt32bseg_i : std_logic_vector(31 downto 0);
	file file_pkt32bseg_i : text;

	-- Outputs
	file file_pkt32bseg_o : text;
	signal pkt32bseg_o : std_logic_vector(31 downto 0);

begin
	-- The Device Under Test (DUT)
	i_net_encoder1: entity work.net_encoder(rtl)
	generic map(
		m => m,
		h => h,
		N => N,
		seed => seed)
	port map(
		clk => clk,
		rst => rst,
		pkt32bseg_i => pkt32bseg_i,
		pkt32bseg_o => pkt32bseg_o);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;

	process is 
		variable v_ILINE : line;
		variable v_OLINE : line;
		variable v_pkt32bseg_i : std_logic_vector(31 downto 0);
	begin 
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- Take the DUT out of resetz
		rst <= '1';

		file_open(file_pkt32bseg_i,"./../../packets_in.txt",read_mode);
		file_open(file_pkt32bseg_o,"./../../packets_out.txt",write_mode);

		while not (endfile(file_pkt32bseg_i)) loop
			readline(file_pkt32bseg_i, v_ILINE);
			read(v_ILINE,v_pkt32bseg_i);

			pkt32bseg_i <= v_pkt32bseg_i;

			wait for 10 ns;

			write(v_OLINE,pkt32bseg_o, right, 32);
			writeline(file_pkt32bseg_o,v_OLINE);

		end loop;

		file_close(file_pkt32bseg_i);
		file_close(file_pkt32bseg_o);
		
		assert FALSE Report "SImulation Finished" severity FAILURE;

	end process;

end architecture ; -- sim