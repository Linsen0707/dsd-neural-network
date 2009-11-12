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
    Port (inputs : in std_logic_vector( 1 downto 0 );     --input values from switches
          mode : in boolean;
          output : out unsigned( 7 downto 0 ));   --output result for LEDs
end Controller;

architecture Behavioral of Controller is

  component Network_Testbench is
    Port (	testa : in  unsigned (7 downto 0);         --input value 0
				testb : in  unsigned (7 downto 0);            --input value 1
				classification : out  unsigned (7 downto 0));                      --mode selection
  end component;
  
  component Input is
		Port ( Input : in  STD_LOGIC;                 --input node 
           Output : out  unsigned (7 downto 0));  --output vector (8 bit decimal)
	end component;
	
	component ErrorCalc is
      Port ( inputs : in std_logic_vector (1 downto 0);   --inputs from switches
             result : in unsigned (7 downto 0);   --result from network
             error : out signed (15 downto 0));           --result of error calculation (output)
  end component;
  
  component Trainer is
   Port (a : out unsigned (7 downto 0);
         b : out unsigned (7 downto 0);
         x : in unsigned (7 downto 0);
         e : out signed (15 downto 0);
         mode : out boolean;
         train : in boolean);
  end component;

  type conlevel is array(1 downto 0) of unsigned(7 downto 0);
  signal netInputs,changed,trainputs : conlevel;
  signal error : signed(15 downto 0);
  signal result : unsigned(7 downto 0);
  signal startTrain,modeSig0,modeSig1 : boolean:=false;
begin
  
  --instantiate components
  in1: Input
		port map(inputs(0),changed(0));
		
	in2: Input
		port map(inputs(1),changed(1));
		
	net: Network_Testbench
	  port map(changed(0),changed(1),result);
	  
	  output <= result;
	  
end Behavioral;          