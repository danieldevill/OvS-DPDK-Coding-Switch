	component mm is
		port (
			clk_clk                             : in  std_logic                     := 'X';             -- clk
			master_read_control_fixed_location  : in  std_logic                     := 'X';             -- fixed_location
			master_read_control_read_base       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_base
			master_read_control_read_length     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_length
			master_read_control_go              : in  std_logic                     := 'X';             -- go
			master_read_control_done            : out std_logic;                                        -- done
			master_read_control_early_done      : out std_logic;                                        -- early_done
			master_read_user_read_buffer        : in  std_logic                     := 'X';             -- read_buffer
			master_read_user_buffer_output_data : out std_logic_vector(31 downto 0);                    -- buffer_output_data
			master_read_user_data_available     : out std_logic;                                        -- data_available
			master_write_control_fixed_location : in  std_logic                     := 'X';             -- fixed_location
			master_write_control_write_base     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_base
			master_write_control_write_length   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_length
			master_write_control_go             : in  std_logic                     := 'X';             -- go
			master_write_control_done           : out std_logic;                                        -- done
			master_write_user_write_buffer      : in  std_logic                     := 'X';             -- write_buffer
			master_write_user_buffer_input_data : in  std_logic_vector(31 downto 0) := (others => 'X'); -- buffer_input_data
			master_write_user_buffer_full       : out std_logic;                                        -- buffer_full
			reset_reset_n                       : in  std_logic                     := 'X'              -- reset_n
		);
	end component mm;

	u0 : component mm
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                  clk.clk
			master_read_control_fixed_location  => CONNECTED_TO_master_read_control_fixed_location,  --  master_read_control.fixed_location
			master_read_control_read_base       => CONNECTED_TO_master_read_control_read_base,       --                     .read_base
			master_read_control_read_length     => CONNECTED_TO_master_read_control_read_length,     --                     .read_length
			master_read_control_go              => CONNECTED_TO_master_read_control_go,              --                     .go
			master_read_control_done            => CONNECTED_TO_master_read_control_done,            --                     .done
			master_read_control_early_done      => CONNECTED_TO_master_read_control_early_done,      --                     .early_done
			master_read_user_read_buffer        => CONNECTED_TO_master_read_user_read_buffer,        --     master_read_user.read_buffer
			master_read_user_buffer_output_data => CONNECTED_TO_master_read_user_buffer_output_data, --                     .buffer_output_data
			master_read_user_data_available     => CONNECTED_TO_master_read_user_data_available,     --                     .data_available
			master_write_control_fixed_location => CONNECTED_TO_master_write_control_fixed_location, -- master_write_control.fixed_location
			master_write_control_write_base     => CONNECTED_TO_master_write_control_write_base,     --                     .write_base
			master_write_control_write_length   => CONNECTED_TO_master_write_control_write_length,   --                     .write_length
			master_write_control_go             => CONNECTED_TO_master_write_control_go,             --                     .go
			master_write_control_done           => CONNECTED_TO_master_write_control_done,           --                     .done
			master_write_user_write_buffer      => CONNECTED_TO_master_write_user_write_buffer,      --    master_write_user.write_buffer
			master_write_user_buffer_input_data => CONNECTED_TO_master_write_user_buffer_input_data, --                     .buffer_input_data
			master_write_user_buffer_full       => CONNECTED_TO_master_write_user_buffer_full,       --                     .buffer_full
			reset_reset_n                       => CONNECTED_TO_reset_reset_n                        --                reset.reset_n
		);

