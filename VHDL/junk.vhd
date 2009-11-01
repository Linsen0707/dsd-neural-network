library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

Entity junk is
  port ( X : in real);
end junk;

architecture behav of junk is 
  signal uval : unsigned (7 downto 0);
  signal fval : float32;
begin
  fval <= to_float(X);
  uval <= to_unsigned(fval*128,8);
  
end behav;