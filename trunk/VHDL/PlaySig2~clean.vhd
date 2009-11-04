--standard IEEE library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.all;

--standard floating point library, fixed from RIT
library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

--entity declaration
entity PlaySig2 is
    Port ( X : in signed(15 downto 0):="0000000000000000";  --input value, default is zero
           Y : out  unsigned(7 downto 0):="00000000");      --output value, default is zero
end PlaySig2;

--architecture declaration
architecture Behavioral of PlaySig2 is
--setup variables
  signal num,val : float32:=to_float(0);  --num=input value; val=output value from function
  signal numReal,valReal,xReal : real;    --real values of the floating point numbers, only for simulation & debug
  constant exp : float32:=to_float(2.7182818284590452353602874713); --value for Eueler constant
  signal loop_count : Integer;            --counter to cut out to prevent excessive looping
begin
  process (X)
    --setup temporary variables
    variable tmp,xin,prev,result,converge,exp,div : float32;
    variable pow : Integer;
    variable mline : line;
  begin
    --convert input to float
    num <= to_float(X) / to_float(256);
    numReal <= to_real(to_float(X) / to_float(256));  --setup real value for debug

    --setup default values
    xin := to_float(X) / 256;
    converge := to_float(0.01); --set the convergence factor
    pow := 0;
    prev := to_float(0);
    result := to_float(1);
    --loop until value converges compared to previous calculation
    while abs((prev-result)/result) > converge loop
      div := to_float(1);             --set divisor to 1
      --initial condition where exponent will be 1
      if pow = 0 then
        exp := to_float(1);
      else
        exp := xin;
      end if;
      --calculate top of frac
      for i in 0 to pow-2 loop
        exp := exp * xin;
      end loop;
      --calculate divisor
      for i in pow downto 1 loop
        div := div * i;
      end loop;
      --sum, take care of initial condition
      if pow = 0 then
        result := exp/div;
        prev := to_float(0);
      else
        prev := result;
        result := result + exp/div;
      end if;
      --increment
      pow := pow + 1; 
    end loop;
    --calculate sigmoid function
    val <= 1-(1/(1+result));
    loop_count <= pow;
  end process;
  --set result to output signal
  Y <= (to_unsigned((val*256),8));
end architecture Behavioral;
