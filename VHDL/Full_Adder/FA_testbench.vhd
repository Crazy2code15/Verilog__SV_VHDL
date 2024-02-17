--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:24:09 09/18/2021
-- Design Name:   
-- Module Name:   C:/Users/MRADULA SINGH/Music/pratibha/Full_Adder/FA_testbench.vhd
-- Project Name:  Full_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FA
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FA_testbench IS
END FA_testbench;
 
ARCHITECTURE behavior OF FA_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      A<= '0'; B<= '0'; Cin<= '0';    wait for 100 ns;
		A<= '0'; b<= '0'; Cin<= '1';    wait for 100 ns;
		A<= '0'; b<= '1'; Cin<= '0';    wait for 100 ns;
		A<= '0'; b<= '1'; Cin<= '1';    wait for 100 ns;
		A<= '1'; b<= '0'; Cin<= '0';    wait for 100 ns;
		A<= '1'; b<= '0'; Cin<= '1';    wait for 100 ns;
		A<= '1'; b<= '1'; Cin<= '0';    wait for 100 ns;	
		A<= '1'; b<= '1'; Cin<= '1';    wait for 100 ns;	

   end process;

END;
