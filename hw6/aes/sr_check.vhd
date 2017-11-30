library IEEE;
use IEEE.std_logic_1164.all;
use work.numeric_std.all;
use work.std_logic_unsigned.all;
use work.aes128Pkg.all;

entity sr_check is
    port(
        input       :   in  Matrix;
        output      :   in  Matrix;
        clock       :   in  std_logic;
        err_detect  :   out std_logic := '0'
    );
end sr_check;

architecture Behavioral of sr_check is

    type row is array (0 to 3) of std_logic_vector(0 to 31);

    signal irows    :   row;
    signal orows    :   row;
    signal f        :   std_logic_vector(0 to 3);
    signal dclk     :   std_logic;

    component parity_check
        port(
            input       :   in  std_logic_vector(0 to 31);
            output      :   in  std_logic_vector(0 to 31);
            err_detect  :   out std_logic := '0'
        );
    end component;

begin

    
    irows(0)  <= input(0)(0) & input(0)(1) & input(0)(2) & input(0)(3);
    irows(1)  <= input(1)(0) & input(1)(1) & input(1)(2) & input(1)(3);
    irows(2)  <= input(2)(0) & input(2)(1) & input(2)(2) & input(2)(3);
    irows(3)  <= input(3)(0) & input(3)(1) & input(3)(2) & input(3)(3);
    orows(0)  <= output(0)(0) & output(0)(1) & output(0)(2) & output(0)(3);
    orows(1)  <= output(1)(0) & output(1)(1) & output(1)(2) & output(1)(3);
    orows(2)  <= output(2)(0) & output(2)(1) & output(2)(2) & output(2)(3);
    orows(3)  <= output(3)(0) & output(3)(1) & output(3)(2) & output(3)(3);

    g : for i in 0 to 3 generate
        rcx :   parity_check port map(irows(i), orows(i), f(i));
    end generate g;

    clk : process(clock)
    begin
        dclk <= clock after 1 ns;
    end process;

    p : process(dclk)
    begin
        for i in 0 to 3 loop
            if f(i) = '1' then
                err_detect <= '1';
            end if;
        end loop;
    end process;
    
end Behavioral;
