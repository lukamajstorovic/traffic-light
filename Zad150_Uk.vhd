library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Z150_Uk is

	port(	
			clk, rst : in 	std_logic;
			boje 		: out std_logic_vector (2 downto 0);
			segmenti : out std_logic_vector (6 downto 0);
			bir_uk	: out std_logic_vector (7 downto 0)
	);

end Z150_Uk;


architecture Behavioral of Z150_Uk is

begin
	boje_semafora_inic : entity work.Boje_semafora 	port map (clk, rst, boje);
	segmentni_7_inic 	 : entity work.segmentni_7		port map (clk, rst, segmenti, bir_uk);
	
end Behavioral;

