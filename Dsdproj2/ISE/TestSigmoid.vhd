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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TestSigmoid is
end TestSigmoid;

architecture Behavioral of TestSigmoid is
    
    component Sigmoid is
       Port ( X : in  STD_LOGIC_VECTOR(15 downto 0);
           Y : out  STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal inputs : STD_LOGIC_VECTOR(15 downto 0):="0000000000000001";
    signal output : STD_LOGIC_VECTOR(7 downto 0);
    signal error : STD_LOGIC := '0';
    signal delay : Time := 10ns;
    begin
        
    --Unit Under Test
        UUT: Sigmoid
           port map(inputs,output);
         
        process
        begin                 
    --testing procedure
           --loop through all input
           inputs<="0000000000000000";
           wait for delay;
           if output < "01000000" then
           else
               error<= '1';
           end if;
           for i in 65535 downto 0 loop
              inputs<=inputs + "0000000000000001";
              wait for delay;
           end loop;
       end process;
end Behavioral;