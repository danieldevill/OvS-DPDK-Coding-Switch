library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity prngen is
generic(seed : integer := 31;
		m : integer := 8);
port(
	-- Inputs
	clk : in std_logic;
	rst : in std_logic;

	-- Outputs
	rslt : out std_logic_vector(m-1 downto 0));

end entity prngen;

architecture rtl of prngen is 

	signal rslt_lfsr : std_logic_vector(m-1 downto 0);
begin
	lfsr: process(clk, rst) is
	begin
		if rst = '0' then
			rslt_lfsr <= std_logic_vector(to_unsigned(seed,rslt_lfsr'length));
		elsif (clk'event and clk = '1') then
			--Linear Feedback Shift
			rslt_lfsr(7) <= rslt_lfsr(6);
			rslt_lfsr(6) <= rslt_lfsr(5);
			rslt_lfsr(5) <= rslt_lfsr(4);
			rslt_lfsr(4) <= rslt_lfsr(3) xor rslt_lfsr(7);
			rslt_lfsr(3) <= rslt_lfsr(2) xor rslt_lfsr(7);
			rslt_lfsr(2) <= rslt_lfsr(1) xor rslt_lfsr(7);
			rslt_lfsr(1) <= rslt_lfsr(0);
			rslt_lfsr(0) <= rslt_lfsr(7);
		end if;
	end process;

	rslt <= rslt_lfsr;

end architecture;
