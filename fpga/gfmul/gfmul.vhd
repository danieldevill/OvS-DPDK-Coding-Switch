library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfmul is
generic(m : integer := 8);
port(
	 -- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 operand_1 : in std_logic_vector(m-1 downto 0);
	 operand_2 : in std_logic_vector(m-1 downto 0);
	 
	 -- Outputs
	 rslt : out std_logic_vector(m-1 downto 0));

end entity gfmul;

architecture rtl of gfmul is

	signal rslt_lfsr : std_logic_vector(m-1 downto 0);
	signal rslt_mulv : std_logic_vector(m-1 downto 0);
	signal count : integer;
begin
	lfsr: process(clk,rst) is
	begin
		if rst = '0' then
			rslt_lfsr <= (others=>'0');
			count <= m-1;
		elsif clk'event and clk = '1' then
			--Linear Feedback Shift
			rslt_lfsr(7) <= rslt_mulv(6);
			rslt_lfsr(6) <= rslt_mulv(5);
			rslt_lfsr(5) <= rslt_mulv(4);
			rslt_lfsr(4) <= rslt_mulv(3) xor rslt_lfsr(7);
			rslt_lfsr(3) <= rslt_mulv(2) xor rslt_lfsr(7);
			rslt_lfsr(2) <= rslt_mulv(1) xor rslt_lfsr(7);
			rslt_lfsr(1) <= rslt_mulv(0);
			rslt_lfsr(0) <= rslt_mulv(7);

			if count = 0 then
				count <= m - 1;
				rslt_lfsr <= (others=>'0');
			else
				count <= count - 1;
			end if;

		end if;
	end process;

	mul: process(rst,count,rslt_lfsr,operand_1,operand_2)
	begin
		if rst = '0' then
			rslt_mulv <= (others=>'0');
		else
			--Multiply two operands then mod p
			rslt_mulv(0) <= rslt_lfsr(0) xor (operand_1(0) and operand_2(count));
			rslt_mulv(1) <= rslt_lfsr(1) xor (operand_1(1) and operand_2(count));
			rslt_mulv(2) <= rslt_lfsr(2) xor (operand_1(2) and operand_2(count));
			rslt_mulv(3) <= rslt_lfsr(3) xor (operand_1(3) and operand_2(count));
			rslt_mulv(4) <= rslt_lfsr(4) xor (operand_1(4) and operand_2(count));
			rslt_mulv(5) <= rslt_lfsr(5) xor (operand_1(5) and operand_2(count));
			rslt_mulv(6) <= rslt_lfsr(6) xor (operand_1(6) and operand_2(count));
			rslt_mulv(7) <= rslt_lfsr(7) xor (operand_1(7) and operand_2(count));
		end if;
	
	end process;

	rslt <= rslt_mulv;

end architecture;