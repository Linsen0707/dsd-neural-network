----------------------------------------------------------------------------------
-- Company: 	RIT
-- Engineer: 	Sam Skalicky
-- 
-- Create Date:    17:28:15 10/21/2009 
-- Design Name: 	 DSD Project
-- Module Name:    TestPlaySig - Behavioral 
-- Project Name: 	 DSD Project
-- Target Devices: Spartan 3E-100
-- Tool versions: 
-- Description: 	This module tests the PlaySig sigmoid modules
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

library floatfixlib;
use floatfixlib.float_pkg.ALL;
use floatfixlib.fixed_pkg.ALL;
use floatfixlib.math_utility_pkg.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestPlaySig is
end TestPlaySig;

architecture Behavioral of TestPlaySig is

  component PlaySig2 is
    Port ( X : in signed(15 downto 0);--X : in  signed(15 downto 0);
           Y : out  unsigned(7 downto 0):="00000000");
  end component;

  signal Xin : signed(15 downto 0):="0000000000000000";
  signal Yout : unsigned(7 downto 0);

begin
  Sig: PlaySig2 port map( Xin, Yout);
    
  process
  begin
    for i in -6 to 6 loop
      Xin <= to_signed(i,8)&"00000000";
      wait for 20 ns;
    end loop;
  end process;
end Behavioral;
