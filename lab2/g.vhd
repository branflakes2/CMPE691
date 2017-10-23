library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity g is
port(
    w_in    :   in  std_logic_vector(0 to 31);
    RC      :   in  std_logic_vector(0 to 7);
    w_out   :   out std_logic_vector(0 to 31)
);
end g;

architecture behavior of g is

    component sbox
    port(
        input   :   in  std_logic_vector(0 to 7);
        output  :   out  std_logic_vector(0 to 7)
    );
    end component;

    signal v0   :   std_logic_vector(0 to 7);
    signal v1   :   std_logic_vector(0 to 7);
    signal v2   :   std_logic_vector(0 to 7);
    signal v3   :   std_logic_vector(0 to 7);

    signal si0  :   std_logic_vector(0 to 7);
    signal si1  :   std_logic_vector(0 to 7);
    signal si2  :   std_logic_vector(0 to 7);
    signal si3  :   std_logic_vector(0 to 7);

    signal o0   :   std_logic_vector(0 to 7);
    signal o1   :   std_logic_vector(0 to 7);
    signal o2   :   std_logic_vector(0 to 7);
    signal o3   :   std_logic_vector(0 to 7);

begin
    
    si0 <= w_in(8 to 15);
    si1 <= w_in(16 to 23);
    si2 <= w_in(24 to 31);
    si3 <= w_in(0 to 7);

    s1  :   sbox port map(si0, o0);
    s2  :   sbox port map(si1, o1);
    s3  :   sbox port map(si2, o2);
    s4  :   sbox port map(si3, o3);

    w_out(0 to 7) <= RC xor o0;
    w_out(8 to 15) <= o1;
    w_out(16 to 23) <= o2;
    w_out(24 to 31) <= o3;

end behavior;
