# What is FPGA?
FPGA stands for Field Programmable Gate Array. Let's analyze the term:
1. Field-Programmable: FPGA is manufactured to be easily reconfigured by developers, designers or customers. To program an FPGA as a specific configuration, Verilog HDL or VHDL is used as the standard language for FPGA programming.
2. Gate-Array: An FPGA consists of an array of programmable logic gates/ blocks such as AND, OR, XOR, NOT, memory elements, DSP components, etc., and reconfigurable interconnects which are to connect logic gates together for performing a specific function.
Thus, FPGAs are nothing, but logic blocks and interconnects that can be programmable by Hardware Description Languages (Verilog HDL/ VHDL) to perform different complex functions. 
In fact, FPGAs can be used to implement almost any DSP algorithm. Some FPGAs also obtain embedded soft-core processors such as Xilinx's MicroBlaze, Altera's Nios II, etc. so that we can use C, C++, etc. to program the processor like what we do with a microcontroller. Besides, the soft processors can communicate with hardware accelerators to speed up complex DSP operations so that we can obtain a better flexible embedded system for niche applications. 
Here are 5 reasons why FPGA design:
1. Very fast on-chip (FPGA) demonstration
2. Simple and fast design process on FPGA
3. FPGA's programmability 
4. FPGA's high performance
5. FPGA's flexibility 

# Verilog vs VHDL
Low Level Modeling:
In terms of low-level hardware modeling, Verilog is better than VHDL. It is reasonable because Verilog is originally created for modeling and simulating logic gates. In fact, Verilog has built-in primitives or low-level logic gates so that designers can instantiate the primitives in Verilog code while VHDL does not have it.
Verilog's gate primitives: and, nand, or, nor, xor, xnor, buf, not, bufif0, notif0, bufif1, notif1, pullup, pulldown.
Verilog's switch primitives: pmos, nmos, rpmos, rnmos, cmos, rcmos, tran, rtran, tranif0, rtranif0, tranif1, rtranif1.
More importantly, Verilog supports User-Defined Primitives (UDP) so that designers can define their own cell primitives. This feature is especially necessary and popular for ASICs designers.
Below are examples of VHDL equivalent code for Verilog gate primitives:
or u1(x,y,z); in Verilog 
<=> 
x <= y OR z; in VHDL
and u2(i1,i2,i3); (Verilog) 
<=> 
i3 <= i2 AND i3; in VHDL

High-level Modeling:
VHDL is better than Verilog in terms of high-level hardware modeling. VHDL provides more features and constructs for high-level hardware modeling compared to Verilog. Following are major different features for supporting high-level hardware modeling when comparing VHDL with Verilog:
1. User-Defined Data types in VHDL
Verilog has very simple data types and it's all defined by Verilog language (users cannot define their own data types in Verilog). Verilog has two main data types including net data types (for connecting components together such as wire (most popular), wor, wand, tri, trior, etc.) and variable data types (for temporary storage such as reg (most popular), integer, time, real, and realtime). 
VHDL supports many different data types including predefined VHDL data types and User-Defined data types. Predefined VHDL data types include bit, bit_vector, string, time, boolean, character, and numeric (real or integer). VHDL allows designers to define different types based on the predefined VHDL data types; this is a good feature for complex and high-level systems which may use many different data types. Below is an example VHDL code for defining new data types:

type int_8bit is range 0 to 255 -- define 8-bit unsigned numbers
signal i : int_8bit;
type state_FSM is (Idle, start, calculate , finish, delay) 
-- define symbolic states to represent FSM states.
signal current_state, next_state: state_FSM;

2. Package for Design Reuse in VHDL
Packages in VHDL are commonly used for data types and subprograms' declaration. The subprograms or data types declared in VHDL package can be used in many different entities or architectures. For example:

package fsm_type is 
type FSM_states is (IDLE, TRANSMIT, RECEIVE, STOP);
end package
-- to use the FSM_states type in an entity or architecture
-- use the following statement on top of the entity
use work.fsm_type.all
entity example is

There is no package definition in Verilog. The closest Verilog equivalent to VHDL package is `include Verilog compiler directive. Functions or definitions can be separately saved in another file and then use it in a module by using `include directive. Below is a Verilog example code:

// Below is the content of "VerilogVsVHDL.h" file
`define INPUT_VERILOG "./test_VerilogvsVHDL.hex" // Input file name 
`define OUTPUT_VHDL "VHDL.bmp" // Output file name 
`define VERILOG_VHDL_DIFFERENCE

// Then call it in every single module that you want to use the definition above
`include "VerilogVsVHDL.h"

3. Configuration Statement in VHDL
A VHDL design can obtain many design entities with different architectures for one entity. Configuration statements associate the exact design entity to a component instance in a design. When there is more than one architecture in an entity, configuration statements continue to specify the desired design architecture is assigned to the entity for synthesis or simulation. This feature is very helpful when VHDL designers need to manage a large high-level design. 
Following is a VHDL example code for configuration statement:

entity BUF is
  generic (DELAY : TIME := 10 ns);
  port ( BUF_IN : in BIT; BUF_OUT : out BIT);
end BUF;
-- The first design architecture for BUF 
architecture STRUCT_BUF1 of BUF is
signal temp: bit;
begin
  BUF_OUT <= not temp after DELAY;
  temp <= not BUF_IN after DELAY;
end STRUCT_BUF1;
-- The second design architecture for BUF 
architecture STRUCT_BUF2 of BUF is
begin
  BUF_OUT <= BUF_IN after 2*DELAY;;
end STRUCT_BUF2;
-- Testbench to simulate BUF entity 
entity BUF_TESTBENCH is 
end BUF_TESTBENCH;
architecture STRUCT_BUF_TEST of BUF_TESTBENCH is
signal TEST1, TEST2 : BIT := '1';
-- BUF_COMP component declaration:
component BUF_COMP is
  generic (TIME_DELAY : TIME);
  port ( IN1 : in BIT; OUT1 : out BIT );
end component;
begin
  -- instantiation of BUF_COMP component:
  DUT:BUF_COMP generic map (10 ns) port map (TEST1,TEST2);
end STRUCT_BUF_TEST;
-- Configuration specify the design entity and architecture
-- for the DUT component instance in the testbench above
configuration CONFIG_BUF of TEST_BUF is
-- Associate BUF_COMP component instance to BUF design entity
-- and STRUCT_BUF1 design architecture for simulation 
for STRUCT_BUF_TEST 
  for DUT : BUF_COMP 
    use entity WORK.BUF (STRUCT_BUF1)
    generic map (DELAY => TIME_DELAY)
    port map (BUF_IN => IN1, BUF_OUT => OUT1);
  end for;
end for ;
end CONFIG_BUF;

4. Library Management in VHDL
When looking at Verilog and VHDL code at the same time, the most obvious difference is Verilog does not have library management while VHDL does include design libraries on the top of the code. VHDL libraries contain compiled architectures, entities, packages, and configurations. This feature is very useful when managing large design structures. Examples of packages and configurations in VHDL are already given above. Following is VHDL example code for library management in VHDL:

-- library management in VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.clock_div.all;

In short, VHDL is better at high-level hardware modeling than Verilog.
It is worth mentioning that SystemVerilog was created to enhance the weakness of Verilog language in high-level modeling by adding high-level features and constructs like in VHDL to Verilog for verification. SystemVerilog now is widely used for IC Verification.

### VHDL is strongly typed vs Verilog is loosely typed
VHDL is a very strongly typed hardware description language so VHDL code must be correctly written with matched and defined data types. It means that there will be a compiler error if you mix data types or mismatch signals when assigning in VHDL. On the other hand, Verilog is a loosely typed language. In Verilog, you can mix data types or mismatch signals when assigning. Below is a VHDL example code for mismatching signals:

signal test_reg1:  std_logic_vector(3 downto 0); 
signal test_reg2:  std_logic_vector(7 downto 0); 
test_reg2 <= test_reg1;
-- You cannot assign a 4-bit signal to an 8-bit signal 
-- in VHDL, it will introduce a syntax error below:
-- Width mismatch. Expected width 8, Actual width is 4 
-- for dimension 1 of test_reg1.

Verilog Compiler will not introduce syntax errors when you assign 4-bit signal to 8-bit signal. In Verilog, signals with different bits width can be assigned to each other. Verilog compiler will adapt the width of the source signal to the width of the destination signal. Unused bits will be optimized during synthesis.
Below is another VHDL example for mixing data types when assigning signals:

signal test1: std_logic_vector(7 downto 0);
signal test2: integer;
test2 <= test1;
-- Syntax Error: type of test2 is incompatile with type of test1 

### VHDL Complex data types vs Verilog simple data types

Verilog is like C programming language, while VHDL is like Ada or Pascal programming language
Verilog is case-sensitive while VHDL is not. It means that DAta1 and Data1 are two different signals in Verilog, but both are the same signals in VHDL.
In Verilog, to use a component instance in a module, you just need to instantiate it in the module with a correct port map. In VHDL, before instantiating the instance, the component generally needs to be declared the architecture or in a package if you use the old instantiation statement as the following example. In VHDL-93, you can instantiate the entity directly like this: "Label_name: entity work.component_name port map (port list);".

