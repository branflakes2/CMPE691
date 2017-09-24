library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity key_test is

end key_test;

architecture test of key_test is
    component key_register is
        port(
            clock       :   in std_logic;
            load        :   in std_logic;
            reset       :   in std_logic;
            key_in      :   in string(1 to 80);
            key_len     :   in integer;
            char_out    :   out character);
    end component key_register;

    for kreg : key_register use entity work.key_register(behavior);

    signal clk, ld, rst     :   std_logic := '0';
    signal keyin            :   string (1 to 80);
    signal keylen           :   integer;
    signal oput             :   character;
    shared variable ENDSIM  :   boolean := false;

begin

    kreg : key_register port map (clk, ld, rst, keyin, keylen, oput);
    
    clk1 : process
    begin
        if ENDSIM = false then
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
        else
            wait;
        end if;
    end process clk1;
                

    io : process

        file infile                 :   text is in "input.txt";
        file outfile                :   text is out "out.txt";
        variable clock, load, reset :   std_logic;
        variable key_in             :   string(1 to 80);
        variable char_out           :   character;
        variable buf1, buf2         :   line;
        variable Llen               :   integer;

    begin
       
        readline(infile, buf1);
        --read(buf1, key_in);
        Llen := buf1'Length;
        key_in(1 to Llen) := buf1.all;
        key_in(Llen + 1 to 80) := (others => character'val(0));
        ld <= '1';
        keyin <= key_in;
        keylen <= Llen;
        wait until falling_edge(clk);
        wait for 1 ns;
        ld <= '0';
        for i in 1 to buf1'Length loop
            wait until falling_edge(clk);
            wait for 1 ns;
            char_out := oput;
            write(buf2, char_out);
            writeline(outfile, buf2);
        end loop;
        ENDSIM := true;
        wait;
    end process io;

end architecture test;
