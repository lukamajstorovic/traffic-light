library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Boje_semafora is

	port(	
			clk, rst	: in 	std_logic;
			boje		: out	std_logic_vector(2 downto 0)
	);
	
end Boje_semafora;

architecture Behavioral of Boje_semafora is

	type stanje is (GREEN, RED, YELLOW1, YELLOW2);
	signal sad, bud : stanje;
	
	signal clk_o : std_logic;
	
	signal cTime : integer range 0 to 30;
	constant T1  : integer :=3;
	constant T2  : integer :=30;
	
begin

	f0 : entity work.freqDivGen generic map (100_000_000) port map (clk, clk_o);
	
	process(clk_o, rst)
		variable count : integer range 0 to 30;
	begin
		if (rst = '1') then
			sad <= RED;
			count := 0;
		elsif (clk_o'event and clk_o = '1') then
			count := count + 1;
			if(count >= cTime) then
				sad <= bud;
				count := 0;
			end if;
		end if;
	end process;
	
	process(sad)
	begin
		case sad is
			when GREEN =>
				boje 	<= "010";
				cTime <= T2;
				bud 	<= YELLOW1;
			when YELLOW1 =>
				boje	<= "110";
				cTime <= T1;
				bud <= RED;
			when YELLOW2 =>
				boje	<= "110";
				cTime <= T1;
				bud <= GREEN;
			when RED =>
				boje 	<= "100";
				cTime <= T2;
				bud 	<= YELLOW2;
		end case;
	end process;


end Behavioral;
