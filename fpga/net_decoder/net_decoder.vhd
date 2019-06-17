library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity net_decoder is
generic(m : integer := 8;
		h : integer := 7;
		N : integer := 64);
port(
	-- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 pkt32bseg_i : in std_logic_vector(31 downto 0); -- 4 byte packet segment input
	 coeffs_in : in std_logic_vector(31 downto 0);

	 -- Outputs
	 pkt32bseg_o : out std_logic_vector(31 downto 0)); -- 4 byte packet segment output

end entity net_decoder;

architecture rtl of net_decoder is

begin

end architecture ; -- rtl