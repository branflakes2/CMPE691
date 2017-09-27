library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity vigenere_test is

end vigenere_test;

architecture test of vigenere_test is

component vigenere_cipher
    port(
        clock       :   in  std_logic;
        load_key    :   in  std_logic;
        load_mes    :   in  std_logic;
        reset       :   in  std_logic;
        e_or_d      :   in  std_logic;
        str_input   :   in  string(1 to 80);
        done        :   out std_logic;
        char_out    :   out character);
end component;

signal s_clock, s_load_key, s_load_mes, s_reset, s_e_or_d, s_done   :   std_logic;
signal s_str_input                                                  :   string(1 to 80);
signal s_char_out                                                   :   character;
shared variable ENDSIM                                              :   boolean := false;

begin

    bench   :   vigenere_cipher port map(s_clock, s_load_key, s_load_mes, s_reset, s_e_or_d, s_str_input, s_done, s_char_out);

    clk     :   process
    begin
        if ENDSIM = false then 

            s_clock <= '1';
            wait for 5 ns;
            s_clock <= '0';
            wait for 5 ns;
        else
            wait;
        end if;
    end process;

    test_p  :   process

        file infile         :   text is in "in.txt";
        file outfile        :   text is out "out.txt";
        variable space      :   character;   
        variable buflen     :   integer;
        variable buf        :   line;
        variable o_buf      :   line;
        variable v_e_or_d   :   std_logic;
        variable v_str_in   :   string(1 to 80);

    begin
        readline(infile, buf);
        buflen := buf'Length;
        read(buf, v_e_or_d);
        read(buf, space);
        read(buf, v_str_in(1 to buflen - 2));
        v_str_in(buflen-1 to 80) := (others => character'val(0));
        s_e_or_d <= v_e_or_d;
        s_str_input <= v_str_in;
 
        s_load_key <= '1';
        s_load_mes <= '0';
        wait until falling_edge(s_clock);  
        wait for 1 fs;        

        readline(infile, buf);
        buflen := buf'Length;
        read(buf, v_str_in(1 to buflen));     
        v_str_in(buflen + 1 to 80) := (others => character'val(0));
        s_str_input <= v_str_in;

        s_load_key <= '0';
        s_load_mes <= '1';
        wait until falling_edge(s_clock);
        wait for 1 fs;
        s_load_mes <= '0';
        while s_done /= '1' loop
            wait until falling_edge(s_clock);
            wait for 1 ns;
            write(o_buf, s_char_out); 
        end loop;
        writeline(outfile, o_buf);
        ENDSIM := true;
        wait;
    end process;
end test;
