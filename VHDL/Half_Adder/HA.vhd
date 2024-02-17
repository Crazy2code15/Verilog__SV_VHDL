----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:06 09/18/2021 
-- Design Name: 
-- Module Name:    HA - Behavioral 
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

entity HA is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end HA;

architecture Behavioral of HA is

begin
	process (a, b)
	begin
	if(a = '0' and b = '0') then
		s<='0'; c<='0';
	elsif(a = '0' and b = '1') then
		s<='1'; c<='0';
	elsif(a = '1' and b = '0') then
		s<='1'; c<='0';
	elsif(a = '1' and b = '1') then
		s<='0'; c<='1';
	else
		s<='Z'; c<='Z';
	end if;
	end process;
end Behavioral;

