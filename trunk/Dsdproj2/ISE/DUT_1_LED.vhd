----------------------------------------------------------------------------------
-- Company: 	RIT
-- Engineer: 	Sam Skalicky
-- 
-- Create Date:    17:28:15 10/21/2009 
-- Design Name: 	 DSD Project
-- Module Name:    DUT - Behavioral 
-- Project Name: 	 DSD Project
-- Target Devices: Spartan 3E-100
-- Tool versions: 
-- Description: 	This module is the intial integration test of the neural network, displaying 2 led values for high/low
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DUT_1_LED is
	Port( sw : in STD_LOGIC_VECTOR(1 downto 0);
			led : out STD_LOGIC_VECTOR(7 downto 0));
end DUT_1_LED;

architecture Behavioral of DUT_1_LED is

	component Input is
		Port ( Input : in  STD_LOGIC;
           Output : out  unsigned (7 downto 0));
	end component;

	component Network is
		Port ( testa : in  unsigned (7 downto 0);
				testb : in  unsigned (7 downto 0);
				classification : out  unsigned (7 downto 0));
	end component;

	type conlevel is array(1 downto 0) of unsigned(7 downto 0);
	signal inputs : conlevel;
	signal outputs : unsigned(7 downto 0);
	
begin

	in1: Input
		port map(sw(0),inputs(0));
		
	in2: Input
		port map(sw(1),inputs(1));

	net: Network
		port map(inputs(0),inputs(1),outputs);
		
		led(0)<='0';
		led(3)<='0';
		led(4)<='0';
		led(5)<='0';
		led(6)<='0';
		led(7)<='0';
		process(outputs)
		begin
			if outputs <= "10110000" then
				led(1)<='1';
				led(2)<='0';
			else
				led(1)<='0';
				led(2)<='1';
			end if;
		end process;
end Behavioral;

