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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--entity declaration
entity Input is
    Port ( Input : in  STD_LOGIC;                 --input bit
           Output : out  unsigned (7 downto 0));  --output vector
end Input;
--architecture declaration
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

