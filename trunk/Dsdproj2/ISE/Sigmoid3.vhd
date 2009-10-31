----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:58:47 10/28/2009 
-- Design Name: 
-- Module Name:    Sigmoid3 - Behavioral 
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

library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sigmoid3 is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0));
end Sigmoid3;

architecture Behavioral of Sigmoid3 is
  signal resultS : float32;
  signal valS : float32;
  signal counterS : Integer;
      
begin
  process (X)
      variable result,exp,div : float32:=to_float(0);
      variable pow : Integer:=0;
      variable val : float32:=to_float(0.997);
      variable done : boolean:=true;
     begin
       
       val := to_float(X);
       val := val / 256;
              
       pow := 0;
       result := to_float(0);
       done := true;

       if (val > 2) then
          result := to_float(1);
       elsif (val < -2) then 
          result := to_float(0);
       else
       
         while done loop
         
           div := to_float(1);
           if pow = 0 then
             exp := to_float(1);
           else
             exp := val;
           end if;

           --calculate top of fraction
           for i in 0 to pow-1 loop
             exp := exp * val;
           end loop;


           --calculate divisor
           for i in pow downto 1 loop
             div := div * i;
           end loop;
  
           --sum
           if (pow mod 2 = 1) then
             result := result - (exp/div);
           else 
             result := result + (exp/div);
           end if;
         
         
           --increment counter
           pow := pow + 1;
           if pow > 10 then 
             done := false;
           end if;
         
         end loop;
         result := abs(result);
         result := (1 / (1 + result));
       end if;
       y<= to_unsigned(result*256,8);
       resultS<=result;         
       valS<=val;
       counterS<=pow;
       
     end process;
end Behavioral;
