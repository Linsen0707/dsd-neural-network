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
    Port (	testa : in  unsigned (7 downto 0);         --input value 0
				testb : in  unsigned (7 downto 0);            --input value 1
				classification : out  unsigned (7 downto 0);  --result from network
				lasterror : in signed(15 downto 0);           --error from last calculation
				learnmode : in boolean);                      --mode selection
end Network;

architecture Behavioral of Network is

	component Neuron
    Port (learnmode : in boolean;
       ia : in signed(15 downto 0);
       ib : in signed(15 downto 0);
       ic : in signed(15 downto 0);
       ea : in signed(15 downto 0);
       eb : in signed(15 downto 0);
       ec : in signed(15 downto 0);
       outerror : out signed(15 downto 0);  
       outvalue : out unsigned(7 downto 0) );
	end component;
	
	component Connection
    Port ( learnmode : in boolean;
         iv : in unsigned(7 downto 0);
         ov : out signed(15 downto 0);
         ie : in signed(15 downto 0);
         oe : out signed(15 downto 0); 
         iw : in signed(15 downto 0));
	end component;
	
	type prelevel is array(2 downto 0) of unsigned (7 downto 0);
	type postlevel is array(2 downto 0) of signed (15 downto 0);
	signal a : postlevel;
	signal b : postlevel;
	signal j : prelevel;
	signal k : postlevel;
	signal einputa : postlevel;
	signal einputb : postlevel;
	signal ei : postlevel;
	signal ej : postlevel;
	signal ek : signed(15 downto 0);
begin
	wij00: Connection
		port map(learnmode, testa, a(0), ei(0), einputa(0), iw=>"0000000011010111");
		
	wij01: Connection
		port map(learnmode, testa, a(1), ei(1), einputa(1), iw=>"0000000001100100");
	
	wij02: Connection
		port map(learnmode, testa, a(2), ei(2), einputa(2), iw=>"0000000011001000");
		  
		    
	wij10: Connection
		port map(learnmode, testb, b(0), ei(0), einputb(0), iw=>"0000000011001100");
		
	wij11: Connection
		port map(learnmode, testb, b(1), ei(1), einputb(1), iw=>"0000000011101001");
	
	wij12: Connection
		port map(learnmode, testb, b(2), ei(2), einputb(2), iw=>"0000000000110010");

	j1: Neuron
		port map(learnmode, a(0), b(0), "0000000100000000", ej(0), "0000000000000000", "0000000000000000", ei(0), j(0));
		
	j2: Neuron
		port map(learnmode, a(1), b(1), "0000000100000000", ej(1), "0000000000000000", "0000000000000000", ei(1), j(1));

	j3: Neuron
		port map(learnmode, a(2), b(2), "0000000100000000", ej(2), "0000000000000000", "0000000000000000", ei(2), j(2));
		
		    
		
	wjk0: Connection
		port map(learnmode, j(0), k(0), ek, ej(0), iw=>"0000000001010101");
	
	wjk1: Connection
		port map(learnmode, j(1), k(1), ek, ej(1), iw=>"0000000011000100");
		
	wjk2: Connection
		port map(learnmode, j(2), k(2), ek, ej(2), iw=>"0000000001000111");
		
	final: Neuron
		port map(learnmode, k(0), k(1), k(2), lasterror, "0000000000000000", "0000000000000000", ek, classification);

end Behavioral;

