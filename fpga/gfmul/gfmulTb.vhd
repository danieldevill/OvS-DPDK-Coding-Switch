library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity gfmulTb is
end entity gfmulTb;

architecture sim of gfmulTb is
	-- Inputs
	constant ClockFrequencyHz : integer := 100e6;
	constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
	signal clk : std_logic := '1';
	signal rst : std_logic:= '0';
	constant m : integer := 8; 
	signal operand_1 : std_logic_vector(m-1 downto 0);
	signal operand_2 : std_logic_vector(m-1 downto 0);
	file file_operand1 : text;
	file file_operand2 : text;
	file file_rslt : text;
	signal end_sim : integer := 0;
	signal mulrslt : std_logic_vector(m-1 downto 0);

	-- Outputs
	signal rslt : std_logic_vector(m-1 downto 0);

	--VHDL Surf example to compare outputs.
	function mult285 (v1, v2 : in std_logic_vector) return std_logic_vector is
	constant m              : integer := 8;  
	variable dummy          : std_logic;
	variable v_temp         : std_logic_vector(m-1 downto 0);
	variable ret            : std_logic_vector(m-1 downto 0);
	variable count 			: integer := 0;
	begin
	  v_temp := (others=>'0');   -- 1 + x^2 + x^3 + x^4 + x^8
	  for i in 0 to m-1 loop 
	    dummy     := v_temp(7);
	    v_temp(7 ) := v_temp(6 );
	    v_temp(6 ) := v_temp(5 );
	    v_temp(5 ) := v_temp(4 );
	    v_temp(4 ) := v_temp(3 ) xor dummy;
	    v_temp(3 ) := v_temp(2 ) xor dummy;
	    v_temp(2 ) := v_temp(1 ) xor dummy;
	    v_temp(1 ) := v_temp(0 );
	    v_temp(0 ) := dummy;
	    for j in 0 to m-1 loop
	      v_temp(j) := v_temp(j) xor (v1(j) and v2(m-i-1));
	      count := count + 1;
	    end loop;

	  end loop;
	  ret := v_temp;
	  report "End of First Multiply after: " & integer'image(count) & "operations";
	  count := 0;
	  return ret;
	end mult285;

begin
	-- The Device Under Test (DUT)
	i_gfmul1 : entity work.gfmul(rtl)
	generic map(m => m)
	port map (
		clk => clk,
		rst => rst,
		operand_1 => operand_1,
		operand_2 => operand_2,
		rslt => rslt);

	-- Process for generating clock
	clk <= not clk after ClockPeriod / 2;


	process is 
		variable v_ILINE : line;
		variable v_OLINE : line;
		variable v_operand1 : std_logic_vector(m-1 downto 0);
		variable v_operand2 : std_logic_vector(m-1 downto 0);
		variable v_rslt : std_logic_vector(m-1 downto 0);
	begin
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- Take the DUT out of resetz
		rst <= '1';

		file_open(file_operand1,"./../../operand1_vectors.txt",read_mode);
		file_open(file_operand2,"./../../operand2_vectors.txt",read_mode);
		file_open(file_rslt, "./../../rslt_vectors.txt", write_mode);

		while not (endfile(file_operand1)) loop
			readline(file_operand1, v_ILINE);
			read(v_ILINE, v_operand1);
			readline(file_operand2, v_ILINE);
			read(v_ILINE, v_operand2);

			operand_1 <= v_operand1;
			operand_2 <= v_operand2;

			mulrslt <= mult285(v_operand1,v_operand2);

			for i in 0 to m-1 loop
			wait for 10 ns;
			end loop;

			write(v_OLINE,rslt, right, 8);
			writeline(file_rslt,v_OLINE);
	
		end loop;

		file_close(file_operand1);
		file_close(file_operand2);
		file_close(file_rslt);
	
		wait for 100 ns;
		assert FALSE Report "SImulation Finished" severity FAILURE;
	end process;

end architecture ; -- sim

