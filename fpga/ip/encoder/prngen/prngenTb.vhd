library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity prngenTb is
end entity prngenTb;

architecture sim of prngenTb is
	-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';
	constant m : integer := 8; 
	constant seed : integer := 31;

	-- Outputs
	signal rslt : std_logic_vector(m-1 downto 0);

begin
	-- The Device Under Test (DUT)
	i_prngen1 : entity work.prngen(rtl)
	generic map (
		m => m,
		seed => seed)
	port map (
		clk => clk,
		rst => rst,
		rslt => rslt);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;

	process is
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- Take the DUT out of resetz
		rst <= '1';

		for i in 0 to m-1 loop
		wait for 10 ns;
		end loop;

		wait;

	end process;

end architecture ; -- sim