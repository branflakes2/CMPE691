library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mix_column is

port(
    input   :   in  std_logic_vector(0 to 127);
    output  :   out std_logic_vector(0 to 127)
);

end mix_column;

architecture behavior of mix_column is

component galois

port(
    col_in  :   in  std_logic_vector(31 downto 0);
    col_out :   out std_logic_vector(31 downto 0)
);

end component;

    alias col1  :   std_logic_vector(0 to 31) is input(0 to 31);
    alias col2  :   std_logic_vector(0 to 31) is input(32 to 63);
    alias col3  :   std_logic_vector(0 to 31) is input(64 to 95);
    alias col4  :   std_logic_vector(0 to 31) is input(96 to 127);

    alias ocol1  :   std_logic_vector(0 to 31) is output(0 to 31);
    alias ocol2  :   std_logic_vector(0 to 31) is output(32 to 63);
    alias ocol3  :   std_logic_vector(0 to 31) is output(64 to 95);
    alias ocol4  :   std_logic_vector(0 to 31) is output(96 to 127);

begin

    mix1    :   galois port map(col1, ocol1);
    mix2    :   galois port map(col2, ocol2);
    mix3    :   galois port map(col3, ocol3);
    mix4    :   galois port map(col4, ocol4);

end behavior;
