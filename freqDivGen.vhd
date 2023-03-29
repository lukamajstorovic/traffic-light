library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freqDivGen is
	generic(
			nfCLK	: natural := 100_000_000
	);
	port(	
			clk	: in 		std_logic := '0';
			clk_o	: buffer	std_logic := '0'
	);
end freqDivGen;

architecture Behavioral of freqDivGen is
begin
	process(clk)
		variable temp : integer range 0 to nfCLK/2 := 0;
	begin
		if(clk'event and clk = '1') then
			temp := temp + 1;
			if(temp>=nfCLK/2) then
				clk_o <= not clk_o;
				temp := 0;
			end if;
		end if;
	end process;
end Behavioral;