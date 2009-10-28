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
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sigmoid2 is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0):="00000000");
end Sigmoid2;

architecture Behavioral of Sigmoid2 is
  signal result32 : float32;
  signal resultSTD : unsigned(7 downto 0);
  variable round_style : round_type:=round_nearest;
  variable check_error : boolean:=True;
begin
  result32 <= to_float(conv_std_logic_vector(resultSTD,16),32);
  resultSTD <= to_slv(r);
  process (X)
  	 variable pow : Integer:=0;
    variable result,prev,exp : float32;
    variable converge : float32:= to_float(0.1,32);
    variable val,div : float32:=to_float(1,32);
	begin
	  
	  val:= floatfixlib.float_pkg.to_float(IEEE.std_logic_arith.conv_std_logic_vector(X,16),32);
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
	  --Y<= unsigned(result);
	  result32 <= result;
	  resultSTD <= floatfixlib.float_pkg.to_unsigned(result);
	end process;
end Behavioral;