----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sam Skalicky
-- 
-- Create Date:    17:12:59 10/21/2009 
-- Design Name:    DSD Project 
-- Module Name:    Controller - Behavioral 
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

Entity Controller is
    Port (inputs : in std_logic_vector( 1 downto 0 );
          output : out std_logic_vector( 7 downto 0 ));
end Controller;

architecture Behavioral of Controller is

  component Network is
    Port (	testa : in  unsigned (7 downto 0);
				testb : in  unsigned (7 downto 0);
				classification : out  unsigned (7 downto 0);
				lasterror : in signed(15 downto 0);
				learnmode : in boolean);
  end component;
  
  

  type conlevel is array(1 downto 0) of unsigned(7 downto 0);
  signal netInputs : conlevel
begin
  in1: Input
		port map(inputs(0),netInputs(0));
		
	in2: Input
		port map(inputs(1),netInputs(1));
		
end Behavioral;          