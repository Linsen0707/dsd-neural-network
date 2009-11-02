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
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sigmoid is
    Port ( X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0));
end Sigmoid;

architecture Behavioral of Sigmoid is
  type array16 is array(6 downto 0) of signed(15 downto 0);
  type array32 is array(6 downto 0) of signed(31 downto 0);
	signal slope : array16;
	signal intercept : array32;
	signal inval : integer;
	signal temp : signed(31 downto 0);
	
begin
  slope(0) <= to_signed(0,16);
  slope(1) <= to_signed(5,16);
  slope(2) <= to_signed(26,16);
  slope(3) <= to_signed(64,16);
  slope(4) <= to_signed(26,16);
  slope(5) <= to_signed(5,16);
  slope(6) <= to_signed(0,16);

  intercept(0) <= to_signed(0,24) & "00000000";
  intercept(1) <= to_signed(27,24) & "00000000";
  intercept(2) <= to_signed(90,24) & "00000000";
  intercept(3) <= to_signed(128,24) & "00000000";
  intercept(4) <= to_signed(166,24) & "00000000";
  intercept(5) <= to_signed(230,24) & "00000000";
  intercept(6) <= to_signed(255,24) & "00000000";
  
  Y <= unsigned(temp(15 downto 8));
	   	    
	process (X)
  	variable w : signed(7 downto 0);
	begin
    w := X(15 downto 8);
    inval<=to_integer(w);
		if w <= to_signed(-5,8) then
		   temp<=slope(0)*X+intercept(0);
	   end if;
		
		if w <= to_signed(-3,8) and w > to_signed(-5,8) then
		   temp<=slope(1)*X+intercept(1);		
	   end if;
		
		if w <= to_signed(-1,8) and w > to_signed(-3,8) then
		   temp<=slope(2)*X+intercept(2);
	   end if;
		
		if w < to_signed(1,8) and w >= to_signed(-1,8) then
		   temp<=slope(3)*X+intercept(3);
	   end if;

		if w < to_signed(3,8) and w >= to_signed(1,8) then
		   temp<=slope(4)*X+intercept(4);
	   end if;
	   
  		if w < to_signed(5,8) and w >= to_signed(3,8) then
		   temp<=slope(5)*X+intercept(5);
	   end if;
	   	
		if w >= to_signed(5,8) then
		   temp<=slope(6)*X+intercept(6);
	  end if;	  
	  
	end process;
	
end Behavioral;
