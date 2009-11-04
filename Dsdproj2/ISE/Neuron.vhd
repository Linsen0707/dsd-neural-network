----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:30 10/19/2009 
-- Design Name: 
-- Module Name:    Neuron - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Neuron is
	Port (learnmode : in boolean;
       ia : in signed(15 downto 0);
    	  ib : in signed(15 downto 0);
    		 ic : in signed(15 downto 0);
  		   ea : in signed(15 downto 0);
       eb : in signed(15 downto 0);
       ec : in signed(15 downto 0);
       outerror : out signed(15 downto 0);  
			 outvalue : out unsigned(7 downto 0) );
end Neuron;



architecture Mixed of Neuron is
    

  signal sum : signed (15 downto 0):="0000000000000000";
	signal errsum : signed (31 downto 0);
	signal dvalue : signed (31 downto 0);
	signal lastvalue : unsigned(7 downto 0);
	
  component Sigmoid is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0));
   end component;

	
begin

  sum <= ia + ib + ic;
  sigmoider: Sigmoid
    port map(sum, lastvalue);

  outvalue <= lastvalue;
    
  dvalue <= signed(("0000000100000000" - ("00000000"&lastvalue)) * ("00000000"&lastvalue));
  errsum <= (ea + eb + ec) * dvalue(23 downto 8);
 	outerror <= errsum(23 downto 8);
 
end Mixed;

