library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity vigenere_encoder is

port (
    ptxt    :   in character;    -- plaintext character input
    kchar   :   in character;    -- key character input
    e_or_d  :   in std_logic;  -- encrypting or decrypting. 1 for encrypt, 0 for decrypt
    ctxt    :   out character);  -- cypher text character output
end vigenere_encoder;

architecture behavior of vigenere_encoder is

begin
    process(ptxt, kchar, e_or_d)

    begin
        if (character'pos(ptxt) < 97) then 
            if (character'pos(kchar) < 97) then 
                if (e_or_d = '1') then
                    ctxt <= character'val((((character'pos(ptxt) - 65) + (character'pos(kchar) - 65)) mod 26) + 97);
                else
                    ctxt <= character'val((((character'pos(ptxt) - 65) - (character'pos(kchar) - 65)) mod 26) + 97);
                end if;
            else
                if (e_or_d = '1') then
                    ctxt <= character'val((((character'pos(ptxt) - 65) + (character'pos(kchar) - 97)) mod 26) + 97);
                else
                    ctxt <= character'val((((character'pos(ptxt) - 65) - (character'pos(kchar) - 97)) mod 26) + 97);
                end if;
            end if;
        else
            if (character'pos(kchar) < 97) then
                if (e_or_d = '1') then
                    ctxt <= character'val((((character'pos(ptxt) - 97) + (character'pos(kchar) - 65)) mod 26) + 97);
                else
                    ctxt <= character'val((((character'pos(ptxt) - 97) - (character'pos(kchar) - 65)) mod 26) + 97);
                end if;
            else
                if (e_or_d = '1') then
                    ctxt <= character'val((((character'pos(ptxt) - 97) + (character'pos(kchar) - 97)) mod 26) + 97);
                else
                    ctxt <= character'val((((character'pos(ptxt) - 97) - (character'pos(kchar) - 97)) mod 26) + 97);
                end if;
            end if;
        end if;
    end process;
end behavior;
