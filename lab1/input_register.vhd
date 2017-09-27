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
    done        :   out std_logic; --goes high when end of message is reached
    char_out    :   out character);
end input_register;

architecture behavior of input_register is

signal input    :   string(1 to 80) := (others => character'val(0));
signal count    :   integer := 1;

begin
    process(clock, reset)
    begin 
        report character'image(input(count + 1));
        if reset = '1' then
            count <= 0;
            input <= (others => character'val(0));
        elsif load = '1' and falling_edge(clock) then
            input <= in_input;
            count <= 0;
        elsif falling_edge(clock) and hold /= '1' then
            if input(count + 1) /= ' ' then
                char_out <= input(count + 1);
                count <= count + 1;
            else    
                char_out <= input(count + 2);
                count <= count + 2;
            end if;
        elsif rising_edge(clock) and input(count + 2) = character'val(0) and hold /= '1' then
            report "DONE!";
            done <= '1';
            report std_logic'image(done);
        else
            done <= '0';
        end if;
    end process;
end behavior;
