library IEEE;
library STD;
use STD.textio.all;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_textio.all;
use work.std_logic_textio.all;
entity aes_test is

end aes_test;

architecture test of aes_test is

component round9_10
port(
    input       :   in  std_logic_vector(127 downto 0);
    round9_key  :   in  std_logic_vector(127 downto 0);
    output      :   out std_logic_vector(127 downto 0)
);
end component;

signal s_input, s_round9_key, s_output  :   std_logic_vector(127 downto 0);

begin

    bench   :   round9_10   port map(s_input, s_round9_key, s_output);

    t   :   process
    
        file infile             :   text is in "in.txt";
        file outfile            :   text is out "out.txt";
        variable buf            :   line;
        variable v_input, v_round9_key, v_output       :   std_logic_vector(127 downto 0);

    begin

        readline(infile, buf);
        hread(buf, v_input);
        readline(infile, buf);
        hread(buf, v_round9_key);
        
        s_input <= v_input;
        s_round9_key <= v_round9_key;
        
        wait for 3 ns;
    
        v_output := s_output;
        hwrite(buf, v_output);
        writeline(outfile, buf);
        wait;
    end process;
end test;
