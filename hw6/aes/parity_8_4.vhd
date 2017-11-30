library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity parity_8_4 is
    port(
        row_in  :   in  Word;
        p_out   :   out std_logic_vector(0 to 3)
    );
end parity_8_4;

architecture Behavioral of parity_8_4 is

component parity_8 
    port(
        input   :   in  std_logic_vector(7 downto 0);
        output  :   out std_logic
    );
end component;

begin
    
    g   :   for i in 0 to 3 generate
        row_x   :   parity_8 port map(row_in(i), p_out(i));
    end generate g;

end Behavioral;
