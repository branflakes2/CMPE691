library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity sboxes is

port(
    input   :   in  std_logic_vector(0 to 127);
    output  :   out std_logic_vector(0 to 127)
);
end sboxes;

architecture behavior of sboxes is

component sbox
port(
    input   :   in  std_logic_vector(0 to 7);
    output  :   out std_logic_vector(0 to 7)
);
end component;

begin
    gen_sbox    :   for I in 1 to 16 generate
        s   :   sbox port map(input(8 * I - 8 to 8 * I - 1), output(8 * I - 8 to 8 * I - 1));
    end generate;
end behavior;
