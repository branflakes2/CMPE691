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

    signal par  :   std_logic := '0';

begin

    output <= input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6) xor input(7);

end Behavioral;
    
    
