library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity gfinvTb is
end entity ; -- gfinvTb

architecture sim of gfinvTb is
	-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';
	signal operand : std_logic_vector(7 downto 0);
	-- Outputs
	signal rslt : std_logic_vector(7 downto 0);

begin

	-- The Device Under Test (DUT)
	i_gfinv1 : entity work.gfinv(rtl)
	port map(
		clk => clk,
		rst => rst,
		operand => operand,
		rslt => rslt);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;

	process is 
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- Take the DUT out of resetz
		rst <= '1';

		operand <= std_logic_vector(to_unsigned(254,operand'length));

		while 1 = 1 loop
			wait for 10 ns;
		end loop;

	end process;

end architecture ; -- sim