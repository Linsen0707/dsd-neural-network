----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Sam Skalicky
-- 
-- Create Date:    18:37:53 10/15/2009 
-- Design Name: 
-- Module Name:    Input - Behavioral 
-- Project Name: Neural Network
-- Target Devices: Spartan3E
-- Tool versions: 
-- Description: basic input node to network
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

entity Input is
    Port ( dataIn : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (3 downto 0));
end Input;

architecture Behavioral of Input is
	signal data : STD_LOGIC;
begin
	data<=dataIn;
	dataSet: process
		begin
			for J in dataOut'range loop
				dataOut(J)<=data;
			end loop;
	end process dataSet;
end Behavioral;

