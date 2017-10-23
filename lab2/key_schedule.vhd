library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity key_schedule is

port(
    input_key   :   in  std_logic_vector(0 to 127);
    RC          :   in  std_logic_vector(0 to 7);
    output_key  :   out std_logic_vector(0 to 127)
);

end key_schedule;

architecture behavior of key_schedule is

component g
port(
    w_in    :   in  std_logic_vector(0 to 31);
    RC      :   in  std_logic_vector(0 to 7);
    w_out   :   out std_logic_vector(0 to 31)
);
end component;

signal w0       :   std_logic_vector(0 to 31);
signal w1       :   std_logic_vector(0 to 31);
signal w2       :   std_logic_vector(0 to 31);
signal w3       :   std_logic_vector(0 to 31);

signal g_out    :   std_logic_vector(0 to 31);
signal xor_1    :   std_logic_vector(0 to 31);
signal xor_2    :   std_logic_vector(0 to 31);
signal xor_3    :   std_logic_vector(0 to 31);

begin

    w0 <= input_key(0 to 31);
    w1 <= input_key(32 to 63);
    w2 <= input_key(64 to 95);
    w3 <= input_key(96 to 127);

    g_function  :   g port map(w3, RC, g_out);
    xor_1 <= g_out xor w0;
    xor_2 <= xor_1 xor w1;
    xor_3 <= xor_2 xor w2;
    output_key(96 to 127) <= xor_3 xor w3;
    output_key(64 to 95) <= xor_3;
    output_key(32 to 63) <= xor_2;
    output_key(0 to 31) <= xor_1;

end behavior;
