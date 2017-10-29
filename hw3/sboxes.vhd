library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity sboxes is

port(
    input   :   in  std_logic_vector(127 downto 0);
    output  :   out std_logic_vector(127 downto 0)
);
end sboxes;

architecture behavior of sboxes is

component sbox
port(
    input   :   in  std_logic_vector(7 downto 0);
    output  :   out std_logic_vector(7 downto 0)
);
end component;

begin
    gen_sbox    :   for I in 1 to 16 generate
        s   :   sbox port map(input(8 * I - 1 downto 8 * I - 8), output(8 * I - 1 downto 8 * I - 8));
    end generate;
end behavior;
