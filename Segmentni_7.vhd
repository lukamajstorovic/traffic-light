library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Segmentni_7 is

	port(	
			clk, rst	: in 	std_logic;
			segmenti : out	std_logic_vector (6 downto 0);
			bir_uk 	: out std_logic_vector (7 downto 0)
			--segmenti_1 	: out	std_logic_vector (6 downto 0);
			--segmenti_2 	: out	std_logic_vector (6 downto 0)
	);
	
end Segmentni_7;

architecture Behavioral of Segmentni_7 is

	type stanje is (GREEN_RED, YELLOW);
	signal sad, bud : stanje;
	
	signal clk_o 	: std_logic;
	signal clk_o2 	: std_logic;
	
	signal cTime : integer range 0 to 30;
	constant T1  : integer :=3;
	constant T2  : integer :=30;
	
	signal sekunde : integer range 0 to 30;
	
	signal Sel 		: std_logic;
	signal bir 		: std_logic_vector (1 downto 0);

begin
	
	process(clk_o, rst)
		variable count : integer range 0 to 30;
	begin
		if (rst='1') then
			sad <= GREEN_RED;
			count := 0;
		elsif (clk_o'event and clk_o = '1') then
			count := count + 1;
			if(count >= cTime) then
				sad <= bud;
				if(bud = YELLOW) then 
					count := 27;
				else
					count := 0;
				end if;
			end if;
		end if;
		sekunde <= count;
	end process;
	
	process(sad)
	begin
		case sad is
			when GREEN_RED =>
				cTime <= T2;
				bud 	<= YELLOW;
			when YELLOW =>
				cTime <= T2;
				bud 	<= GREEN_RED;
		end case;
	end process;
	
	f0 : entity work.freqDivGen generic map (100_000_000) port map (clk, clk_o);
	f1 : entity work.freqDivGen generic map (1_000_000) 	port map (clk, clk_o2);
	
	counting 	: entity work.counter_Sel 	port map (clk_o2, Sel);
	demuxator 	: entity work.demux 			port map ('0', Sel, bir);
	muxator		: entity work.mux				port map (sekunde, Sel, segmenti);
	
	bir_uk <= "111111" & bir;
	
	end Behavioral;

