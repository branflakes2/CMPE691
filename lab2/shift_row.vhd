library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_row is

port(
    input   :   in  std_logic_vector(0 to 127);
    output  :   out std_logic_vector(0 to 127)
);
end shift_row;

architecture behavior of shift_row is 

    
    alias a00   :   std_logic_vector(0 to 7) is input(0 to 7);
    alias a10   :   std_logic_vector(0 to 7) is input(8 to 15);
    alias a20   :   std_logic_vector(0 to 7) is input(16 to 23);
    alias a30   :   std_logic_vector(0 to 7) is input(24 to 31);
    alias a01   :   std_logic_vector(0 to 7) is input(32 to 39);
    alias a11   :   std_logic_vector(0 to 7) is input(40 to 47);
    alias a21   :   std_logic_vector(0 to 7) is input(48 to 55);
    alias a31   :   std_logic_vector(0 to 7) is input(56 to 63);
    alias a02   :   std_logic_vector(0 to 7) is input(64 to 71);
    alias a12   :   std_logic_vector(0 to 7) is input(72 to 79);
    alias a22   :   std_logic_vector(0 to 7) is input(80 to 87);
    alias a32   :   std_logic_vector(0 to 7) is input(88 to 95);
    alias a03   :   std_logic_vector(0 to 7) is input(96 to 103);
    alias a13   :   std_logic_vector(0 to 7) is input(104 to 111);
    alias a23   :   std_logic_vector(0 to 7) is input(112 to 119);
    alias a33   :   std_logic_vector(0 to 7) is input(120 to 127);

    alias o00   :   std_logic_vector(0 to 7) is output(0 to 7);
    alias o10   :   std_logic_vector(0 to 7) is output(8 to 15);
    alias o20   :   std_logic_vector(0 to 7) is output(16 to 23);
    alias o30   :   std_logic_vector(0 to 7) is output(24 to 31);
    alias o01   :   std_logic_vector(0 to 7) is output(32 to 39);
    alias o11   :   std_logic_vector(0 to 7) is output(40 to 47);
    alias o21   :   std_logic_vector(0 to 7) is output(48 to 55);
    alias o31   :   std_logic_vector(0 to 7) is output(56 to 63);
    alias o02   :   std_logic_vector(0 to 7) is output(64 to 71);
    alias o12   :   std_logic_vector(0 to 7) is output(72 to 79);
    alias o22   :   std_logic_vector(0 to 7) is output(80 to 87);
    alias o32   :   std_logic_vector(0 to 7) is output(88 to 95);
    alias o03   :   std_logic_vector(0 to 7) is output(96 to 103);
    alias o13   :   std_logic_vector(0 to 7) is output(104 to 111);
    alias o23   :   std_logic_vector(0 to 7) is output(112 to 119);
    alias o33   :   std_logic_vector(0 to 7) is output(120 to 127);

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
