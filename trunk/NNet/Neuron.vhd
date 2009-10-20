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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Neuron is
	Port (a : in STD_LOGIC_VECTOR(7 downto 0);
			b : in STD_LOGIC_VECTOR(7 downto 0);
			c : in STD_LOGIC_VECTOR(7 downto 0);
			outsignal : out STD_LOGIC_VECTOR(7 downto 0) );
end Neuron;

architecture Behavioral of Neuron is

	signal sum : STD_LOGIC_VECTOR(7 downto 0);
begin

	process (a,b,c)
	begin
		sum <= "00000000";
		sum <= sum + a;
		sum <= sum + b;
		sum <= sum + c;
	end process;

	outsignal <= sum;
	
end Behavioral;

