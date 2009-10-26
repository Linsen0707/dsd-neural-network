----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:58:47 10/15/2009 
-- Design Name: 
-- Module Name:    Sigmoid - Behavioral 
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

entity Sigmoid is
    Port ( X : in  STD_LOGIC_VECTOR(15 downto 0);
           Y : out  STD_LOGIC_VECTOR(7 downto 0));
end Sigmoid;

architecture Behavioral of Sigmoid is

begin
  process (X)
  	 variable pow : Integer:=0;
    variable previous,result : signed(15 downto 0);
    variable converge : unsigned(7 downto 0):="00000001";
	begin
	  while abs((previous-result)/result) < converge loop
	    
	  end loop;
	end process;
end Behavioral;