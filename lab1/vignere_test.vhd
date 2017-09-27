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
        load_mes    :   in  std_logic:
        reset       :   in  std_logic;
        e_or_d      :   in  std_logic;
        str_input   :   in  string(1 to 80);
        done        :   out std_logic := '0';
        char_out    :   out character);
end vigenere_cipher;

signal s_clock, s_load_key, s_load_mes, s_reset, s_e_or_d, s_done   :   std_logic;
signal s_str_input                                                  :   string(1 to 80);
signal s_char_out                                                   :   character;
signal hold                                                         :   std_logic;

begin

    clk     :   process
    
        s_clock <= '1' after 5 ns;
        s_clock <= '0' after 5 ns;

    end process;

    test_p  :   process

        file infile     :   text is in "input.txt";
        file outfile    :   text is out "out.txt";
        variable space  :   character;   
        variable buf    :   line;

    begin

        readline(infile, buf);
        read(e_or_d, buf);
        read(buf, space);
        read(buf, str_input);
        
        load_key <= '1';
        load_mes <= '0';
        wait until falling_edge(clock);  

        readline(infile, buf);
        read(buf, str_input);     
  

