----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sam Skalicky
-- 
-- Create Date:    17:12:59 10/21/2009 
-- Design Name:    DSD Project 
-- Module Name:    Input - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity UserController is
    Port ( sw : in STD_LOGIC_VECTOR(7 downto 0);
           led : in STD_LOGIC_VECTOR(7 downto 0));
end UserController;

architecture Behavioral of UserController is
begin
  --mode select
  
  --display select
  process (sw(6))
    begin
      if sw(6) = 1 then
        led(0)<='0';
      	 led(3)<='0';
      	 led(4)<='0';
      	 led(5)<='0';
      	 led(6)<='0';
      	 led(7)<='0';
      	 if outputs <= "10110000" then
  				  led(1)<='1';
				  led(2)<='0';
			  else
				  led(1)<='0';
				  led(2)<='1';
			  end if;
      else
        led(0)<=outputs(0);
        led(1)<=outputs(1);
	      led(2)<=outputs(2);
      	 led(3)<=outputs(3);
      	 led(4)<=outputs(4);
      	 led(5)<=outputs(5);
      	 led(6)<=outputs(6);
      	 led(7)<=outputs(7);
      end if;
  end process;
  --training controls
  
  --inputs
  process(sw(1),sw(0))
    begin
      
  end process;
end Behavioral;