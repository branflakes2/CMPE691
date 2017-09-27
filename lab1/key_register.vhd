library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity key_register is

port (
    clock       :   in std_logic;
    load        :   in std_logic;
    reset       :   in std_logic;
    key_in      :   in string(1 to 80);
    hold        :   in std_logic; --prevents counter from advancing
    char_out    :   out character);
end key_register;

architecture behavior of key_register is

signal key      :   string(1 to 80) := (others => character'val(0));
signal count    :   integer := 0;

begin
    process(clock, reset)
    begin
        if reset = '1' then
            count <= 0;
            key <= (others => character'val(0));
        elsif load = '1' and falling_edge(clock) then
            key <= key_in;
            count <= 0;
        elsif falling_edge(clock) and hold /= '1' then
            char_out <= key(count + 1);
            count <= count + 1;
        elsif rising_edge(clock) and key(count + 1) = character'val(0) then
            count <= 0;
        end if;
    end process;
end behavior;
