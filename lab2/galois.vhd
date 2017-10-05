library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity galois is
    port(
        col_in  :   in  std_logic_vector(31 downto 0);
        col_out :   out std_logic_vector(31 downto 0)
    );
end galois;

architecture behavior of galois is

    signal z0   :   std_logic_vector(8 downto 0);
    signal z1   :   std_logic_vector(8 downto 0);
    signal z2   :   std_logic_vector(8 downto 0);
    signal z3   :   std_logic_vector(8 downto 0);    
    signal u0   :   std_logic_vector(7 downto 0);
    signal u1   :   std_logic_vector(7 downto 0);
    signal u2   :   std_logic_vector(7 downto 0);
    signal u3   :   std_logic_vector(7 downto 0);

begin

    z0 <= '0' & col_in(7 downto 0);
    z1 <= '0' & col_in(15 downto 8);
    z2 <= '0' & col_in(23 downto 16);
    z3 <= '0' & col_in(31 downto 24);
    
    mix :   process

        variable t0, t1, t2, t3 :   std_logic_vector(8 downto 0);    

    begin
        --02 03 01 01
        wait for 1 fs;
        t0 := std_logic_vector(shift_left(unsigned(z0), 1));
        if t0(8) = '1' then
            t0 := t0 xor ('1' & x"1B");
        end if;
        t1 := std_logic_vector(shift_left(unsigned(z1), 1) xor unsigned(z1));
        if t1(8) = '1' then
            t1 := t1 xor ('1' & x"1B");
        end if;
        t2 := z2;
        t3 := z3;
        u0 <= (t0(7 downto 0) xor t1(7 downto 0) xor t2(7 downto 0) xor t3(7 downto 0));
        --01 02 03 01
        t1 := std_logic_vector(shift_left(unsigned(z1), 1));
        if t1(8) = '1' then
            t1 := t1 xor ('1' & x"1B");
        end if;
        t2 := std_logic_vector(shift_left(unsigned(z2), 1) xor unsigned(z2));
        if t2(8) = '1' then
            t2 := t2 xor ('1' & x"1B");
        end if;
        t0 := z0;
        t3 := z3;
        u1 <= (t0(7 downto 0) xor t1(7 downto 0) xor t2(7 downto 0) xor t3(7 downto 0));
        
        --01 01 02 03
        t2 := std_logic_vector(shift_left(unsigned(z2), 1));
        if t2(8) = '1' then
            t2 := t2 xor ('1' & x"1B");
        end if;
        t3 := std_logic_vector(shift_left(unsigned(z3), 1) xor unsigned(z3));
        if t3(8) = '1' then
            t3 := t3 xor ('1' & x"1B");
        end if;
        t0 := z0;
        t1 := z1;
        u2 <= (t0(7 downto 0) xor t1(7 downto 0) xor t2(7 downto 0) xor t3(7 downto 0));

        --03 01 01 02
        t3 := std_logic_vector(shift_left(unsigned(z3), 1));
        if t3(8) = '1' then
            t3 := t3 xor ('1' & x"1B");
        end if;
        t0 := std_logic_vector(shift_left(unsigned(z0), 1) xor unsigned(z0));
        if t0(8) = '1' then
            t0 := t0 xor ('1' & x"1B");
        end if;
        t2 := z2;
        t1 := z1;
        u3 <= (t0(7 downto 0) xor t1(7 downto 0) xor t2(7 downto 0) xor t3(7 downto 0));
        
        wait for 1 fs;
        col_out(7 downto 0) <= u0;
        col_out(15 downto 8) <= u1;
        col_out(23 downto 16) <= u2;
        col_out(31 downto 24) <= u3;
        wait;
    end process;
end behavior;
