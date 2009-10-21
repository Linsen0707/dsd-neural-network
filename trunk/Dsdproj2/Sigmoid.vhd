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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sigmoid is
    Port ( X : in  STD_LOGIC_VECTOR(15 downto 0);
           Y : out  STD_LOGIC_VECTOR(7 downto 0));
end Sigmoid;

architecture Behavioral of Sigmoid is
	type myArray is array(8 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal dat : myArray;
begin

	dat(0)<="00000000";	--F[-6]=0
	dat(1)<="00000010";  --F[-4]=.02
	dat(2)<="00001111";	--F[-2]=.12
	dat(3)<="00100010";	--F[-1]=.27
	dat(4)<="01000000";	--F[0]=.5
	dat(5)<="01011101";	--F[1]=.73		
	dat(6)<="01110000";	--F[2]=.88
	dat(7)<="01111101";	--F[4]=.98
	dat(8)<="01111111";	--F[6]=1

	process (X)
	begin
		if X >= "10000110"&"00000000" then	--x < -6
			Y<=dat(0);
		else
			if X >= "10000100"&"00000000" then	--x < -4
				Y<=dat(1);
			else
				if X >= "10000010"&"00000000" then	--x< -2
					Y<=dat(2);
				else
					if X >= "10000001"&"00000000" then --x< -1
						Y<=dat(3);
					else
						if X >= "00000110"&"00000000" then --x>6
							Y<=dat(8);
						else
							if X >= "00000100"&"00000000" then --x<4
								Y<=dat(7);
							else
								if X >= "00000010"&"00000000" then --x>2
									Y<=dat(6);
								else
									if X >= "00000001"&"00000000" then --x>=1
										Y<=dat(5);
									else                   --x<0
										Y<=dat(4);
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;
