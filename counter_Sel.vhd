library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_Sel is

	port(
			clk : in 	 std_logic;
			Sel : buffer std_logic
	);

end counter_Sel;

architecture Behavioral of counter_Sel is
begin

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(Sel = '1') then
				Sel <= '0';
			else
				Sel <= '1';
			end if;
		end if;
	end process;
	
end Behavioral;