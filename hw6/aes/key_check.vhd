library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity key_check is
    port(
        input       :   in  Matrix;
        output      :   in  Matrix;
        key         :   in  Matrix;
        err_detect  :   out std_logic := '0'
    );
end key_check;

architecture Behavioral of key_check is

begin

    pch :   process(input, output, key)

        variable t_xor1 :   std_logic   :=  '0';    
        variable t_xor2 :   std_logic   :=  '0';
        variable t_xor3 :   std_logic   :=  '0';

    begin
    
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                for k in 0 to 7 loop
                    t_xor1 := t_xor1 xor input(i)(j)(k);
                    t_xor2 := t_xor2 xor output(i)(j)(k);
                    t_xor3 := t_xor3 xor key(i)(j)(k);
                end loop;
            end loop;
        end loop;    
        
        if t_xor2 = (t_xor1 xor t_xor3) then
            err_detect <= '0';
        else
            err_detect <= '1';
        end if; 
    end process;

end Behavioral;
