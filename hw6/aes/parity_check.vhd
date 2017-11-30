library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity parity_check is
    port(
        input       :   in  std_logic_vector(0 to 31);
        output      :   in  std_logic_vector(0 to 31);
        err_detect  :   out std_logic := '0'
    );
end parity_check;

architecture Behavioral of parity_check is

    signal p1, p2   :   std_logic := '0';

begin

    p1 <= input(0) xor input(1) xor input(2) xor input(3) xor input(4) xor input(5) xor input(6) xor input(7) xor input(8) xor input(9) xor input(10) xor input(11) xor input(12) xor input(13) xor input(14) xor input(15) xor input(16) xor input(17) xor input(18) xor input(19) xor input(20) xor input(21) xor input(22) xor input(23) xor input(24) xor input(25) xor input(26) xor input(27) xor input(28) xor input(29) xor input(30) xor input(31); 

    p2 <= output(0) xor output(1) xor output(2) xor output(3) xor output(4) xor output(5) xor output(6) xor output(7) xor output(8) xor output(9) xor output(10) xor output(11) xor output(12) xor output(13) xor output(14) xor output(15) xor output(16) xor output(17) xor output(18) xor output(19) xor output(20) xor output(21) xor output(22) xor output(23) xor output(24) xor output(25) xor output(26) xor output(27) xor output(28) xor output(29) xor output(30) xor output(31); 

    pch :   process(p1, p2)
    begin
        if p1 = p2 then
            err_detect <= '0';
        else
            err_detect <= '1';
        end if; 
    end process;

end Behavioral;
