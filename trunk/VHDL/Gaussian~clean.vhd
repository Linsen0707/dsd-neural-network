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
  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.all;

library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

entity Gaussian is
    Port ( X : in signed(15 downto 0):="0000000000000000";
           Y : out  unsigned(7 downto 0):="00000000");
end Gaussian;

architecture Behavioral of Gaussian is
  signal num,val : float32:=to_float(0);
  signal numReal,valReal,xReal : real;
  signal done : Boolean:=true;
  constant exp : float32:=to_float(2.7182818284590452353602874713);
  signal loop_count : Integer;
  signal valS : signed(31 downto 0);
  signal valU : unsigned(31 downto 0);
begin
  valReal <= to_real(val);
  process (X)
    variable tmp,xin,prev,result,converge,exp,div : float32;
    variable pow : Integer;
    variable mline : line;
  begin
    --convert x to float
    num <= to_float(X) / to_float(256);
    numReal <= to_real(to_float(X) / to_float(256));

    --setup default values
    xin := to_float(X) / 256;
    converge := to_float(0.01);
    pow := 0;
    prev := to_float(0);
    result := to_float(1);
    
    while abs((prev-result)/result) > converge loop
          div := to_float(1);
      write(mline,string'("pow = "));
      write(mline,pow);
      writeline(output,mline);
      if pow = 0 then
        exp := to_float(1);
      else
        exp := xin;
      end if;
      write(mline,string'("exp = "));
      write(mline,to_real(exp));
      writeline(output,mline);
      write(mline,string'("xin = "));
      write(mline,to_real(xin));
      writeline(output,mline);
      --calculate top of frac
      for i in 0 to pow-2 loop
        exp := exp * xin;
      end loop;
      write(mline,string'("exp = "));
      write(mline,to_real(exp));
      writeline(output,mline);
      --calculate divisor
      for i in pow downto 1 loop
        div := div * i;
      end loop;
      write(mline,string'("div = "));
      write(mline,to_real(div));
      writeline(output,mline);
      --sum
      if pow = 0 then
        result := exp/div;
        prev := to_float(0);
      else
        prev := result;
        result := result + exp/div;
      end if;
      write(mline,string'("result = "));
      write(mline, to_real(result));
      writeline(output,mline);
      write(mline,string'("----------------------------------"));
      writeline(output,mline);
      pow := pow + 1; 
    end loop;
    val <= (result/((1+result)*(1+result)));
    write(mline,string'("final = "));
    write(mline,to_real(val));
    writeline(output,mline);
    write(mline,string'("----------------------------------"));
      writeline(output,mline);
      write(mline,string'("----------------------------------"));
      writeline(output,mline);
    loop_count <= pow;
  end process;
  Y <= to_unsigned((val*256),8);
end architecture Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.all;

library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

entity TestGaussian is
end TestGaussian;

architecture Behavioral of TestGaussian is

  component Gaussian is
    Port ( X : in signed(15 downto 0);
           Y : out  unsigned(7 downto 0):="00000000");
  end component;

  signal Xin : signed(15 downto 0):="0000000000000000";
  signal Yout : unsigned(7 downto 0);

begin
  Gaus: Gaussian port map( Xin, Yout);
    
  process
  begin
    for i in -6 to 6 loop
      Xin <= to_signed(i,8)&"00000000";
      wait for 20 ns;
    end loop;
  end process;
end Behavioral;