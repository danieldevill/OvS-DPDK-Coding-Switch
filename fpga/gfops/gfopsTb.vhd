library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity gfopsTb is
end entity gfopsTb;

architecture sim of gfopsTb is
		-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';
	constant m : integer := 8; 
	signal operand_1 : std_logic_vector(m-1 downto 0);
	signal operand_2 : std_logic_vector(m-1 downto 0);
	signal sel : std_logic;
	file file_operand1 : text;
	file file_operand2 : text;
	file file_sel : text;
	file file_rslt : text;

	-- Outputs
	signal rslt : std_logic_vector(m-1 downto 0);

begin

	-- The Device Under Test (DUT)
	i_gfops1 : entity work.gfops(rtl)
	generic map(m => m)
	port map (
		clk => clk,
		rst => rst,
		operand_1 => operand_1,
		operand_2 => operand_2,
		sel => sel,
		rslt => rslt);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;

	process is 
		variable v_ILINE : line;
		variable v_OLINE : line;
		variable v_operand1 : integer;
		variable v_operand2 : integer;
		variable v_sel : std_logic;
		variable v_rslt : integer;
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- Take the DUT out of resetz
		rst <= '1';

		file_open(file_operand1,"./../../operand1_vectors.txt",read_mode);
		file_open(file_operand2,"./../../operand2_vectors.txt",read_mode);
		file_open(file_sel,"./../../sel.txt",read_mode);
		file_open(file_rslt, "./../../rslt_vectors.txt", write_mode);

		while not (endfile(file_sel)) loop
			readline(file_operand1, v_ILINE);
			read(v_ILINE, v_operand1);
			readline(file_operand2, v_ILINE);
			read(v_ILINE, v_operand2);

			readline(file_sel, v_ILINE);
			read(v_ILINE, v_sel);


			operand_1 <= std_logic_vector(to_unsigned(v_operand1,operand_1'length));
			operand_2 <= std_logic_vector(to_unsigned(v_operand2,operand_2'length));

			sel <= v_sel;

			if v_sel = '0' then
				for i in 0 to m-1 loop
					wait for 10 ns;
				end loop;
			elsif v_sel = '1' then
				for i in 0 to m-1 loop
					wait for 10 ns;
				end loop;
			end if;

			write(v_OLINE,to_integer(unsigned(rslt)), right, 8);
			writeline(file_rslt,v_OLINE);
	
		end loop;

		file_close(file_operand1);
		file_close(file_operand2);
		file_close(file_rslt);
	
		assert FALSE Report "SImulation Finished" severity FAILURE;
	end process;

end architecture ; -- sim