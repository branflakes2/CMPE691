library IEEE;
use IEEE.std_logic_1164.all;
use work.std_logic_signed.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity sbox_check is
    port(
        data_reg, sbox_out_eff_sig  :   in  Matrix := (("00000000", "00000000", "00000000", "00000000"),("00000000", "00000000", "00000000", "00000000"),("00000000", "00000000", "00000000", "00000000"),("00000000", "00000000", "00000000", "00000000"));
        clock                       :   in  std_logic;
        err_detect                  :   out std_logic := '0'
    );
end sbox_check;

architecture Behavioral of sbox_check is

    component parity_8_4
        port(
            row_in  :   in  Word;
            p_out   :   out std_logic_vector(0 to 3)
        );
    end component;

    type pmat is array (0 to 3) of std_logic_vector(0 to 3);
    signal out_correct          :   pmat := ("0000", "0000", "0000", "0000");
    signal out_actual           :   pmat := ("0000", "0000", "0000", "0000"); 
    signal p_data_reg           :   pmat;
    signal p_sbox_out_eff_sig   :   pmat;
    signal delay_clk            :   std_logic;
    --parity sum of each input and output given an input. index is the value of the input
    constant s_parity           :   std_logic_vector(0 to 255) := "0010010111111101100101101100110111000100110110101000100100110111111000101001011101100000110110001011000000100111001010001000000100100010101101100101110100010000101000010100111111100010010111101100000110000111011101111101010011110011111100001001010010011011";
    
begin

    

    gen :   for i in 0 to 3 generate
        p_in    :   parity_8_4 port map(data_reg(i), p_data_reg(i));
        p_out   :   parity_8_4 port map(sbox_out_eff_sig(i), p_sbox_out_eff_sig(i));
    end generate;

    dclk    :   process(clock)
    begin
        delay_clk <= clock after 1 ns;
    end process;

    correct     :   process(delay_clk)
        variable temp   :   pmat;
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                temp(i)(j)   :=  s_parity(to_integer(unsigned(data_reg(i)(j))));
            end loop;
        end loop;
        out_correct <= temp;
    end process;

    actual      :   process(delay_clk)
        variable temp   :   pmat;
    begin
        for i in 0 to 3 loop
            temp(i)   :=  p_sbox_out_eff_sig(i) xor p_data_reg(i);
        end loop;
        out_actual <= temp;
    end process;


    err_check   :   process(delay_clk)
        variable    asdf    :   std_logic_vector(0 to 3);
    begin
        for i in 0 to 3 loop
            asdf := out_actual(i) xor out_correct(i);
            report integer'image(to_integer(unsigned(asdf))) & " " & integer'image(to_integer(unsigned(out_actual(i)))) & " " & integer'image(to_integer(unsigned(out_correct(i))));
            if asdf > x"0" and out_actual(i) >= x"0" then
                err_detect  <=  '1';
            end if;
        end loop;
    end process;

end Behavioral;
