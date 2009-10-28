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

library floatfixlib;
use floatfixlib.float_pkg.ALL;

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
    variable result,prev,exp : float32;
    variable converge : float32:= to_float(0.1,32);
    variable val,div : float32:=to_float(1.0,32);
	begin
	  while abs((prev-result)/result) >= converge loop
	     if pow = 0 then
	      exp := to_float(1,32);
	     else
	       exp := val;
	     end if;
	     
	     for i in 0 to pow-1 loop
	       exp := exp * val;
	     end loop;
	     
	     for i in pow downto 0 loop
	       div := div * i;
	     end loop;
	     
	     result := result + exp/div;
	     
	     prev := result;
	     pow := pow + 1;
	  end loop;
	end process;
end Behavioral;