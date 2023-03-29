library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
	
	port(
			Xul 		: in 	integer range 0 to 30;
			Sel 		: in 	std_logic;
			segmenti	: out std_logic_vector (6 downto 0)
	);
	
end mux;

architecture Behavioral of mux is

	signal segmenti_1 : std_logic_vector (6 downto 0);
	signal segmenti_2 : std_logic_vector (6 downto 0);
	
begin

	process(Xul)
	begin
		case Xul is 
			when 30 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0000001";
			when 29 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "1001111";
			when 28 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0010010";
			when 27 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0000110";
			when 26 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "1001100";
			when 25 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0100100";
			when 24 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0100000";
			when 23 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0001111";
			when 22 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0000000";
			when 21 => 
				segmenti_1 <= "1111111";
				segmenti_2 <= "0000100";
			----------- do 9 -----------
			when 20 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0000001";
			when 19 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "1001111";
			when 18 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0010010";
			when 17 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0000110";
			when 16 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "1001100";
			when 15 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0100100";
			when 14 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0100000";
			when 13 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0001111";
			when 12 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0000000";
			when 11 => 
				segmenti_1 <= "1001111";
				segmenti_2 <= "0000100";
			---------- do 19 ----------
			when 10 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0000001";
			when 9 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "1001111";
			when 8 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0010010";
			when 7 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0000110";
			when 6 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "1001100";
			when 5 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0100100";
			when 4 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0100000";
			when 3 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0001111";
			when 2 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0000000";
			when 1 => 
				segmenti_1 <= "0010010";
				segmenti_2 <= "0000100";
			---------- do 29 ----------
			when others => 
				segmenti_1 <= "0000110";
				segmenti_2 <= "0000001";
			---------- do 30 ----------
		end case;
	end process;
	
	process(Sel)
	begin
		if(Sel = '0') then
			segmenti <= segmenti_2;
		else
			segmenti <= segmenti_1;
		end if;
	end process;

end Behavioral;