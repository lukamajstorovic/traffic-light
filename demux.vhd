library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity demux is

	port(
			Xul : in		 std_logic;
			Sel : in		 std_logic;
			X 	 : out	 std_logic_vector (1 downto 0)
	);

end demux;

architecture Behavioral of demux is
begin
	process(Sel)
	begin
		if(Sel = '0') then
			X <= '1' & Xul;
		else
			X <= Xul & '1';
		end if;
			
	end process;
	
end Behavioral;