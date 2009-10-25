----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:15 10/21/2009 
-- Design Name: 
-- Module Name:    DUT - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DUT is
	Port( sw : in STD_LOGIC_VECTOR(1 downto 0);
			led : out STD_LOGIC_VECTOR(7 downto 0));
end DUT;

architecture Behavioral of DUT is

	component Input is
		Port ( Input : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	component Network is
		Port ( testa : in  STD_LOGIC_VECTOR (7 downto 0);
				testb : in  STD_LOGIC_VECTOR (7 downto 0);
				classification : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	type conlevel is array(1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal inputs : conlevel;
	signal outputs : STD_LOGIC_VECTOR(7 downto 0);
	
begin

	in1: Input
		port map(sw(0),inputs(0));
		
	in2: Input
		port map(sw(1),inputs(1));

	net: Network
		port map(inputs(0),inputs(1),outputs);
		
	--map outputs to leds
	led(0)<=outputs(0);
	led(1)<=outputs(1);
	led(2)<=outputs(2);
	led(3)<=outputs(3);
	led(4)<=outputs(4);
	led(5)<=outputs(5);
	led(6)<=outputs(6);
	led(7)<=outputs(7);

end Behavioral;

