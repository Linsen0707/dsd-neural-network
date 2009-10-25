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
           Y : out  unsigned(7 downto 0):="00000000");
end Sigmoid;

architecture Behavioral of Sigmoid is
	type myArray is array(8 downto 0) of unsigned(7 downto 0);
	signal dat : myArray;
	signal compare : signed(7 downto 0);
	signal w : signed(7 downto 0);
	signal inval : integer;
begin
	dat(0)<="00000000";	--F[-6]=0
	dat(1)<="00000100";  --F[-4]=.02
	dat(2)<="00011110";	--F[-2]=.12
	dat(3)<="01000100";	--F[-1]=.27
	dat(4)<="10000000";	--F[0]=.5
	dat(5)<="10111010";	--F[1]=.73		
	dat(6)<="11100000";	--F[2]=.88
	dat(7)<="11111011";	--F[4]=.98
	dat(8)<="11111111";	--F[6]=1


   w <= X(15 downto 8);
   inval<=to_integer(w);
	   	    
	process (w)
	begin
		if w <= to_signed(-6,8) then
		   Y<=dat(0);
	   end if;
		
		if w <= to_signed(-4,8) and w > to_signed(-6,8) then
			Y<=dat(1);
	   end if;
		
		if w <= to_signed(-2,8) and w > to_signed(-4,8) then
			Y<=dat(2);
	   end if;
		
		if w <= to_signed(-1,8) and w > to_signed(-2,8) then
			Y<=dat(3);
	   end if;
		
		if w < to_signed(1,8) and w >= to_signed(-1,8) then
			Y<=dat(4);
	   end if;

		if w < to_signed(2,8) and w >= to_signed(1,8) then
			Y<=dat(5);
	   end if;
	   
  		if w < to_signed(4,8) and w >= to_signed(2,8) then
			Y<=dat(6);
	   end if;
	   	
	   if w < to_signed(6,8) and w >= to_signed(4,8) then
			Y<=dat(7);
	   end if;
	   
		if w >= to_signed(6,8) then
			Y<=dat(8);
	   end if;	  
	    
	end process;
end Behavioral;
