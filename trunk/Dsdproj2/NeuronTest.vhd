--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:46 10/19/2009
-- Design Name:   
-- Module Name:   /home/karantza/Desktop/dsd-nn/NeuronTest.vhd
-- Project Name:  dsd-nn
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Neuron
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY NeuronTest IS
END NeuronTest;
 
ARCHITECTURE behavior OF NeuronTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Neuron
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         c : IN  std_logic_vector(7 downto 0);
         outsignal : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal c : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal outsignal : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Neuron PORT MAP (
          a => a,
          b => b,
          c => c,
          outsignal => outsignal
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

      -- insert stimulus here 
		a <= "00101011";
		wait for 100ms;
		b <= "01001010";
		wait for 100ms;
		c <= "11110010";
		wait for 100ms;
		
		assert (outsignal = (a + b + c)) report "Neuron failure" severity failure;

      wait;
   end process;

END;
