--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:55:40 09/19/2021
-- Design Name:   
-- Module Name:   C:/Users/MRADULA SINGH/Music/pratibha/Full-Adder/FA_testbench.vhd
-- Project Name:  Full-Adder
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
 
ARCHITECTURE structural OF FA_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA
    PORT(
         p : IN  std_logic;
         q : IN  std_logic;
         cin : IN  std_logic;
         sum : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal p : std_logic := '0';
   signal q : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic;
   signal cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA PORT MAP (
          p => p,
          q => q,
          cin => cin,
          sum => sum,
          cout => cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      p <= '0'; q <= '0'; cin <= '0'; wait for 100 ns;
		p <= '0'; q <= '0'; cin <= '1'; wait for 100 ns; 
		p <= '0'; q <= '1'; cin <= '0'; wait for 100 ns;
		p <= '0'; q <= '1'; cin <= '1'; wait for 100 ns;
		p <= '1'; q <= '0'; cin <= '0'; wait for 100 ns;
		p <= '1'; q <= '0'; cin <= '1'; wait for 100 ns;
		p <= '1'; q <= '1'; cin <= '0'; wait for 100 ns;
		p <= '1'; q <= '1'; cin <= '1'; wait for 100 ns;
	
   end process;

END;
