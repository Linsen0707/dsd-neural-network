------------------------------------------------------------------------
--  synchro.vhd -- Ritzi Pitzi game MAIN VHDL file
------------------------------------------------------------------------
--  Author : Mircea Dabacan
--           Copyright 2005 Digilent, Inc.
------------------------------------------------------------------------
-- This is the source file for the synchro component, 
-- provided by the Digilent Reference Component Library.

------------------------------------------------------------------------
-- Revision History:
--	15/01/2005(MirceaD): created
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Synchro is

    port (
		ck25MHz: in std_logic;			-- ck 25MHz
		HS: out std_logic;					-- horizontal synchro signal					
		VS: out std_logic;					-- verical synchro signal 
		Hcnt: out std_logic_vector (9 downto 0); -- horizontal counter
		Vcnt: out std_logic_vector (9 downto 0)	 -- verical counter
		);
end Synchro;

architecture Behavioral of Synchro is
-- constants for Synchro module
constant HPW:integer:=96;		--Horizontal synchro Pulse Width (pixels)
constant HFP:integer:=16;		--Horizontal synchro Front Porch (pixels)
constant HBP:integer:=48;		--Horizontal synchro Back Porch (pixels)
constant VPW:integer:=2;		--Verical synchro Pulse Width (lines)
constant VFP:integer:=10;		--Verical synchro Front Porch (lines)
constant VBP:integer:=29;		--Verical synchro Back Porch (lines)
constant PAL:integer:=640;		--Pixels/Active Line (pixels)
constant LAF:integer:=480;		--Lines/Active Frame (lines)
-- constants for Synchro module (also used in FieldGen)
constant PLD: integer:=800;	--Pixel/Line Divider
constant LFD: integer:=521;	--Line/Frame Divider

signal intHcnt: integer range 0 to PLD-1; --PLD-1	-- horizontal counter
signal intVcnt: integer range 0 to LFD-1; -- LFD-1	-- verical counter


begin
syncro: process (ck25MHz)
begin

if ck25MHz'event and ck25MHz='1' then
	if intHcnt=PLD-1 then
		intHcnt<=0;
		if intVcnt=LFD-1 then intVcnt<=0;
		else intVcnt<=intVcnt+1;
		end if;
	else intHcnt<=intHcnt+1;
	end if;
	
	-- Generates HS - active low
	if intHcnt=PAL-1+HFP then 
		HS<='0';
	elsif intHcnt=PAL-1+HFP+HPW then 
		HS<='1';
	end if;

	-- Generates VS - active low
	if intVcnt=LAF-1+VFP then 
		VS<='0';
	elsif intVcnt=LAF-1+VFP+VPW then
		VS<='1';
	end if;
end if;
end process; 

-- mapping itnernal integers to std_logic_vector ports
  Hcnt <= conv_std_logic_vector(intHcnt,10);
  Vcnt <= conv_std_logic_vector(intVcnt,10);

end Behavioral;
