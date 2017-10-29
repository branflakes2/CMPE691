library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity round9_10 is

port(
    input       :   in  std_logic_vector(0 to 127);
    round9_key  :   in  std_logic_vector(0 to 127);
    output      :   out std_logic_vector(0 to 127)
);

end round9_10;

architecture behavior of round9_10 is

    component sboxes
    port(
        input   :   in  std_logic_vector(0 to 127);
        output  :   out std_logic_vector(0 to 127)
    );
    end component;

    component shift_row
    port(
        input   :   in  std_logic_vector(0 to 127);
        output  :   out std_logic_vector(0 to 127)
    );
    end component;

    component mix_column
    port(
        input   :   in  std_logic_vector(0 to 127);
        output  :   out std_logic_vector(0 to 127)
    );
    end component;

    component key_schedule
    port(
        input_key   :   in  std_logic_vector(0 to 127);
        RC          :   in  std_logic_vector(0 to 7);
        output_key  :   out std_logic_vector(0 to 127)
    );
    end component;

    signal sbox_out         :   std_logic_vector(0 to 127);
    signal shift_row_out    :   std_logic_vector(0 to 127);
    signal mix_column_out   :   std_logic_vector(0 to 127);
    signal round9_out       :   std_logic_vector(0 to 127);
    signal round10_key      :   std_logic_vector(0 to 127);
    signal sbox_out_2       :   std_logic_vector(0 to 127);
    signal shift_row_out_2  :   std_logic_vector(0 to 127);

begin

    sbox1   :   sboxes      port map(input, sbox_out);
    sr1     :   shift_row   port map(sbox_out, shift_row_out);
    mc      :   mix_column  port map(shift_row_out, mix_column_out);
    round9_out <= mix_column_out xor round9_key;
    
    sbox2   :   sboxes          port map(round9_out, sbox_out_2);
    sr2     :   shift_row       port map(sbox_out_2, shift_row_out_2);
    ksched  :   key_schedule    port map(round9_key, b"00110110", round10_key);
    output <= shift_row_out_2 xor round10_key;

end behavior;
      
