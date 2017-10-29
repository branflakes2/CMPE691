library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity vigenere_cipher is

port (
    clock       :   in std_logic;
    load_key    :   in std_logic;
    load_mes    :   in std_logic;
    reset       :   in std_logic;
    e_or_d      :   in std_logic;
    str_input   :   in string(1 to 80);
    done        :   out std_logic; --turns high when message en/decoding is done
    char_out    :   out character); --encoded/decoded character
end vigenere_cipher;

architecture behavior of vigenere_cipher is

signal key_reg_in   :   string(1 to 80);
signal mes_reg_in   :   string(1 to 80);
signal key_out      :   character;
signal mes_out      :   character;
signal hold         :   std_logic;

component vigenere_encoder
port (
    ptxt    :   in character;
    kchar   :   in character;
    e_or_d  :   in std_logic;
    ctxt    :   out character);
end component;

component key_register
port (
    clock       :   in std_logic;
    load        :   in std_logic;
    reset       :   in std_logic;
    key_in      :   in string(1 to 80);
    hold        :   in std_logic;
    char_out    :   out character);
end component;

component input_register
port(
    clock       :   in std_logic;
    load        :   in std_logic;
    reset       :   in std_logic;
    in_input    :   in string(1 to 80);
    hold        :   in std_logic;
    done        :   out std_logic; --goes high when end of message is reached
    char_out    :   out character);
end component;

begin

    hold <= load_mes or load_key; 

    key :   key_register port map(clock, load_key, reset, key_reg_in, hold, key_out);
    mes :   input_register port map(clock, load_mes, reset, mes_reg_in, hold, done, mes_out);
    enc :   vigenere_encoder port map(mes_out, key_out, e_or_d, char_out);

    in_decide   :   process(load_key, load_mes)
    begin
        if load_key = '1' and load_mes = '0' then --having both '1' is undefined behavior
            key_reg_in <= str_input;
        elsif load_key = '0' and load_mes = '1' then
            mes_reg_in <= str_input;
        end if;
    end process;  

end behavior;
