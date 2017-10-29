library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.numeric_std.all;
use work.STD_LOGIC_UNSIGNED.ALL;
use work.aes128Pkg.all;

entity aes_128 is
  port (
	clock : in std_logic;
	reset : in std_logic;
    data : in Matrix;
	key : in Matrix;
    ciphertext : out Matrix;
	done : out std_logic;
	faulty : in std_logic;
	fault_round : in std_logic_vector (3 downto 0);
	fault_function : in std_logic_vector (1 downto 0);
	fault_word : in std_logic_vector (1 downto 0);
	fault_byte : in std_logic_vector (1 downto 0);
	fault_bit : in std_logic_vector (2 downto 0);
	fault_word2 : in std_logic_vector (1 downto 0);
	fault_byte2 : in std_logic_vector (1 downto 0);
	fault_bit2 : in std_logic_vector (2 downto 0)
	);
end entity aes_128;

architecture Behavioral of aes_128 is

component keyXor_128
  port (
    In_DI_data : in Matrix;
	In_DI_key : in Matrix;
    Out_DO : out Matrix);
end component;

component sbox_128 is
  port (
    In_DI_128  : in  Matrix;
    Out_DO_128 : out Matrix);
end component;

component shiftRow_128
  port (
    In_DI : in Matrix;
    Out_DO : out Matrix);
end component;

component mixColumn_128
  port (
	In_DI_128  : in  Matrix;
	Out_DO_128 : out Matrix);
end component;

component keyExpansion
  port (
	user_key : in Matrix;
	round_1_key : out Matrix;
	round_2_key : out Matrix;
	round_3_key : out Matrix;
	round_4_key : out Matrix;
	round_5_key : out Matrix;
	round_6_key : out Matrix;
	round_7_key : out Matrix;
	round_8_key : out Matrix;
	round_9_key : out Matrix;
	round_10_key : out Matrix);
end component;

component fault_injector
  port (
	faulty : in std_logic;
	fault_round : in std_logic_vector (3 downto 0);
	fault_function : in std_logic_vector (1 downto 0);
	fault_word : in std_logic_vector (1 downto 0);
	fault_byte : in std_logic_vector (1 downto 0);
	fault_bit : in std_logic_vector (2 downto 0);
	fault_word2 : in std_logic_vector (1 downto 0);
	fault_byte2 : in std_logic_vector (1 downto 0);
	fault_bit2 : in std_logic_vector (2 downto 0);
	key_index_vector : in std_logic_vector (3 downto 0);
	keyXor_0_out : in Matrix;
	keyXor_10_out : in Matrix;
	keyXor_out : in Matrix;
	sbox_out : in Matrix;
	shiftRow_out : in Matrix;
	mixColumn_out : in Matrix;
	keyXor_0_out_eff : out Matrix;
	keyXor_10_out_eff : out Matrix;
	keyXor_out_eff : out Matrix;
	sbox_out_eff : out Matrix;
	shiftRow_out_eff : out Matrix;
	mixColumn_out_eff : out Matrix
	);
end component;

-- signals
signal data_sig, data_reg, user_key_sig, key_round : Matrix;
signal done_sig, faulty_sig, state : std_logic;
signal key_sig : roundkeyArrayType;
signal keyXor_0_out_sig, keyXor_0_out_eff_sig : Matrix;
signal keyXor_10_out_sig, keyXor_10_out_eff_sig : Matrix;
signal keyXor_out_sig, keyXor_out_eff_sig : Matrix;
signal sbox_out_sig, sbox_out_eff_sig : Matrix;
signal shiftRow_out_sig, shiftRow_out_eff_sig: Matrix;
signal mixColumn_out_sig, mixColumn_out_eff_sig : Matrix;
signal fault_round_sig : std_logic_vector (3 downto 0);
signal fault_function_sig : std_logic_vector (1 downto 0);
signal fault_word_sig : std_logic_vector (1 downto 0);
signal fault_byte_sig : std_logic_vector (1 downto 0);
signal fault_bit_sig : std_logic_vector (2 downto 0);
signal fault_word2_sig : std_logic_vector (1 downto 0);
signal fault_byte2_sig : std_logic_vector (1 downto 0);
signal fault_bit2_sig : std_logic_vector (2 downto 0);
signal key_index : integer range 0 to 11;
signal key_index_vector_sig : std_logic_vector(3 downto 0);

--Added error detection signals--
signal sbox_error   :   std_logic := '0';
signal srow_error   :   std_logic := '0';
signal scol_error   :   std_logic := '0';
signal akey_error   :   std_logic := '0';
signal err_detect   :   std_logic := '0';

begin

	-- output register
	T: process(clock,reset)
	begin
		if(reset='1') then
			done_sig <= '0';
			key_index <= 0;
			state <= '0';
		elsif(clock'event and clock='1') then
			if(state='0') then
				if(key_index < 11) then
					if(key_index = 0) then
						data_reg <= keyXor_0_out_eff_sig;
					elsif(key_index = 10) then
						data_reg <= keyXor_10_out_sig;
						done_sig <= '1';
					else
						data_reg <= keyXor_out_eff_sig;
					end if;
				end if;
				state <= '1';
			else
				if(done_sig='0') then
					key_index <= key_index + 1;
					state <= '0';
				end if;
			end if;
		end if;
	end process;
	
data_sig <= data;
user_key_sig <= key;
key_sig(0) <= key;	
key_round <= key_sig(key_index);
ciphertext <= data_reg;
done <= done_sig;
faulty_sig <= faulty;
fault_round_sig <=  fault_round;
fault_function_sig <= fault_function;
fault_word_sig <= fault_word;
fault_byte_sig <= fault_byte;
fault_bit_sig <= fault_bit;
fault_word2_sig <= fault_word2;
fault_byte2_sig <= fault_byte2;
fault_bit2_sig <= fault_bit2;
key_index_vector_sig <= std_logic_vector(to_unsigned(key_index, key_index_vector_sig'length));

-- component instantiations
keyExpansion_x: keyExpansion port map (user_key_sig,key_sig(1),key_sig(2),key_sig(3),key_sig(4),key_sig(5),key_sig(6),key_sig(7),key_sig(8),key_sig(9),key_sig(10));
keyXor_128_a: keyXor_128 port map (data_sig, key_sig(0), keyXor_0_out_sig);
sbox_128_x : sbox_128 port map (data_reg, sbox_out_sig);
shiftRow_128_x : shiftRow_128 port map (sbox_out_eff_sig, shiftRow_out_sig);
mixColumn_128_x : mixColumn_128 port map (shiftRow_out_eff_sig, mixColumn_out_sig);
keyXor_128_b: keyXor_128 port map (mixColumn_out_eff_sig, key_round, keyXor_out_sig);
keyXor_128_c: keyXor_128 port map (shiftRow_out_eff_sig, key_sig(10), keyXor_10_out_sig);

/* You should build your components around the following inputs/outputs of the fault injector:
-- data_reg/sbox_out_eff_sig: input/output of sbox operation for rounds 1-9
-- sbox_out_eff_sig/shiftRow_out_eff_sig: input/output shiftrow operation for rounds 1-9
-- shiftRow_out_eff_sig/mixColumn_out_eff_sig: input/output of mixcolumn operation for rounds 1-9
-- mixColumn_out_eff_sig/keyXor_out_eff_sig : input/output of keyXor operation for rounds 1-9
*/
fault_injector_x: fault_injector port map (faulty_sig, fault_round_sig, fault_function_sig, fault_word_sig, fault_byte_sig, fault_bit_sig, fault_word2_sig, fault_byte2_sig, fault_bit2_sig, key_index_vector_sig, keyXor_0_out_sig, keyXor_10_out_sig, keyXor_out_sig, sbox_out_sig, shiftRow_out_sig, mixColumn_out_sig, keyXor_0_out_eff_sig, keyXor_10_out_eff_sig, keyXor_out_eff_sig, sbox_out_eff_sig, shiftRow_out_eff_sig, mixColumn_out_eff_sig);

--Error Detection--
sbox_err    :   sbox_check port map(data_reg, sbox_out_eff_sig, sbox_error);
--row shift err detection
--col shift err detection
--add key err detection

err_detect <= sbox_error or srow_error or scol_error or akey_error;

signal sbox_error   :   std_logic;
signal srow_error   :   std_logic;
signal scol_error   :   std_logic;
signal akey_error   :   std_logic;
signal err_detect   :   std_logic;

end architecture Behavioral;
