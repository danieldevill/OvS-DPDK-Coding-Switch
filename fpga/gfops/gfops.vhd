library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfops is
generic(m : integer := 8);
port(
	 -- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 operand_1 : in std_logic_vector(m-1 downto 0);
	 operand_2 : in std_logic_vector(m-1 downto 0);
	 sel : in std_logic;

	 -- Outputs
	 rslt : out std_logic_vector(m-1 downto 0));

end entity gfops;

architecture rtl of gfops is

	component gfmul is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfmul;

	component gfadd is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfadd;

	signal rslt_m : std_logic_vector(m-1 downto 0);	
	signal rslt_a : std_logic_vector(m-1 downto 0);	

begin

	gfmul_1 : gfmul 
	generic map(m => m)
	port map(clk=>clk, rst=>rst, operand_1=>operand_1, operand_2=>operand_2, rslt =>rslt_m);
	gfadd_1 : gfadd 
	generic map(m => m)
	port map(clk=>clk, rst=>rst, operand_1=>operand_1, operand_2=>operand_2, rslt =>rslt_a);
		
rslt <= rslt_a when sel = '0' else rslt_m;

end architecture ; -- rtl