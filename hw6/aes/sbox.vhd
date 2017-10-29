library ieee;
use ieee.std_logic_1164.all;
use work.std_logic_textio.all;
use work.std_logic_signed.all;
use work.std_logic_unsigned.all;
use work.std_logic_arith.all;
use std.textio.all;
use work.aes128Pkg.all;

entity sbox is
  port (
    In_DI   : in    Byte;
    Out_DO  : out   Byte
  );
end entity sbox;

architecture Behavioral of sbox is

begin
	
	S: process(In_DI)
	begin
		case In_DI is
		
			when  X"00" => Out_DO<=X"63";
			when  X"01" => Out_DO<=X"7c";
			when  X"02" => Out_DO<=X"77";
			when  X"03" => Out_DO<=X"7b";
			when  X"04" => Out_DO<=X"f2";
			when  X"05" => Out_DO<=X"6b";
			when  X"06" => Out_DO<=X"6f";
			when  X"07" => Out_DO<=X"c5";
			when  X"08" => Out_DO<=X"30";
			when  X"09" => Out_DO<=X"01";
			when  X"0a" => Out_DO<=X"67";
			when  X"0b" => Out_DO<=X"2b";
			when  X"0c" => Out_DO<=X"fe";
			when  X"0d" => Out_DO<=X"d7";
			when  X"0e" => Out_DO<=X"ab";
			when  X"0f" => Out_DO<=X"76";
			
			when  X"10" => Out_DO<=X"ca";
			when  X"11" => Out_DO<=X"82";
			when  X"12" => Out_DO<=X"c9";
			when  X"13" => Out_DO<=X"7d";
			when  X"14" => Out_DO<=X"fa";
			when  X"15" => Out_DO<=X"59";
			when  X"16" => Out_DO<=X"47";
			when  X"17" => Out_DO<=X"f0";
			when  X"18" => Out_DO<=X"ad";
			when  X"19" => Out_DO<=X"d4";
			when  X"1a" => Out_DO<=X"a2";
			when  X"1b" => Out_DO<=X"af";
			when  X"1c" => Out_DO<=X"9c";
			when  X"1d" => Out_DO<=X"a4";
			when  X"1e" => Out_DO<=X"72";
			when  X"1f" => Out_DO<=X"c0";
			
			when  X"20" => Out_DO<=X"b7";
			when  X"21" => Out_DO<=X"fd";
			when  X"22" => Out_DO<=X"93";
			when  X"23" => Out_DO<=X"26";
			when  X"24" => Out_DO<=X"36";
			when  X"25" => Out_DO<=X"3f";
			when  X"26" => Out_DO<=X"f7";
			when  X"27" => Out_DO<=X"cc";
			when  X"28" => Out_DO<=X"34";
			when  X"29" => Out_DO<=X"a5";
			when  X"2a" => Out_DO<=X"e5";
			when  X"2b" => Out_DO<=X"f1";
			when  X"2c" => Out_DO<=X"71";
			when  X"2d" => Out_DO<=X"d8";
			when  X"2e" => Out_DO<=X"31";
			when  X"2f" => Out_DO<=X"15";
			
			when  X"30" => Out_DO<=X"04";
			when  X"31" => Out_DO<=X"c7";
			when  X"32" => Out_DO<=X"23";
			when  X"33" => Out_DO<=X"c3";
			when  X"34" => Out_DO<=X"18";
			when  X"35" => Out_DO<=X"96";
			when  X"36" => Out_DO<=X"05";
			when  X"37" => Out_DO<=X"9a";
			when  X"38" => Out_DO<=X"07";
			when  X"39" => Out_DO<=X"12";
			when  X"3a" => Out_DO<=X"80";
			when  X"3b" => Out_DO<=X"e2";
			when  X"3c" => Out_DO<=X"eb";
			when  X"3d" => Out_DO<=X"27";
			when  X"3e" => Out_DO<=X"b2";
			when  X"3f" => Out_DO<=X"75";

			when  X"40" => Out_DO<=X"09";
			when  X"41" => Out_DO<=X"83";
			when  X"42" => Out_DO<=X"2c";
			when  X"43" => Out_DO<=X"1a";
			when  X"44" => Out_DO<=X"1b";
			when  X"45" => Out_DO<=X"6e";
			when  X"46" => Out_DO<=X"5a";
			when  X"47" => Out_DO<=X"a0";
			when  X"48" => Out_DO<=X"52";
			when  X"49" => Out_DO<=X"3b";
			when  X"4a" => Out_DO<=X"d6";
			when  X"4b" => Out_DO<=X"b3";
			when  X"4c" => Out_DO<=X"29";
			when  X"4d" => Out_DO<=X"e3";
			when  X"4e" => Out_DO<=X"2f";
			when  X"4f" => Out_DO<=X"84";
			
			when  X"50" => Out_DO<=X"53";
			when  X"51" => Out_DO<=X"d1";
			when  X"52" => Out_DO<=X"00";
			when  X"53" => Out_DO<=X"ed";
			when  X"54" => Out_DO<=X"20";
			when  X"55" => Out_DO<=X"fc";
			when  X"56" => Out_DO<=X"b1";
			when  X"57" => Out_DO<=X"5b";
			when  X"58" => Out_DO<=X"6a";
			when  X"59" => Out_DO<=X"cb";
			when  X"5a" => Out_DO<=X"be";
			when  X"5b" => Out_DO<=X"39";
			when  X"5c" => Out_DO<=X"4a";
			when  X"5d" => Out_DO<=X"4c";
			when  X"5e" => Out_DO<=X"58";
			when  X"5f" => Out_DO<=X"cf";
			
			when  X"60" => Out_DO<=X"d0";
			when  X"61" => Out_DO<=X"ef";
			when  X"62" => Out_DO<=X"aa";
			when  X"63" => Out_DO<=X"fb";
			when  X"64" => Out_DO<=X"43";
			when  X"65" => Out_DO<=X"4d";
			when  X"66" => Out_DO<=X"33";
			when  X"67" => Out_DO<=X"85";
			when  X"68" => Out_DO<=X"45";
			when  X"69" => Out_DO<=X"f9";
			when  X"6a" => Out_DO<=X"02";
			when  X"6b" => Out_DO<=X"7f";
			when  X"6c" => Out_DO<=X"50";
			when  X"6d" => Out_DO<=X"3c";
			when  X"6e" => Out_DO<=X"9f";
			when  X"6f" => Out_DO<=X"a8";
			
			when  X"70" => Out_DO<=X"51";
			when  X"71" => Out_DO<=X"a3";
			when  X"72" => Out_DO<=X"40";
			when  X"73" => Out_DO<=X"8f";
			when  X"74" => Out_DO<=X"92";
			when  X"75" => Out_DO<=X"9d";
			when  X"76" => Out_DO<=X"38";
			when  X"77" => Out_DO<=X"f5";
			when  X"78" => Out_DO<=X"bc";
			when  X"79" => Out_DO<=X"b6";
			when  X"7a" => Out_DO<=X"da";
			when  X"7b" => Out_DO<=X"21";
			when  X"7c" => Out_DO<=X"10";
			when  X"7d" => Out_DO<=X"ff";
			when  X"7e" => Out_DO<=X"f3";
			when  X"7f" => Out_DO<=X"d2";
			
			when  X"80" => Out_DO<=X"cd";
			when  X"81" => Out_DO<=X"0c";
			when  X"82" => Out_DO<=X"13";
			when  X"83" => Out_DO<=X"ec";
			when  X"84" => Out_DO<=X"5f";
			when  X"85" => Out_DO<=X"97";
			when  X"86" => Out_DO<=X"44";
			when  X"87" => Out_DO<=X"17";
			when  X"88" => Out_DO<=X"c4";
			when  X"89" => Out_DO<=X"a7";
			when  X"8a" => Out_DO<=X"7e";
			when  X"8b" => Out_DO<=X"3d";
			when  X"8c" => Out_DO<=X"64";
			when  X"8d" => Out_DO<=X"5d";
			when  X"8e" => Out_DO<=X"19";
			when  X"8f" => Out_DO<=X"73";
			
			when  X"90" => Out_DO<=X"60";
			when  X"91" => Out_DO<=X"81";
			when  X"92" => Out_DO<=X"4f";
			when  X"93" => Out_DO<=X"dc";
			when  X"94" => Out_DO<=X"22";
			when  X"95" => Out_DO<=X"2a";
			when  X"96" => Out_DO<=X"90";
			when  X"97" => Out_DO<=X"88";
			when  X"98" => Out_DO<=X"46";
			when  X"99" => Out_DO<=X"ee";
			when  X"9a" => Out_DO<=X"b8";
			when  X"9b" => Out_DO<=X"14";
			when  X"9c" => Out_DO<=X"de";
			when  X"9d" => Out_DO<=X"5e";
			when  X"9e" => Out_DO<=X"0b";
			when  X"9f" => Out_DO<=X"db";
			
			when  X"a0" => Out_DO<=X"e0";
			when  X"a1" => Out_DO<=X"32";
			when  X"a2" => Out_DO<=X"3a";
			when  X"a3" => Out_DO<=X"0a";
			when  X"a4" => Out_DO<=X"49";
			when  X"a5" => Out_DO<=X"06";
			when  X"a6" => Out_DO<=X"24";
			when  X"a7" => Out_DO<=X"5c";
			when  X"a8" => Out_DO<=X"c2";
			when  X"a9" => Out_DO<=X"d3";
			when  X"aa" => Out_DO<=X"ac";
			when  X"ab" => Out_DO<=X"62";
			when  X"ac" => Out_DO<=X"91";
			when  X"ad" => Out_DO<=X"95";
			when  X"ae" => Out_DO<=X"e4";
			when  X"af" => Out_DO<=X"79";
			
			when  X"b0" => Out_DO<=X"e7";
			when  X"b1" => Out_DO<=X"c8";
			when  X"b2" => Out_DO<=X"37";
			when  X"b3" => Out_DO<=X"6d";
			when  X"b4" => Out_DO<=X"8d";
			when  X"b5" => Out_DO<=X"d5";
			when  X"b6" => Out_DO<=X"4e";
			when  X"b7" => Out_DO<=X"a9";
			when  X"b8" => Out_DO<=X"6c";
			when  X"b9" => Out_DO<=X"56";
			when  X"ba" => Out_DO<=X"f4";
			when  X"bb" => Out_DO<=X"ea";
			when  X"bc" => Out_DO<=X"65";
			when  X"bd" => Out_DO<=X"7a";
			when  X"be" => Out_DO<=X"ae";
			when  X"bf" => Out_DO<=X"08";
			
			when  X"c0" => Out_DO<=X"ba";
			when  X"c1" => Out_DO<=X"78";
			when  X"c2" => Out_DO<=X"25";
			when  X"c3" => Out_DO<=X"2e";
			when  X"c4" => Out_DO<=X"1c";
			when  X"c5" => Out_DO<=X"a6";
			when  X"c6" => Out_DO<=X"b4";
			when  X"c7" => Out_DO<=X"c6";
			when  X"c8" => Out_DO<=X"e8";
			when  X"c9" => Out_DO<=X"dd";
			when  X"ca" => Out_DO<=X"74";
			when  X"cb" => Out_DO<=X"1f";
			when  X"cc" => Out_DO<=X"4b";
			when  X"cd" => Out_DO<=X"bd";
			when  X"ce" => Out_DO<=X"8b";
			when  X"cf" => Out_DO<=X"8a";
			
			when  X"d0" => Out_DO<=X"70";
			when  X"d1" => Out_DO<=X"3e";
			when  X"d2" => Out_DO<=X"b5";
			when  X"d3" => Out_DO<=X"66";
			when  X"d4" => Out_DO<=X"48";
			when  X"d5" => Out_DO<=X"03";
			when  X"d6" => Out_DO<=X"f6";
			when  X"d7" => Out_DO<=X"0e";
			when  X"d8" => Out_DO<=X"61";
			when  X"d9" => Out_DO<=X"35";
			when  X"da" => Out_DO<=X"57";
			when  X"db" => Out_DO<=X"b9";
			when  X"dc" => Out_DO<=X"86";
			when  X"dd" => Out_DO<=X"c1";
			when  X"de" => Out_DO<=X"1d";
			when  X"df" => Out_DO<=X"9e";
			
			when  X"e0" => Out_DO<=X"e1";
			when  X"e1" => Out_DO<=X"f8";
			when  X"e2" => Out_DO<=X"98";
			when  X"e3" => Out_DO<=X"11";
			when  X"e4" => Out_DO<=X"69";
			when  X"e5" => Out_DO<=X"d9";
			when  X"e6" => Out_DO<=X"8e";
			when  X"e7" => Out_DO<=X"94";
			when  X"e8" => Out_DO<=X"9b";
			when  X"e9" => Out_DO<=X"1e";
			when  X"ea" => Out_DO<=X"87";
			when  X"eb" => Out_DO<=X"e9";
			when  X"ec" => Out_DO<=X"ce";
			when  X"ed" => Out_DO<=X"55";
			when  X"ee" => Out_DO<=X"28";
			when  X"ef" => Out_DO<=X"df";
			
			when  X"f0" => Out_DO<=X"8c";
			when  X"f1" => Out_DO<=X"a1";
			when  X"f2" => Out_DO<=X"89";
			when  X"f3" => Out_DO<=X"0d";
			when  X"f4" => Out_DO<=X"bf";
			when  X"f5" => Out_DO<=X"e6";
			when  X"f6" => Out_DO<=X"42";
			when  X"f7" => Out_DO<=X"68";
			when  X"f8" => Out_DO<=X"41";
			when  X"f9" => Out_DO<=X"99";
			when  X"fa" => Out_DO<=X"2d";
			when  X"fb" => Out_DO<=X"0f";
			when  X"fc" => Out_DO<=X"b0";
			when  X"fd" => Out_DO<=X"54";
			when  X"fe" => Out_DO<=X"bb";
			when  X"ff" => Out_DO<=X"16";

			when others => Out_DO<=X"00";
			
		end case;

	end process;
	
end Behavioral;

