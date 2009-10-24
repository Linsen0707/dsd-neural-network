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
	Port (a : in signed(15 downto 0);
			b : in signed(15 downto 0);
			c : in signed(15 downto 0);
			outsignal : out unsigned(7 downto 0) );
end Neuron;



architecture Mixed of Neuron is
    
	signal sum : signed (15 downto 0):="0000000000000000";
	
	component Sigmoid is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0));
   end component;
	
begin

   sigmoider: Sigmoid
      port map(sum, outsignal);

	sum <= a + b + c;
	

end Mixed;

