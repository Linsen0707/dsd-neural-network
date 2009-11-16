----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Alex Karantza
-- 
-- Create Date:    17:59:52 10/19/2009 
-- Design Name: 	 DSD Project
-- Module Name:    Neuron - Mixed 
-- Project Name:   DSD Project
-- Target Devices: Spartan 3e-100
-- Tool versions: 
-- Description:    Accumulates the input signals and sigmoids;
--                 Accumulates the error signals and modulates by the gaussian.
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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Neuron is
	Port (learnmode : in boolean;
       ia : in signed(15 downto 0); -- A Input
    	 ib : in signed(15 downto 0); -- B Input
       ic : in signed(15 downto 0); -- C Input 
  		 ea : in signed(15 downto 0); -- A Error
       eb : in signed(15 downto 0); -- B Error
       ec : in signed(15 downto 0); -- C Error
       outerror : out signed(15 downto 0);  -- Output error
       outvalue : out unsigned(7 downto 0) ); -- Output signal
end Neuron;



architecture Mixed of Neuron is
    
  -- Sum of input signals
  signal sum : signed (15 downto 0):="0000000000000000";

  -- Sum of error signals
  signal errsum : signed (31 downto 0);

  -- Derivative-sigmoid of previous
  signal dvalue : signed (31 downto 0);

  -- Last signal output
  signal lastvalue : unsigned(7 downto 0);
	
  -- Uses the sigmoid
  component Sigmoid is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0));
   end component;

	
begin

  -- Sum of the A,B,C signal inputs
  sum <= ia + ib + ic;
  -- Pass that sum through the sigmoid
  sigmoider: Sigmoid
    port map(sum, lastvalue);
  -- And output it
  outvalue <= lastvalue;
    
  -- Compute the gaussian
  dvalue <= signed(("0000000100000000" - ("00000000"&lastvalue)) * ("00000000"&lastvalue));
  -- The error sum modulated by the gaussian
  errsum <= (ea + eb + ec) * dvalue(23 downto 8);
  -- Output the correct bits
  outerror <= errsum(23 downto 8);
 
end Mixed;

