----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:52 10/19/2009 
-- Design Name: 
-- Module Name:    Network - Behavioral 
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

entity Network is
    Port (	testa : in  unsigned (7 downto 0);
				testb : in  unsigned (7 downto 0);
				classification : out  unsigned (7 downto 0));
end Network;

architecture Behavioral of Network is

	component Neuron
		Port (a : in signed(15 downto 0);
				b : in signed(15 downto 0);
				c : in signed(15 downto 0);
				outsignal : out unsigned(7 downto 0) );
	end component;
	
	component Connection
		Port (i : in  unsigned (7 downto 0);
				o : out  signed (15 downto 0);
				w : in signed (15 downto 0));
	end component;
	
	type prelevel is array(2 downto 0) of unsigned (7 downto 0);
	type postlevel is array(2 downto 0) of signed (15 downto 0);
	signal a : postlevel;
	signal b : postlevel;
	signal j : prelevel;
	signal k : postlevel;
	
begin
	wij00: Connection
		port map(testa, a(0), "1111110110001101");
		
	wij01: Connection
		port map(testa, a(1), "0000010011100000");
	
	wij02: Connection
		port map(testa, a(2), "0000010011001000");
		  
		    
	wij10: Connection
		port map(testb, b(0), "0000010011010111");
		
	wij11: Connection
		port map(testb, b(1), "0000010011001111");
	
	wij12: Connection
		port map(testb, b(2), "1111110110010101");

	j1: Neuron
		port map(a(0), b(0), "0000000000000000", j(0));
		
	j2: Neuron
		port map(a(1), b(1), "0000000000000000", j(1));

	j3: Neuron
		port map(a(2), b(2), "0000000000000000", j(2));
		
		    
		
	wjk0: Connection
		port map(j(0), k(0), "1111100111100000");
	
	wjk1: Connection
		port map(j(1), k(1), "0000100011001001");
		
	wjk2: Connection
		port map(j(2), k(2), "1111100111011010");
		
	final: Neuron
		port map(k(0), k(1), k(2), classification);

end Behavioral;

