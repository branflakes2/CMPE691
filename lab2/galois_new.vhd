library STD;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity galois is
    port(
        col_in  :   in  std_logic_vector(0 to 31);
        col_out :   out std_logic_vector(0 to 31)
    );
end galois;

architecture behavior of galois is

    signal z0   :   std_logic_vector(0 to 8);
    signal z1   :   std_logic_vector(0 to 8);
    signal z2   :   std_logic_vector(0 to 8);
    signal z3   :   std_logic_vector(0 to 8);    
    signal u0   :   std_logic_vector(0 to 7);
    signal u1   :   std_logic_vector(0 to 7);
    signal u2   :   std_logic_vector(0 to 7);
    signal u3   :   std_logic_vector(0 to 7);

begin

    z0 <= '0' & col_in(0 to 7);
    z1 <= '0' & col_in(8 to 15);
    z2 <= '0' & col_in(16 to 23);
    z3 <= '0' & col_in(24 to 31);
    
    mix :   process

        variable t0, t1, t2, t3 :   std_logic_vector(0 to 8);    

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
        u0 <= (t0(0 to 7) xor t1(0 to 7) xor t2(0 to 7) xor t3(0 to 7));
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
        u1 <= (t0(0 to 7) xor t1(0 to 7) xor t2(0 to 7) xor t3(0 to 7));
        
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
        u2 <= (t0(0 to 7) xor t1(0 to 7) xor t2(0 to 7) xor t3(0 to 7));

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
        u3 <= (t0(0 to 7) xor t1(0 to 7) xor t2(0 to 7) xor t3(0 to 7));
        
        wait for 1 fs;
        col_out(0 to 7) <= u0;
        col_out(8 to 15) <= u1;
        col_out(16 to 23) <= u2;
        col_out(24 to 31) <= u3;
        wait;
    end process;
end behavior;
