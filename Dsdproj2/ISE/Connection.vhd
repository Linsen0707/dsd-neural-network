----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:49 10/19/2009 
-- Design Name: 
-- Module Name:    Connection - Behavioral 
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

entity Connection is
    Port ( learnmode : in boolean;
           iv : in unsigned(7 downto 0);
           ov : out signed(15 downto 0);
           ie : in signed(15 downto 0);
           oe : out signed(15 downto 0);
           iw : in signed(15 downto 0));
end Connection;

architecture Behavioral of Connection is

signal w : signed(15 downto 0);
signal trained : boolean := false;

begin
  
  trained <= trained or learnmode;
  process(iv, ie)
    variable inter : signed(31 downto 0);
  begin
    case learnmode is
    when false => 
      if (not trained) then w <= iw; end if;
      inter := (signed("00000000" & iv) * w);
      ov <= inter(23 downto 8);
    when true =>
      inter := ie * w;
      oe <= inter(23 downto 8);
      inter := (ie * signed("00000000" & iv));
      w <= w + inter(24 downto 9);
    end case;
  end process;
	
end Behavioral;
