library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity sbox_check is
    port(
        data_reg, sbox_out_eff_sig  :   in  Matrix;
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
    signal out_correct          :   pmat;
    signal out_actual           :   pmat;
    signal p_data_reg           :   pmat;
    signal p_sbox_out_eff_sig   :   pmat;
    --parity sum of each input and output given an input. index is the value of the input
    constant s_parity           :   std_logic_vector(255 downto 0) := "0010010111111101100101101100110111000100110110101000100100110111111000101001011101100000110110001011000000100111001010001000000100100010101101100101110100010000101000010100111111100010010111101100000110000111011101111101010011110011111100001001010010011011";
    
begin

    gen :   for i in 0 to 3 generate
        p_in    :   parity_8_4 port map(data_reg(i), p_data_reg(i));
        p_out   :   parity_8_4 port map(sbox_out_eff_sig(i), p_sbox_out_eff_sig(i));
    end generate;

    correct     :   process(data_reg)
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                out_correct(i)(j)   <=  s_parity(to_integer(unsigned(data_reg(i)(j))));
            end loop;
        end loop;
    end process;

    actual      :   process(p_sbox_out_eff_sig, p_data_reg)
    begin
        for i in 0 to 3 loop
            out_actual(i)   <=  p_sbox_out_eff_sig(i) xor p_data_reg(i);
        end loop;
    end process;

    err_check   :   process(out_actual, out_correct)
    begin
        for i in 0 to 3 loop
            if out_actual(i) /= out_correct(i) then
                err_detect  <=  '1';
            end if;
        end loop;
    end process;

end Behavioral;
