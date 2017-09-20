library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vigenere_encoder is

port (
    ptxt    :   in integer;  -- plaintext character input
    kchar   :   in integer;  -- key character input
    e_or_d  :   in std_logic;  -- encrypting or decrypting. 1 for encrypt, 0 for decrypt
    ctxt    :   out integer); -- cypher text character output
end vigenere_encoder;

architecture behavior of vigenere_encoder is

begin
    process(ptxt, kchar, e_or_d)
    begin
        if (ptxt < 97) then 
            if (kchar < 97) then 
                if (e_or_d = '1') then
                    ctxt <= (((ptxt - 65) + (kchar - 65)) mod 26) + 97;
                else
                    ctxt <= (((ptxt - 65) - (kchar - 65)) mod 26) + 97;
                end if;
            else
                if (e_or_d = '1') then
                    ctxt <= (((ptxt - 65) + (kchar - 97)) mod 26) + 97;
                else
                    ctxt <= (((ptxt - 65) - (kchar - 97)) mod 26) + 97;
                end if;
            end if;
        else
            if (kchar < 97) then
                if (e_or_d = '1') then
                    ctxt <= (((ptxt - 97) + (kchar - 65)) mod 26) + 97;
                else
                    ctxt <= (((ptxt - 97) - (kchar - 65)) mod 26) + 97;
                end if;
            else
                if (e_or_d = '1') then
                    ctxt <= (((ptxt - 97) + (kchar - 97)) mod 26) + 97;
                else
                    ctxt <= (((ptxt - 97) - (kchar - 97)) mod 26) + 97;
                end if;
            end if;
        end if;
    end process;
end behavior;
