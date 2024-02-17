----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:05 09/22/2021 
-- Design Name: 
-- Module Name:    JK_FF - Behavioral 
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

entity JK_FF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end JK_FF;

architecture Behavioral of JK_FF is

begin
Process(J,K,clk)
variable tmp:std_logic;
begin
	if(clk'event and clk='1') then
		if(J='0' and K='0')then
			tmp:=tmp;
		elsif(J='0' and K='1') then
			tmp:='0';
		elsif(J='1' and K='0') then 
			tmp:='1';
		else
			tmp:=not(tmp);
		end if;
	else
		tmp:=tmp;
	end if;
		Q<=tmp;
end Process;
end Behavioral;
