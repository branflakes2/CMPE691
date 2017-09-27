library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity input_register is

port(
    clock       :   in std_logic;
    load        :   in std_logic;
    reset       :   in std_logic;
    in_input    :   in string(1 to 80);
    hold        :   in std_logic;
    done        :   out std_logic := '0'; --goes high when end of message is reached
    char_out    :   out character);
end input_register;

architecture behavior of input_register is

signal input    :   string(1 to 80) := (others => character'val(0));
signal count    :   integer := 0;

begin
    process(clock, reset)
    begin 
        if reset = '1' then
            count <= 0;
            input <= (others => character'val(0));
        elsif load = '1' and falling_edge(clock) then
            input <= in_input;
            count <= 0;
        elsif falling_edge(clock) and hold /= '1' then
            char_out <= input(count + 1);
            count <= count + 1;
        elsif rising_edge(clock) and input(count + 1) = character'val(0) then
            done <= '1';
        end if;
    end process;
end behavior;
