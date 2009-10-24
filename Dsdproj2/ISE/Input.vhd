----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:59 10/21/2009 
-- Design Name: 
-- Module Name:    Input - Behavioral 
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

entity Input is
    Port ( Input : in  STD_LOGIC;
           Output : out  unsigned (7 downto 0));
end Input;

architecture Behavioral of Input is

begin
	process (Input)
	begin
		--convert to 8 bit signed
		if Input = '1' then
			Output<="11111111";	--set output to 1
		else
			Output<="00000000";	--set output to 0
		end if;
	end process;
end Behavioral;

