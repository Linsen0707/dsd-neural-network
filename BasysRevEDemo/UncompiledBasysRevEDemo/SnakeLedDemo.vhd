------------------------------------------------------------------------
-- Company: Digilent
-- Engineer: Mircea Dabacan
--
-- Create Date: 12:36:33 12/06/05
-- Design Name: Nexys board SnakeLedDemo
-- Module Name: SnakeLedDemo - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SnakeLedDemo is
  Port (ck:  in  std_logic;
        btn: in  std_logic_vector(3 downto 0);
        sw:  in  std_logic_vector(7 downto 0);
        led: out std_logic_vector(7 downto 0);
        seg: out std_logic_vector(6 downto 0);
        dp:  out std_logic;
        an:  out std_logic_vector(3 downto 0));
end SnakeLedDemo;

architecture Behavioral of SnakeLedDemo is

signal cntDiv: std_logic_vector(25 downto 0); -- general clock div/cnt
alias cntDisp: std_logic_vector(1 downto 0) is cntDiv(16 downto 15);
   -- a fragment of cntDiv used for 7 seg display control:
   -- cntDisp counts 50MHz/2^15 ~ 1525Hz

type typeIntArray is array(7 downto 0) of integer range 0 to 255;
   -- Intensity for each LED: 0 = off, 255 = full on.
signal cmpPwm: typeIntArray:=(0,0,0,0,0,0,0,0);
   -- reference values for PWM
constant ckPwmRange: integer:= 9; --50MHz/512 ~ 92KHz
   -- LSB in the cntPwm alias of cntDiv
alias cntPwm: std_logic_vector(7 downto 0) is 
                    cntDiv(7+ckPwmRange downto ckPwmRange);
   -- a fragment of cntDiv used for PW Modulator:
   -- cntPwm counts 50MHz/2^ckPwmRange
alias ckFade: std_logic is cntDiv(17);-- LED fading ck:50MHz/2^18~191Hz
--alias ckSnake: std_logic is cntDiv(23);-- snake move ck:50MHz/2^24=3Hz
--alias ckSnake: std_logic is cntDiv(22);-- snake move ck:50MHz/2^23=6Hz
alias ckSnake: std_logic is cntDiv(21);-- snake move ck:50MHz/2^22=12Hz

type vertebra is array (0 to 1) of integer;
   -- represents the position of a sanke vertebra on the 7-seg display:
   -- index 0: digit
   -- index 1: segment

type typeSnake is array(0 to 6) of vertebra;
   -- the snake consists of 7 vertebras (index 0 = the head)
constant initSnake: typeSnake:=
      ((2,6),(2,2),(2,3),(2,4),(2,5),(2,0),(2,1));
   -- snake twisted on digit 2, left headed
signal Snake: typeSnake:=initSnake; 
signal NextSnake: typeSnake:=initSnake; 

signal Target: integer range 0 to 3 := 2;
signal NextTarget: integer range 0 to 3 := 2;
type typeDirection is (left, right);
signal Direction: typeDirection; 
signal segPwm: std_logic_vector(7 downto 0); 


begin
  ckDivider: process(ck)
  begin
    if ck'event and ck='1' then
      cntDiv <= cntDiv + '1';
    end if;
  end process;

  Fadder: process(ckFade)
  begin
    for i in 0 to 7 loop                 -- for each LED
      if ckFade'event and ckFade='1' then-- 
        if sw(i) = '1' and               -- coresponding switch ON
           cmpPwm(i) /= 255 then         -- not yet full intensity
          cmpPwm(i) <= cmpPwm(i)+1;      -- increasing intensity
        elsif sw(i) = '0' and            -- coresponding switch OFF
              cmpPwm(i) /= 0 then        -- not yet full dark
          cmpPwm(i) <= cmpPwm(i)-1;      -- decreasing intensity
        end if;
      end if;
    end loop;
  end process;

  PWM: process(cntPwm, cmpPwm)
  begin
    for i in 0 to 7 loop         -- for each LED
      if cntPwm < cmpPwm(i) then -- counter value less than reference
        Led(i) <= '1';           -- LED ON
      else                       -- counter value greater than reference
        Led(i) <= '0';           -- LED ON
      end if;
    end loop;
  end process;

  NextTargetSet: process(ckSnake)-- set Nexttarget for snake 
  begin
    if ckSnake'event and ckSnake = '1' then
      if    btn(3) = '1' then NextTarget <= 3;
      elsif btn(2) = '1' then NextTarget <= 2;
      elsif btn(1) = '1' then NextTarget <= 1;
      elsif btn(0) = '1' then NextTarget <= 0;
      end if;
    end if;
  end process;

  TargetSet: process(ckSnake)
  begin
    if ckSnake'event and ckSnake = '1' then
      if Snake(0) = (Target, 6)   then -- already at target
        Target <= NextTarget;
        if NextTarget > Target then
          Direction <= left;
        elsif NextTarget < Target then
          Direction <= right;
        end if;
      end if;
    end if;
  end process;


  SnakeStateMashine: process(ckSnake)
  begin
    if ckSnake'event and ckSnake = '1' then
      Snake <= NextSnake;
    end if;
  end process;

  NextSnakeLogic: process(Snake, btn)
  begin
    if Snake(0) = (Target, 6)   then -- already at target
      if NextTarget>Target then
        NextSnake <= ((Target,6),(Target,1),(Target,0),(Target,5),(Target,4),(Target,3),(Target,2));   -- spinning to left
      elsif NextTarget<Target then
        NextSnake <= ((Target,6),(Target,5),(Target,0),(Target,1),(Target,2),(Target,3),(Target,4));   -- spinning to left
      else
        NextSnake <= Snake;   -- resting
      end if;
    else  -- snake moving
      NextSnake(1 to 6) <= Snake(0 to 5); 
      if Direction = left then-- snake moving left
        if Snake(0) = (Target-3,6)   then -- running to left
          NextSnake(0) <= (target-2,6);
        elsif Snake(0) = (Target-2,6)   then -- running to left
          NextSnake(0) <= (target-1,6);
        elsif Snake(0) = (Target-1,6)   then -- next right to target
          NextSnake(0) <= (target,2);
        elsif Snake(0) = (Target,2)   then -- roling in target digit
          NextSnake(0) <= (target,3);
        elsif Snake(0) = (Target,3)   then -- roling in target digit
          NextSnake(0) <= (target,4);
        elsif Snake(0) = (Target,4)   then -- roling in target digit
          NextSnake(0) <= (target,5);
        elsif Snake(0) = (Target,5)   then -- roling in target digit
          NextSnake(0) <= (target,0);
        elsif Snake(0) = (Target,0)   then -- roling in target digit
          NextSnake(0) <= (target,1);
        elsif Snake(0) = (Target,1)   then -- roling in target digit
          NextSnake(0) <= (target,6);
        end if;
      else -- snake moving right
        if Snake(0) = (Target+3, 6)   then -- running to left
          NextSnake(0) <= (target+2,6);
        elsif Snake(0) = (Target+2,6)   then -- running to left
          NextSnake(0) <= (target+1,6);
        elsif Snake(0) = (Target+1,6)   then -- next right to target
          NextSnake(0) <= (target,4);
        elsif Snake(0) = (Target,4)   then -- roling in target digit
          NextSnake(0) <= (target,3);
        elsif Snake(0) = (Target,3)   then -- roling in target digit
          NextSnake(0) <= (target,2);
        elsif Snake(0) = (Target,2)   then -- roling in target digit
          NextSnake(0) <= (target,1);
        elsif Snake(0) = (Target,1)   then -- roling in target digit
          NextSnake(0) <= (target,0);
        elsif Snake(0) = (Target,0)   then -- roling in target digit
          NextSnake(0) <= (target,5);
        elsif Snake(0) = (Target,5)   then -- roling in target digit
          NextSnake(0) <= (target,6);
        end if;
      end if;
    end if;
  end process;


anodeCtrl:process(cntDisp, Snake)
  begin  
      an <= "1111";
    if Snake(0) = (Target, 6) then
      an(Target) <= '0';
    elsif cntDisp ="00" then
      an <= "1110";
    elsif cntDisp ="01" then
      an <= "1101";
    elsif cntDisp ="10" then
      an <= "1011";
    else
      an <= "0111";
    end if;
  end process;

SegAssignment: process(cntDisp, Snake)
  begin
          seg <= "1111111";
      for k in 0 to 6 loop
    for i in 0 to 6 loop
        if --j = conv_integer(cntDisp) and -- current 7seg digit
           Snake(i) = (conv_integer(cntDisp),k)then     -- segments ON on j digit
--          seg(k) <= '0';   -- segment ON
          seg(k) <= segPwm(i);   -- segment ON
--        else
        end if;

        if target = conv_integer(cntDisp) then -- current 7seg digit
          dp <= '0';   -- segment ON
        else
          dp <= '1';
        end if;

      end loop;
     end loop;
--  end loop;
  end process;

  segPwm(0) <= '0';
  segPwm(1) <= cntDiv(ckPwmRange) and cntDiv(ckPwmRange+1);
  segPwm(2) <= cntDiv(ckPwmRange) ;
  segPwm(3) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1);
  segPwm(4) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2);
  segPwm(5) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2) or cntDiv(ckPwmRange+3);
  segPwm(6) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2) or cntDiv(ckPwmRange+3) or cntDiv(ckPwmRange+4);

end Behavioral;
         