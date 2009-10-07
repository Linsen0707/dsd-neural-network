----------------------------------------------------------------------------------
-- Company:     Digilent Ro
-- Engineer:    Mircea DAbacan
-- 
-- Create Date:    10:45:59 11/18/2006 
-- Design Name: 
-- Module Name:    ckMux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:     Divides ck0 by 2
--                  slects ckOut to be:
--                      - ck0/2 when sel = '0'
--                      - ck1   when sel = '1'
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

library UNISIM;
use UNISIM.VComponents.all;

entity ckMux is
    Port ( ck0 : in  STD_LOGIC;
           ck1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           ckOut : out  STD_LOGIC);
end ckMux;

architecture Behavioral of ckMux is

signal ck0Div2: STD_LOGIC;

begin

   BUFGMUX_inst : BUFGMUX
   port map (
      O => ckOut,    -- Clock MUX output
      I0 => ck0Div2,  -- Clock0 input
      I1 => ck1,  -- Clock1 input
      S => sel     -- Clock select input
   );

  div2: process(ck0)
  begin
    if ck0'event and ck0 = '1' then
	   ck0Div2 <= not ck0Div2; 
    end if;
  end process;	 

end Behavioral;

