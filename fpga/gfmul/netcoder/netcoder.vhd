library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity netcoder is
	port (
		A	:in		std_logic;
		B	:in 	std_logic;
		O	:out	std_logic);
	end netcoder;

architecture data_flow of netcoder is
	begin
		O <= A and B;
	end data_flow;