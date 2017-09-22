library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity key_register is

port (
    clock       :   in std_logic;
    load        :   in std_logic;
    reset       :   in std_logic;
    key_in      :   in string(1 to 80);
    char_out    :   out character);
end key_register;

architecture behavior of key_register is

signal count    :   integer register := 0;
signal key      :   string(1 to 80) register := null;

begin
    process(clock, load, reset, key_in)
    begin
        if rising_edge(reset) then
            count <= 0;
            key <= null;
        elsif load and falling_edge(clock) then
            key <= key_in;
        elsif falling_edge(clock) then
            char_out <= key(count);
            count <= count + 1;
            if key(count) = "\0" then
                count <= 0;
            end if;
        end if;
    end process;
end behavior;
