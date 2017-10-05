library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mix_column is

port(
    input   :   in  std_logic_vector(127 downto 0);
    output  :   out std_logic_vector(127 downto 0)
);

end mix_column;

architecture behavior of mix_column is

component galois

port(
    col_in  :   in  std_logic_vector(31 downto 0);
    col_out :   out std_logic_vector(31 downto 0)
);

end component;

    alias col1  :   std_logic_vector(31 downto 0) is input(31 downto 0);
    alias col2  :   std_logic_vector(31 downto 0) is input(63 downto 32);
    alias col3  :   std_logic_vector(31 downto 0) is input(95 downto 64);
    alias col4  :   std_logic_vector(31 downto 0) is input(127 downto 96);

    alias ocol1  :   std_logic_vector(31 downto 0) is output(31 downto 0);
    alias ocol2  :   std_logic_vector(31 downto 0) is output(63 downto 32);
    alias ocol3  :   std_logic_vector(31 downto 0) is output(95 downto 64);
    alias ocol4  :   std_logic_vector(31 downto 0) is output(127 downto 96);

begin

    mix1    :   galois port map(col1, ocol1);
    mix2    :   galois port map(col2, ocol2);
    mix3    :   galois port map(col3, ocol3);
    mix4    :   galois port map(col4, ocol4);

end behavior;
