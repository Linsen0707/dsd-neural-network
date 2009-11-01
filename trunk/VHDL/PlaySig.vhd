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

entity PlaySig is
    Port ( X : in Integer:=0;--X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0):="00000000");
end PlaySig;

architecture Behavioral of PlaySig is
  signal num,eval : float32;
  signal numReal,evalReal : real;
  signal done : Boolean:=true;
begin
  num <= to_float(X);
  numReal <= to_real(num);
  eval <= 
  --process (X)
--    variable exp,div : float32;
--  begin
--    for pow in 0 to 10 loop
--      
--      div := to_float(1);
--      
--      if pow = 0 then
--        exp := to_float(1);
--      else
--        exp := num;
--      end if;
--      
--      --calculate top of fraction
--      for i in 0 to pow-1 loop
--        exp := exp * num;
--      end loop;
--      
--      --calculate divisor
--      for i in pow downto 1 loop
--        div := div * i;
--      end loop;
--      
--      done <= false;
--    end loop;
--  end process;
end architecture Behavioral;
