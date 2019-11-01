library ieee;
use ieee.std_logic_1164.all;

entity gfinv_avalon_interface is
	port(
	-- Inputs
	clk, rst : in std_logic;
	read, write : in std_logic;
	writedata : in std_logic_vector(31 downto 0);
	-- Ouptuts
	readdata : out std_logic_vector(31 downto 0);
	rslt_export : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of gfinv_avalon_interface is

	signal to_mod,from_mod: std_logic_vector(31 downto 0);

	component gfinv is
		port (
		  	-- Inputs
		  	clk : in std_logic;
		  	rst : in std_logic;
		  	operand : in std_logic_vector(7 downto 0);
			
			-- Outputs
			rslt : out std_logic_vector(7 downto 0));
	end component gfinv;

begin

	to_mod <= writedata;

	gfinv0: gfinv port map(
		clk,
		rst,
		to_mod(7 downto 0),
		from_mod(7 downto 0)
	); 

	readdata <= from_mod;
	rslt_export <= from_mod(7 downto 0);

end architecture ; -- rtl