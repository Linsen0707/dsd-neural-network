----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Alex Karantza
-- 
-- Create Date:    17:59:52 10/19/2009 
-- Design Name: 	 DSD Project
-- Module Name:    Connection - Behavioral 
-- Project Name:   DSD Project
-- Target Devices: Spartan 3e-100
-- Tool versions: 
-- Description:    Modulates an input signal by an internal weight, and can
--                 modify that internal weight based on an error signal
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

entity Connection is
    Port ( learnmode : in boolean;        -- Training or using
           iv : in unsigned(7 downto 0);  -- Input signal
           ov : out signed(15 downto 0);  -- Output signal
           ie : in signed(15 downto 0);   -- Input error
           oe : out signed(15 downto 0);  -- Output error
           iw : in signed(15 downto 0));  -- Original weight
end Connection;

architecture Behavioral of Connection is

  -- Internal weight
  signal w : signed(15 downto 0);
  -- Use the internal weight, or the input weight?
  signal trained : boolean := false;

begin
  -- Use our trained weight after the first training session
  trained <= trained or learnmode;
  process(iv, ie)
	 -- Intermediate used in 16 bit multiplication
    variable inter : signed(31 downto 0);
	 -- The new weight to calculate
    variable nw : signed(15 downto 0);
  begin
    case learnmode is
    when false => -- Not being trained
      if (not trained) then 
        nw := iw; -- Use input weight
      else
        nw := w;  -- Use internal weight
      end if;
      inter := (signed("00000000" & iv) * nw); -- Modulate the signal
      ov <= inter(23 downto 8); -- Crop out the requisite bits from the multiplication
      w <= nw; -- Set up the new stored weight
    when true =>
      inter := ie * w; -- Modulate the error signal
      oe <= inter(23 downto 8); -- Crop out the right bits
      inter := (ie * signed("00000000" & iv)); -- Find the adjustment factor
      w <= w + inter(24 downto 9); -- Adjust the stored weight by 1/2 of the adjustment factor
    end case;
  end process;
	
end Behavioral;
