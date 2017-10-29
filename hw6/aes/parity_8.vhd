library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity parity_8 is
    port(
        input   :   in  std_logic_vector(7 downto 0);
        output  :   out std_logic
    );
end parity_8;

architecture Behavioral of parity_8 is

begin

    p   :   process
        variable    p   :   std_logic := '0';
    begin
        for i in 7 downto 0 loop:
            p := p xor input(i);
        end loop;
        output <= p;        
    end process;

end Behavioral;
    
    
