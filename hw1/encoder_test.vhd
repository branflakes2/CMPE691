library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;
use STD.textio.all;

entity encoder_test is

end encoder_test;

architecture test of encoder_test is

    component encoder
        port(
            ptxt    :   in character;
            kchar   :   in character;
            e_or_d  :   in std_logic;
            ctxt    :   out character);
    end component;

    for venc : encoder use entity work.vigenere_encoder(behavior);

    signal plain, cypher, key   : character;
    signal ed                   : std_logic;

begin

    venc : encoder port map (plain, key, ed, cypher);
    
    ioprocess : process
    
        file infile                 : text is in "input.txt";
        file outfile                : text is out "out.txt";
        variable ptxt, kchar, ctxt  : character;
        variable ed_var             : std_logic;
        variable buf1, buf2         : line;        

    begin

        readline(infile, buf1);
        readline(infile, buf2);    
        read(buf1, ptxt);
        read(buf2, kchar);
        ed <= '0';
        plain <= ptxt;
        key <= kchar;
        wait for 5 ns;
        ctxt := cypher;
        write(buf1, ctxt);
        writeline(outfile, buf1); 
        wait; 
    end process ioprocess;

end test;
        
            
