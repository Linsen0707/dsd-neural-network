----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Sam Skalicky
-- 
-- Create Date:    18:58:47 10/15/2009 
-- Design Name: 
-- Module Name:    Sigmoid - Test
-- Project Name: DSD Project- Neural Networks
-- Target Devices: Spartan 3E
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

entity TestSigmoid is
end TestSigmoid;

architecture Behavioral of TestSigmoid is
    
    component Sigmoid is
      Port ( X : in  signed(15 downto 0);
             Y : out  unsigned(7 downto 0));
    end component;
    
    component Sigmoid2 is
      Port ( X : in  signed(15 downto 0);
             Y : out  unsigned(7 downto 0):="00000000");
    end component;
    
    signal inputs : signed(15 downto 0):=to_signed(0,16);
    signal output : unsigned(7 downto 0):="00000000";
    signal value : Integer:=0;
    signal error : STD_LOGIC := '0';
    signal delay : Time := 10 ns;
    signal val : Integer;
    begin
        
    --Unit Under Test
        UUT: Sigmoid2
           port map(inputs,output);
         
        process
        begin                 
    --testing procedure
           --loop through all input
           for i in -7 to 7 loop
              val<=i;
              inputs<=to_signed(i,8)&"00000000";
              wait for delay; 
           end loop;
       end process;
end Behavioral;