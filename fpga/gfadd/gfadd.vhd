library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfadd is
generic(m : integer := 8);
port(
	 -- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 operand_1 : in std_logic_vector(m-1 downto 0);
	 operand_2 : in std_logic_vector(m-1 downto 0);
	 
	 -- Outputs
	 rslt : out std_logic_vector(m-1 downto 0));

end entity gfadd;

architecture rtl of gfadd is
	
begin

	process(clk,rst) is
	begin
		if rst = '0' then
			rslt <= (others=>'0');
		elsif clk'event and clk = '1' then
			for i in 0 to (m-1) loop
				rslt(i) <= operand_1(i) xor operand_2(i);
			end loop ; -- bitloop
		end if;
	end process;

end architecture ; -- rtl