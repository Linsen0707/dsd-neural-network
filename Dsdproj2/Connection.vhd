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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Connection is
    Port ( i : in  STD_LOGIC_VECTOR (7 downto 0);
           o : out  STD_LOGIC_VECTOR (7 downto 0));
end Connection;

architecture Behavioral of Connection is
	signal weight : STD_LOGIC_VECTOR(7 downto 0) := "01000000";
	signal intermediate : STD_LOGIC_VECTOR(15 downto 0);
begin
	process (i)
	begin
		intermediate <= (("0000"&i) * ("0000"&weight));
		o <= intermediate(15 downto 8);
	end process;
end Behavioral;
