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
entity TestSigGen is
  Port ( x : out signed(15 downto 0);
         v : out Integer);
end TestSigGen;

architecture B of TestSigGen is
  begin
    process
      variable msb : std_logic;
    begin                 
--testing procedure
     --loop through all input
       for i in -16 to 16 loop
          v <= i / 4;
          msb := to_signed(i,8)(7);
          x <= msb&msb&to_signed(i,8)&"000000";
         wait for 10 ns; 
       end loop;
     end process;
end B;


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
    component TestSigGen is
        Port ( x : out signed(15 downto 0);
         v : out Integer);
  end component;
    
    signal inputs : signed(15 downto 0);
    signal output1 : unsigned(7 downto 0);
    signal val : Integer;
    begin
        
    --Unit Under Test
        UUT1: Sigmoid
           port map(inputs,output1);
         
         Gen: TestSigGen
          port map(inputs, val);

end Behavioral;