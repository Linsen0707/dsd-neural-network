----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:26 10/21/2009 
-- Design Name: 
-- Module Name:    test - Behavioral 
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

entity test is
    Port ( sw : in  STD_LOGIC_VECTOR (1 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end test;

architecture Behavioral of test is
	signal res : STD_LOGIC;
begin
	process (sw)
	begin
		res<=sw(0)XOR sw(1);
		if res = '1' then
			led(0)<='1';
		else
			led(1)<='1';
		end if;
end Behavioral;

