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

	component gj_elimination is
		generic(m : integer := 8;
				h : integer := 7; 
				N : integer := 64); 
		port (
			-- Inputs
			 clk : in std_logic;
			 rst : in std_logic;
			 en : in std_logic;
			 pkt_coef_in : in std_logic_vector(55 downto 0); 
			 pkt_data_in : in std_logic_vector(511 downto 0); 

			-- Outputs
			pkt_coef_out : out std_logic_vector(55 downto 0); 
			pkt_data_out : out std_logic_vector(511 downto 0);
			done_o : out std_logic);
	end component gj_elimination;

	--FSM Signals
	type state is (gj_elim, load, complete, idle);
	signal net_decoder_state : state := load;
	signal load_count : integer := 0;
	signal complete_count : integer := 0;
	signal load_done : std_logic;
	signal complete_done : std_logic;

	signal clk_gj_elim : std_logic := '0';
	signal clk_gj_elim_en : std_logic := '0';
	signal packet_count : integer := 0;
	signal complete_packet : std_logic;
	signal complete_packet_count : integer := 0;

	signal en_gj : std_logic := '0';

	signal r0 : std_logic;
	signal r1 : std_logic;

	--gj_elimination Signals
	signal pkt_coef_in : std_logic_vector(55 downto 0);
	signal pkt_data_in : std_logic_vector(511 downto 0);

	signal pkt_data_out : std_logic_vector(511 downto 0);

	signal gj_elimination_done : std_logic;

begin

	--gj_elimination
	gj_elimination_1 : gj_elimination
	generic map (m => m,
			 h => h,
			 N => N)
	port map (
		clk => clk,
		rst => rst,
		en => en_gj,
		pkt_coef_in => pkt_coef_in,
		pkt_data_in => pkt_data_in,
		pkt_data_out => pkt_data_out,
		done_o => gj_elimination_done);

	--Load 
	process(clk,rst) is
	begin
		if rst = '0' then
			load_count <= 15;
			complete_count <= 15;
			packet_count <= 0;
		elsif clk'event and clk = '1' then
		
			if net_decoder_state = load then
				if load_count = 0 then
					--Load in pkt32bseg_i to pkt_data_in, at load_count = 0.
					pkt_data_in( 7 downto 0)   <= pkt32bseg_i(7 downto 0);
					pkt_data_in( 15 downto 8)  <= pkt32bseg_i(15 downto 8);
					pkt_data_in( 23 downto 16) <= pkt32bseg_i(23 downto 16);
					pkt_data_in( 31 downto 24) <= pkt32bseg_i(31 downto 24);

					packet_count <= packet_count + 1;
					load_count <= 15;

					clk_gj_elim_en <= '1';

				else
					load_count <= load_count - 1;
					clk_gj_elim_en <= '0';
					--Load in pkt32bseg_i to pkt_data_in, at other load_count instances.
					for i in 0 to 15 loop
						if load_count = i then
							pkt_data_in( (7+(32*i)) downto (0+(32*i)) )   <= pkt32bseg_i(7 downto 0);
							pkt_data_in( (15+(32*i)) downto (8+(32*i)) )  <= pkt32bseg_i(15 downto 8);
							pkt_data_in( (23+(32*i)) downto (16+(32*i)) ) <= pkt32bseg_i(23 downto 16);
							pkt_data_in( (31+(32*i)) downto (24+(32*i)) ) <= pkt32bseg_i(31 downto 24);
						end if;
					end loop;
					--Load in coeffs_in to pkt_coef_in.
					if load_count = 15 then
						pkt_coef_in( (31) downto (24) ) <= coeffs_in(7 downto 0);
						pkt_coef_in( (39) downto (32) ) <= coeffs_in(15 downto 8);
						pkt_coef_in( (47) downto (40) ) <= coeffs_in(23 downto 16);
						pkt_coef_in( (55) downto (48) ) <= coeffs_in(31 downto 24);
					elsif load_count = 14 then
						pkt_coef_in( (7) downto (0) ) <= coeffs_in(7 downto 0);
						pkt_coef_in( (15) downto (8) ) <= coeffs_in(15 downto 8);
						pkt_coef_in( (23) downto (16) ) <= coeffs_in(23 downto 16);
					end if;
				end if;

				--Set load_done flag when generation number of packets are loaded in.
				if packet_count = (h-1) and load_count = 1 then
					load_done <= '1';
				end if; 

			end if;

			if net_decoder_state = complete then
				if complete_count = 0 then
					--Load out pkt32bseg_o from pkt_data_out, at complete_count = 0.
					pkt32bseg_o(7 downto 0) <= pkt_data_out(7 downto 0);
					pkt32bseg_o(15 downto 8) <= pkt_data_out(15 downto 8);
					pkt32bseg_o(23 downto 16) <= pkt_data_out(23 downto 16);
					pkt32bseg_o(31 downto 24) <= pkt_data_out(31 downto 24);

					complete_count <= 15;
					complete_packet <= '0';
					complete_packet_count <= complete_packet_count + 1;
				else

					if complete_count = 1 then
						complete_packet <= '1';
					else
						complete_packet <= '0';
					end if;

					complete_count <= complete_count - 1;
					--Load out pkt32bseg_o from pkt_data_out, at other complete_count instances.
					for i in 0 to 15 loop
						if complete_count = i then
							pkt32bseg_o(7 downto 0) <= pkt_data_out( (7+(32*i)) downto (0+(32*i)) );
							pkt32bseg_o(15 downto 8) <= pkt_data_out( (15+(32*i)) downto (8+(32*i)) );
							pkt32bseg_o(23 downto 16) <= pkt_data_out( (23+(32*i)) downto (16+(32*i)) );
							pkt32bseg_o(31 downto 24) <= pkt_data_out( (31+(32*i)) downto (24+(32*i)) );
						end if;
					end loop;
				end if;

				--Set complete_done flag when generation number of packets are loaded out.
				if complete_packet_count = (h-1) and complete_count = 1 then
					complete_done <= '1';
				end if;

			end if;
		end if;
	end process;

	--FSM
	process(clk,rst) is
	begin
		if rst = '0' then
			net_decoder_state <= load;
		elsif clk'event and clk = '1' then
			case net_decoder_state is
				when gj_elim =>
					if gj_elimination_done = '1' and complete_packet_count = 0 then
						net_decoder_state  <= complete;
					else
						net_decoder_state <= gj_elim;
					end if;
				when load =>
					if load_done = '1' then
						net_decoder_state <= gj_elim;
					else
						net_decoder_state <= load;
					end if;
				when complete =>
					if complete_done = '1' then
						net_decoder_state <= idle;
					else 
						net_decoder_state <= complete;
					end if;
				when others =>
					net_decoder_state <= idle;
			end case;
		end if;
	end process;

	--Enable Gauss-Jordan Elmination at Specific Intervals.
	en_gj <= '1' when ((clk_gj_elim_en = '1') and (gj_elimination_done = 'U' or ( (complete_packet = '1') ))) else '0';


end architecture ; -- rtl