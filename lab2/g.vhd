library IEEE;
library STD;
use IEEE.std_logic_1164.all;

entity g is
port(
    w_in    :   in  std_logic_vector(31 downto 0);
    RC      :   in  std_logic_vector(7 downto 0);
    w_out   :   out std_logic_vector(31 downto 0)
);
end g;

architecture behavior of g is

    component sbox
    port(
        input   :   in  std_logic_vector(7 downto 0);
        output  :   out  std_logic_vector(7 downto 0)
    );
    end component;

    signal v0   :   std_logic_vector(7 downto 0);
    signal v1   :   std_logic_vector(7 downto 0);
    signal v2   :   std_logic_vector(7 downto 0);
    signal v3   :   std_logic_vector(7 downto 0);

    signal si0  :   std_logic_vector(7 downto 0);
    signal si1  :   std_logic_vector(7 downto 0);
    signal si2  :   std_logic_vector(7 downto 0);
    signal si3  :   std_logic_vector(7 downto 0);

    signal o0   :   std_logic_vector(7 downto 0);
    signal o1   :   std_logic_vector(7 downto 0);
    signal o2   :   std_logic_vector(7 downto 0);
    signal o3   :   std_logic_vector(7 downto 0);

begin
    
    si0 <= w_in(15 downto 8);
    si1 <= w_in(23 downto 16);
    si2 <= w_in(31 downto 24);
    si3 <= w_in(7 downto 0);

    s1  :   sbox port map(si0, o0);
    s2  :   sbox port map(si1, o1);
    s3  :   sbox port map(si2, o2);
    s4  :   sbox port map(si3, o3);

    w_out(7 downto 0) <= RC xor o0;
    w_out(15 downto 8) <= o1;
    w_out(23 downto 16) <= o2;
    w_out(31 downto 24) <= o3;

end behavior;
