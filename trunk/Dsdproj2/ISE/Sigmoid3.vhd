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
           Y : out  unsigned(7 downto 0):="00000000");
end Sigmoid3;

architecture Behavioral of Sigmoid3 is
  signal output : unsigned(7 downto 0):="00000000";
    
  signal resultS,prevS,expS,divS : float32:=to_float(0);
  signal convergeS : float32:=to_float(0.1);
  signal powS : Integer:=0;
  signal valS,ratioS : float32:=to_float(1);
  signal doneS : boolean:=true;
  signal counterS : Integer:=0;
      
begin
  process --(X)
      
          
      variable result,prev,exp,div : float32:=to_float(0);
      variable converge : float32:=to_float(0.1);
      variable pow : Integer:=0;
      variable val,ratio : float32:=to_float(1);
      variable done : boolean:=true;
      variable counter : Integer:=0;
     begin
       
       val := to_float(X);
       counter := 0;
       while done loop
         
         div := to_float(1);
         wait for 5 ns;
         if pow = 0 then
           exp := to_float(1);
         else
           exp := val;
         end if;
         wait for 10 ns;
         --calculate top of fraction
         for i in 0 to pow-1 loop
           exp := exp * val;
         end loop;
         wait for 15 ns;
         --calculate divisor
         for i in pow downto 1 loop
           div := div * i;
           wait for 5 ns;
         end loop;
         wait for 20 ns;
         
         --sum
         if (pow mod 2 = 1) then
           result := result - (exp/div);
         else 
           result := result + (exp/div);
         end if;
         
         --convergence check
         ratio := abs((prev-result)/result);
         if ratio < converge then
           done := false;
         end if;
         
         --increment counter
         prev := result;
         pow := pow + 1;
         counter := counter + 1;
         if counter > 10 then 
           done := false;
         end if;
         
         resultS<=result;
         prevS<=prev;
         expS<=exp;
         divS<=div;
         convergeS<=converge;
         powS<=pow;
         valS<=val;
         ratioS<=ratio;
         doneS<=done;
         counterS<=counter;
         
         wait for 50 ns;
       end loop;
       result := (1 / (1 + result));
       output<= to_unsigned(result*256,8);
       wait for 100000 ns;
  end process;
end Behavioral;
