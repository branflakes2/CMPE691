library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity key_schedule is

port(
    input_key   :   in  std_logic_vector(127 downto 0);
    RC          :   in  std_logic_vector(7 downto 0);
    output_key  :   out std_logic_vector(127 downto 0)
);

end key_schedule;

architecture behavior of key_schedule is

component g
port(
    w_in    :   in  std_logic_vector(31 downto 0);
    RC      :   in  std_logic_vector(7 downto 0);
    w_out   :   out std_logic_vector(31 downto 0)
);
end component;

signal w0       :   std_logic_vector(31 downto 0);
signal w1       :   std_logic_vector(31 downto 0);
signal w2       :   std_logic_vector(31 downto 0);
signal w3       :   std_logic_vector(31 downto 0);

signal g_out    :   std_logic_vector(31 downto 0);
signal xor_1    :   std_logic_vector(31 downto 0);
signal xor_2    :   std_logic_vector(31 downto 0);
signal xor_3    :   std_logic_vector(31 downto 0);

begin

    w0 <= input_key(31 downto 0);
    w1 <= input_key(63 downto 32);
    w2 <= input_key(95 downto 64);
    w3 <= input_key(127 downto 96);

    g_function  :   g port map(w3, RC, g_out);
    xor_1 <= g_out xor w0;
    xor_2 <= xor_1 xor w1;
    xor_3 <= xor_2 xor w2;
    output_key(127 downto 96) <= xor_3 xor w3;
    output_key(95 downto 64) <= xor_3;
    output_key(63 downto 32) <= xor_2;
    output_key(31 downto 0) <= xor_1;

end behavior;
