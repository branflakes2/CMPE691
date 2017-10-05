library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_row is

port(
    input   :   in  std_logic_vector(127 downto 0);
    output  :   out std_logic_vector(127 downto 0)
);
end shift_row;

architecture behavior of shift_row is 

    
    alias a00   :   std_logic_vector(7 downto 0) is input(7 downto 0);
    alias a10   :   std_logic_vector(7 downto 0) is input(15 downto 8);
    alias a20   :   std_logic_vector(7 downto 0) is input(23 downto 16);
    alias a30   :   std_logic_vector(7 downto 0) is input(31 downto 24);
    alias a01   :   std_logic_vector(7 downto 0) is input(39 downto 32);
    alias a11   :   std_logic_vector(7 downto 0) is input(47 downto 40);
    alias a21   :   std_logic_vector(7 downto 0) is input(55 downto 48);
    alias a31   :   std_logic_vector(7 downto 0) is input(63 downto 56);
    alias a02   :   std_logic_vector(7 downto 0) is input(71 downto 64);
    alias a12   :   std_logic_vector(7 downto 0) is input(79 downto 72);
    alias a22   :   std_logic_vector(7 downto 0) is input(87 downto 80);
    alias a32   :   std_logic_vector(7 downto 0) is input(95 downto 88);
    alias a03   :   std_logic_vector(7 downto 0) is input(103 downto 96);
    alias a13   :   std_logic_vector(7 downto 0) is input(111 downto 104);
    alias a23   :   std_logic_vector(7 downto 0) is input(119 downto 112);
    alias a33   :   std_logic_vector(7 downto 0) is input(127 downto 120);

    alias o00   :   std_logic_vector(7 downto 0) is output(7 downto 0);
    alias o10   :   std_logic_vector(7 downto 0) is output(15 downto 8);
    alias o20   :   std_logic_vector(7 downto 0) is output(23 downto 16);
    alias o30   :   std_logic_vector(7 downto 0) is output(31 downto 24);
    alias o01   :   std_logic_vector(7 downto 0) is output(39 downto 32);
    alias o11   :   std_logic_vector(7 downto 0) is output(47 downto 40);
    alias o21   :   std_logic_vector(7 downto 0) is output(55 downto 48);
    alias o31   :   std_logic_vector(7 downto 0) is output(63 downto 56);
    alias o02   :   std_logic_vector(7 downto 0) is output(71 downto 64);
    alias o12   :   std_logic_vector(7 downto 0) is output(79 downto 72);
    alias o22   :   std_logic_vector(7 downto 0) is output(87 downto 80);
    alias o32   :   std_logic_vector(7 downto 0) is output(95 downto 88);
    alias o03   :   std_logic_vector(7 downto 0) is output(103 downto 96);
    alias o13   :   std_logic_vector(7 downto 0) is output(111 downto 104);
    alias o23   :   std_logic_vector(7 downto 0) is output(119 downto 112);
    alias o33   :   std_logic_vector(7 downto 0) is output(127 downto 120);

begin

    o00 <= a00;
    o01 <= a01;
    o02 <= a02;
    o03 <= a03;
    o10 <= a11;
    o11 <= a12;
    o12 <= a13;
    o13 <= a10;
    o20 <= a22;
    o21 <= a23;
    o22 <= a20;
    o23 <= a21;
    o30 <= a33;
    o31 <= a30;
    o32 <= a31;
    o33 <= a32;

end behavior;
