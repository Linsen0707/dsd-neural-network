----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:49 10/19/2009 
-- Design Name: 
-- Module Name:    Connection - Behavioral 
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

entity Connection is
    Port ( i : in unsigned(7 downto 0);
           o : out signed(15 downto 0);
           w : in signed(15 downto 0));
end Connection;

architecture Behavioral of Connection is
signal inter : signed(31 downto 0);
begin
	inter <= (signed("00000000" & i) * w);
	o <= inter(23 downto 8);
end Behavioral;
