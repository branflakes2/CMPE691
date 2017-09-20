library STD;
library IEEE;
use IEEE.std_logic_1164.all;


entity vigenere_encoder is

port (
    ptxt    :   in integer;  -- plaintext character input
    kchar   :   in integer;  -- key character input
    e_or_d  :   in std_logic;  -- encrypting or decrypting. 1 for encrypt, 0 for decrypt
    ctxt    :   out integer); -- cypher text character output
end vigenere_encoder;

architecture behavior of vigenere_encoder is

signal ptxt_26   : integer;
signal key_26    : integer;

begin
    process(ptxt, kchar, e_or_d)
    begin
        if (ptxt < 97) then 
            ptxt_26 <= ptxt - 65;
        else
            ptxt_26 <= ptxt - 97; 
        end if;

        if (kchar < 97) then 
            key_26 <= kchar - 65;
        else
            key_26 <= kchar - 97;
        end if;
        
        if (e_or_d = '1') then
            ctxt <= (ptxt_26 + key_26) mod 26;
        else
            ctxt <= (ptxt_26 - key_26) mod 26;
        end if;
    end process;
end behavior;
