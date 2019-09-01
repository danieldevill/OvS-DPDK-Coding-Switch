library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfdiv is
generic(m : integer := 8);
port(
	 -- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 operand_1 : in std_logic_vector(m-1 downto 0);
	 operand_2 : in std_logic_vector(m-1 downto 0);
	 
	 -- Outputs
	 rslt : out std_logic_vector(m-1 downto 0));

end entity gfdiv;

architecture rtl of gfdiv is

	component gfmul is
		generic(m : integer := 8);
		port (
			-- Inputs
			clk,rst : in std_logic;
			operand_1,operand_2 : in std_logic_vector(m-1 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(m-1 downto 0));
	end component gfmul;

	component gfinv is
		  port (
		  	-- Inputs
		  	clk : in std_logic;
		  	rst : in std_logic;
		  	operand : in std_logic_vector(7 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(7 downto 0));
	end component gfinv;

	signal operand_inv : std_logic_vector(7 downto 0);

begin

	gfmul_1 : gfmul 
	generic map(m => m)
	port map(clk=>clk, 
		rst=>rst, 
		operand_1=>operand_1, 
		operand_2=>operand_inv, 
		rslt=>rslt);

	gfinv_1 : gfinv
	port map(clk=>clk,
		rst=>rst,
		operand=>operand_2,
		rslt=>operand_inv);

end architecture;