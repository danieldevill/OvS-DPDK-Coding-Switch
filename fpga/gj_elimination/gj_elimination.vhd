library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gj_elimination is
generic(m : integer := 8; -- Galois Field Size, default 8 bits.
		h : integer := 7; -- Generation Size, default 7 bytes.
		N : integer := 64); -- Packet Size, default 64 bytes.
port (
	-- Inputs
	 clk : in std_logic;
	 rst : in std_logic;
	 pkt32bseg_coef_in : in std_logic_vector(55 downto 0); 
	 pkt32bseg_data_in : in std_logic_vector(511 downto 0); 

	-- Outputs
	pkt32bseg_coef_out : out std_logic_vector(55 downto 0); 
	pkt32bseg_data_out : out std_logic_vector(511 downto 0);
	done_o : out std_logic);

end entity ; -- gj_elimination

architecture rtl of gj_elimination is

	component gj_mulsubRow is
		generic(m : integer := 8;
				h : integer := 7; 
				N : integer := 64); 
		port (
			-- Inputs
			 clk : in std_logic;
			 rst : in std_logic;
			 a : in std_logic_vector(7 downto 0); 

			 pkt32bseg_coef_i_in : in std_logic_vector(55 downto 0); 
			 pkt32bseg_coef_j_in : in std_logic_vector(55 downto 0); 

			 pkt32bseg_data_i_in : in std_logic_vector(511 downto 0); 
			 pkt32bseg_data_j_in : in std_logic_vector(511 downto 0); 

			-- Outputs
			pkt32bseg_coef_out : out std_logic_vector(55 downto 0); 
			pkt32bseg_data_out : out std_logic_vector(511 downto 0);
			done_o : out std_logic);
	end component gj_mulsubRow;

	component gj_divRow is
		generic(m : integer := 8;
				h : integer := 7; 
				N : integer := 64); 
		port (
			-- Inputs
			 clk : in std_logic;
			 rst : in std_logic;
			 a : in std_logic_vector(7 downto 0); -- Number to divide by
			 pkt32bseg_coef_in : in std_logic_vector(55 downto 0); 
			 pkt32bseg_data_in : in std_logic_vector(511 downto 0); 

			-- Outputs
			pkt32bseg_coef_out : out std_logic_vector(55 downto 0); 
			pkt32bseg_data_out : out std_logic_vector(511 downto 0);
			done_o : out std_logic);
	end component gj_divRow;

	type std_logic_vector_array_coefficients is array ((h-1) downto 0) of std_logic_vector(m-1 downto 0); --Type for coeff row.
	type std_logic_vector_array_datain is array ((N-1) downto 0) of std_logic_vector(m-1 downto 0); --Type for data_in row.

	type std_logic_vector_array_array_coefficients is array ((h-1) downto 0) of std_logic_vector_array_coefficients; --Type for entire coeff matrix.
	type std_logic_vector_array_array_datain is array ((h-1) downto 0) of std_logic_vector_array_datain; --Type for entire data_in matrix.

	signal coeff_matrix : std_logic_vector_array_array_coefficients;
	signal data_matrix : std_logic_vector_array_array_datain;

	type state is (idle, load, mulsubRow, divRow , complete);

	signal gj_elimination_state : state := idle;

	signal load_done, mulsub_done, div_done, complete_done : std_logic;

	signal load_count : integer := 0;
	signal complete_count : integer := 0;
	signal lower_triangle_count : integer := 0;
	signal upper_triangle_count : integer := 0;

	signal lower_triangle : std_logic := '0';
	signal upper_triangle : std_logic := '0';

	--gj_divRows Signals
	signal a_rowDiv : std_logic_vector(7 downto 0) := "00000001";
	signal pkt32bseg_coef_in_rowDiv : std_logic_vector(55 downto 0);
	signal pkt32bseg_data_in_rowDiv : std_logic_vector(511 downto 0);
	signal pkt32bseg_coef_out_rowDiv : std_logic_vector(55 downto 0);
	signal pkt32bseg_data_out_rowDiv : std_logic_vector(511 downto 0);
	signal done_o_rowDiv : std_logic;
	signal rst_rowDiv : std_logic := '0';
	signal divRow_count : integer := 0;

	--gj_mulsubRows Signals
	type std_logic_vector_array_mulsub_a is array ((h-1) downto 0) of std_logic_vector((m-1) downto 0);
	type std_logic_vector_array_mulsub_coeffs is array ((h-1) downto 0) of std_logic_vector(55 downto 0);
	type std_logic_vector_array_mulsub_data_in is array ((h-1) downto 0) of std_logic_vector(511 downto 0);
	type std_logic_array_mulsub_done_o is array ((h-1) downto 0) of std_logic;
	signal a_mulsub : std_logic_vector_array_mulsub_a;
	signal pkt32bseg_coef_i_in_mulsub : std_logic_vector_array_mulsub_coeffs;
	signal pkt32bseg_coef_j_in_mulsub : std_logic_vector_array_mulsub_coeffs;
	signal pkt32bseg_data_i_in_mulsub : std_logic_vector_array_mulsub_data_in;
	signal pkt32bseg_data_j_in_mulsub : std_logic_vector_array_mulsub_data_in;
	signal pkt32bseg_coef_out_mulsub : std_logic_vector_array_mulsub_coeffs;
	signal pkt32bseg_data_out_mulsub : std_logic_vector_array_mulsub_data_in;
	signal done_o_mulsub : std_logic_array_mulsub_done_o;
	signal rst_mulsub : std_logic := '0';

begin

	--gj_mulsubRows
	generate_gj_mulsubRows: for i in 0 to (h-1) generate 
		gj_mulsubRows_1 : gj_mulsubRow
		generic map (m => m,
				 h => h,
				 N => N)
		port map (
			clk => clk,
			rst => rst_mulsub,
			a => a_mulsub(i),
			pkt32bseg_coef_i_in => pkt32bseg_coef_i_in_mulsub(i),
			pkt32bseg_coef_j_in => pkt32bseg_coef_j_in_mulsub(i),
			pkt32bseg_data_i_in => pkt32bseg_data_i_in_mulsub(i),
			pkt32bseg_data_j_in => pkt32bseg_data_j_in_mulsub(i),
			pkt32bseg_coef_out => pkt32bseg_coef_out_mulsub(i),
			pkt32bseg_data_out => pkt32bseg_data_out_mulsub(i),
			done_o => done_o_mulsub(i));
	end generate generate_gj_mulsubRows;

	--gj_divRows
	gj_divRow_1 : gj_divRow
	generic map (m => m,
			 h => h,
			 N => N)
	port map (
		clk => clk,
		rst => rst_rowDiv,
		a => a_rowDiv,
		pkt32bseg_coef_in => pkt32bseg_coef_in_rowDiv,
		pkt32bseg_data_in => pkt32bseg_data_in_rowDiv,
		pkt32bseg_coef_out => pkt32bseg_coef_out_rowDiv,
		pkt32bseg_data_out => pkt32bseg_data_out_rowDiv,
		done_o => done_o_rowDiv);

	--FSM
	process(clk,rst) is
	begin
		if rst = '0' then
			gj_elimination_state <= load;
		elsif clk'event and clk = '1' then

			--Lower/Upper Triangle Counts
			if lower_triangle_count = 6 then
				lower_triangle <= '0';
				upper_triangle <= '1';
			end if;

			if upper_triangle_count = 6 then
				lower_triangle <= '0';
				upper_triangle <= '0';
			end if;

			case gj_elimination_state is
				when idle =>
					if lower_triangle = '1' then
						gj_elimination_state <= divRow;
					else
						gj_elimination_state <= idle;
					end if;
				when load =>
					if lower_triangle = '0' and load_done = '1' then
						gj_elimination_state <= divRow;
						lower_triangle <= '1';
					end if;
				when mulsubRow =>
					if lower_triangle = '1' and mulsub_done = '1' then
						gj_elimination_state <= divRow;
					elsif upper_triangle = '0' and lower_triangle = '0' then
						gj_elimination_state <= complete;
					end if;
				when divRow =>
					if lower_triangle = '1' and div_done = '1' then
						gj_elimination_state <= mulsubRow;
					elsif upper_triangle = '1' and div_done = '1' then
						gj_elimination_state <= mulsubRow;
					end if;
				when complete =>
					if complete_done = '1' then
						gj_elimination_state <= idle;
					end if;
				when others =>
					gj_elimination_state <= idle;
			end case;

		end if;
	end process;

	--Load Coeff and Data Matrices.
	process(clk,rst) is
	begin
		if rst = '0' then
			for j in 0 to (h-1) loop 
				for i in 0 to (h-1) loop
					coeff_matrix(j)(i) <= (others=>'0');
				end loop;
				for i in 0 to (N-1) loop
					data_matrix(j)(i) <= (others=>'0');
				end loop;
			end loop;
			load_count <= 0;
			complete_count <= 0;
		elsif clk'event and clk = '1' then
			if gj_elimination_state = load then
				if(load_count = h) then
					load_done <= '1';
				else
					load_count <= load_count + 1;
					for i in 0 to (h-1) loop
						coeff_matrix(load_count)(i) <= pkt32bseg_coef_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					end loop;
					for i in 0 to (N-1) loop
						data_matrix(load_count)(i) <= pkt32bseg_data_in( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					end loop;
				end if;
			else
				load_count <= 0;
			end if;

			if gj_elimination_state = divRow then
				if(div_done = '1') then
					--Set rows to divided rows.
					for i in 0 to (h-1) loop
						coeff_matrix(lower_triangle_count)(i) <= pkt32bseg_coef_out_rowDiv( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					end loop;
					for i in 0 to (N-1) loop
						data_matrix(lower_triangle_count)(i) <= pkt32bseg_data_out_rowDiv( ((i*m)+(m-1)) downto ((i*(m-1))+i) );
					end loop;
				end if;
			end if;

			if gj_elimination_state = mulsubRow then
				if(mulsub_done = '1') then
					--Set rows to divided rows.
					if lower_triangle = '1' then
						if lower_triangle_count = 1 then
							for i in 1 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif lower_triangle_count = 2 then
							for i in 2 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif lower_triangle_count = 3 then
							for i in 3 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif lower_triangle_count = 4 then
							for i in 4 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif lower_triangle_count = 5 then
							for i in 5 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif lower_triangle_count = 6 then
							for i in 6 to (h-1) loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						end if;
					elsif upper_triangle = '1' then
						if upper_triangle_count = 1 then
							for i in 0 to 0 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif upper_triangle_count = 2 then
							for i in 0 to 1 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif upper_triangle_count = 3 then
							for i in 0 to 2 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif upper_triangle_count = 4 then
							for i in 0 to 3 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif upper_triangle_count = 5 then
							for i in 0 to 4 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						elsif upper_triangle_count = 6 then
							for i in 0 to 5 loop
								for j in 0 to (h-1) loop
									coeff_matrix(i)(j) <= pkt32bseg_coef_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
								for j in 0 to (N-1) loop
									data_matrix(i)(j) <= pkt32bseg_data_out_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) );
								end loop;
							end loop;
						end if;
					end if;

				end if;
			end if;

			if gj_elimination_state = complete then
				if(complete_count = h) then
					complete_done <= '1';
				else
					complete_count <= complete_count + 1;
					for i in 0 to (h-1) loop
						pkt32bseg_coef_out( ((i*m)+(m-1)) downto ((i*(m-1))+i) ) <= coeff_matrix(complete_count)(i);
					end loop;
					for i in 0 to (N-1) loop
						pkt32bseg_data_out( ((i*m)+(m-1)) downto ((i*(m-1))+i) ) <= data_matrix(complete_count)(i);
					end loop;
				end if;
			else
				complete_count <= 0;
			end if;
		end if;
	end process;

	--DivRow State
	process(clk,rst) is
	begin
		if rst = '0' then
			a_rowDiv <= "00000001";
		elsif clk'event and clk = '1' then
			if gj_elimination_state = divRow then

				rst_rowDiv <= '1';

				--Divide by leading value in row.
				a_rowDiv <= coeff_matrix(lower_triangle_count)(lower_triangle_count);

				--Set rows to divide
				for i in 0 to (h-1) loop
					pkt32bseg_coef_in_rowDiv( ((i*m)+(m-1)) downto ((i*(m-1))+i) ) <= coeff_matrix(lower_triangle_count)(i);
				end loop;
				for i in 0 to (N-1) loop
					pkt32bseg_data_in_rowDiv( ((i*m)+(m-1)) downto ((i*(m-1))+i) ) <= data_matrix(lower_triangle_count)(i);
				end loop;

				if(done_o_rowDiv = '1') then
					div_done <= '1';
				end if;

			else
				--Reset rowDiv
				a_rowDiv <= "00000001";
				rst_rowDiv <= '0';
				div_done <= '0';
			end if;

		end if;
	end process;


	--MulsubState
	process(clk,rst) is
	begin
		if rst = '0' then
			for i in 0 to (h-1) loop
				a_mulsub(i) <= "00000001";
			end loop;
		elsif clk'event and clk = '1' then
			if gj_elimination_state = mulsubRow then

				rst_mulsub <= '1';

				if lower_triangle = '1' then

					if lower_triangle_count = 0 then
						for i in 1 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif lower_triangle_count = 1 then
						for i in 2 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif lower_triangle_count = 2 then
						for i in 3 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif lower_triangle_count = 3 then
						for i in 4 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif lower_triangle_count = 4 then
						for i in 5 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif lower_triangle_count = 5 then
						for i in 6 to (h-1) loop
							a_mulsub(i) <= coeff_matrix(i)(lower_triangle_count);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(lower_triangle_count)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(lower_triangle_count)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					end if;

					if(done_o_mulsub(0) = '1') then
						mulsub_done <= '1';
						lower_triangle_count <= lower_triangle_count + 1;
					end if;	
				end if;

				if upper_triangle = '1' then

					if upper_triangle_count = 0 then
						for i in 0 to 1 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif upper_triangle_count = 1 then
						for i in 0 to 2 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif upper_triangle_count = 2 then
						for i in 0 to 3 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif upper_triangle_count = 3 then
						for i in 0 to 4 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif upper_triangle_count = 4 then
						for i in 0 to 5 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					elsif upper_triangle_count = 5 then
						for i in 0 to 6 loop
							a_mulsub(i) <= coeff_matrix(i)(upper_triangle_count+1);
							for j in 0 to (h-1) loop
								pkt32bseg_coef_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(upper_triangle_count+1)(j);
								pkt32bseg_coef_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= coeff_matrix(i)(j);
							end loop;
							for j in 0 to (N-1) loop
								pkt32bseg_data_i_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(upper_triangle_count+1)(j);
								pkt32bseg_data_j_in_mulsub(i)( ((j*m)+(m-1)) downto ((j*(m-1))+j) ) <= data_matrix(i)(j);
							end loop;
						end loop;
					end if;

					if(done_o_mulsub(0) = '1') then
						upper_triangle_count <= upper_triangle_count + 1;
						mulsub_done <= '1';
					end if;	

					if mulsub_done = '1' then
						rst_mulsub <= '0';
						mulsub_done <= '0';
						for i in 0 to (h-1) loop
							a_mulsub(i) <= "00000001";
						end loop;
					end if;

				end if;

			else
				rst_mulsub <= '0';
				for i in 0 to (h-1) loop
					a_mulsub(i) <= "00000001";
				end loop;
				mulsub_done <= '0';
			end if;
		end if;
	end process;

end architecture ; -- rtl
