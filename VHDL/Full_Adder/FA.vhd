----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:10 09/18/2021 
-- Design Name: 
-- Module Name:    FA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FA is
Port (A, B, Cin:in STD_LOGIC;
		Cout, Sum:out STD_LOGIC);
end FA;

architecture Behavioral of FA is
begin
	process(A, B, Cin)
	begin
		if(A = '0' and B = '0' and Cin = '0') then Sum<='0'; Cout<='0';
		elsif(A = '0' and B = '0' and Cin = '1' ) then Sum<='1'; Cout<='0';
		elsif(A = '0' and B = '1' and Cin = '0' ) then Sum<='1'; Cout<='0';
		elsif(A = '0' and B = '1' and Cin = '1' ) then Sum<='0'; Cout<='1';
		elsif(A = '1' and B = '0' and Cin = '0' ) then Sum<='1'; Cout<='0';
		elsif(A = '1' and B = '0' and Cin = '1' ) then Sum<='0'; Cout<='1';
		elsif(A = '1' and B = '1' and Cin = '0' ) then Sum<='0'; Cout<='1';
		elsif(A = '1' and B = '1' and Cin = '1' ) then Sum<='1'; Cout<='1';
		else
			Sum<='Z'; Cout<='Z';
		end if;
	end process;
end Behavioral;

