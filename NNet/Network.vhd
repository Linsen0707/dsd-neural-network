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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Network is
    Port (	testa : in  STD_LOGIC_VECTOR (7 downto 0);
				testb : in  STD_LOGIC_VECTOR (7 downto 0);
				classification : out  STD_LOGIC_VECTOR (7 downto 0));
end Network;

architecture Behavioral of Network is

	component Neuron
		Port (a : in STD_LOGIC_VECTOR(7 downto 0);
				b : in STD_LOGIC_VECTOR(7 downto 0);
				c : in STD_LOGIC_VECTOR(7 downto 0);
				outsignal : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;
	
	component Connection
		Port (i : in  STD_LOGIC_VECTOR (7 downto 0);
				o : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	type conlevel is array(2 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	signal presig : conlevel;
	signal postsig : conlevel;
	signal winsig : conlevel;
	
begin
	h1: Neuron
		port map(winsig(0), winsig(1), "00000000", presig(0));
		
	h2: Neuron
		port map(winsig(0), winsig(1), "00000000", presig(1));

	h3: Neuron
		port map(winsig(0), winsig(1), "00000000", presig(2));
		
	c11: Connection
		port map(testa, winsig(0));
		
	c12: Connection
		port map(testb, winsig(1));
		
	c21: Connection
		port map(presig(0), postsig(0));
	
	c22: Connection
		port map(presig(1), postsig(1));
		
	c23: Connection
		port map(presig(2), postsig(2));
		
	o: Neuron
		port map( postsig(0), postsig(1), postsig(2), classification);

end Behavioral;

