--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: L.33
--  \   \         Application: netgen
--  /   /         Filename: Neuron_synthesis.vhd
-- /___/   /\     Timestamp: Mon Oct 19 17:35:20 2009
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm Neuron -w -dir netgen/synthesis -ofmt vhdl -sim Neuron.ngc Neuron_synthesis.vhd 
-- Device	: xc3s100e-5-vq100
-- Input file	: Neuron.ngc
-- Output file	: /home/karantza/Desktop/dsd-nn/netgen/synthesis/Neuron_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: Neuron
-- Xilinx	: /opt/Xilinx/11.1/ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity Neuron is
  port (
    outsignal : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    b : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    c : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end Neuron;

architecture Structure of Neuron is
  signal N0 : STD_LOGIC; 
  signal c_0_IBUF_24 : STD_LOGIC; 
  signal c_1_IBUF_25 : STD_LOGIC; 
  signal c_2_IBUF_26 : STD_LOGIC; 
  signal c_3_IBUF_27 : STD_LOGIC; 
  signal c_4_IBUF_28 : STD_LOGIC; 
  signal c_5_IBUF_29 : STD_LOGIC; 
  signal c_6_IBUF_30 : STD_LOGIC; 
  signal c_7_IBUF_31 : STD_LOGIC; 
  signal outsignal_0_OBUF_40 : STD_LOGIC; 
  signal outsignal_1_OBUF_41 : STD_LOGIC; 
  signal outsignal_2_OBUF_42 : STD_LOGIC; 
  signal outsignal_3_OBUF_43 : STD_LOGIC; 
  signal outsignal_4_OBUF_44 : STD_LOGIC; 
  signal outsignal_5_OBUF_45 : STD_LOGIC; 
  signal outsignal_6_OBUF_46 : STD_LOGIC; 
  signal outsignal_7_OBUF_47 : STD_LOGIC; 
  signal Madd_sum_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal Madd_sum_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  Madd_sum_lut_0_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_0_OBUF_40,
      I1 => c_0_IBUF_24,
      O => Madd_sum_lut(0)
    );
  Madd_sum_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => outsignal_0_OBUF_40,
      S => Madd_sum_lut(0),
      O => Madd_sum_cy(0)
    );
  Madd_sum_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => Madd_sum_lut(0),
      O => outsignal_0_OBUF_40
    );
  Madd_sum_lut_1_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_1_OBUF_41,
      I1 => c_1_IBUF_25,
      O => Madd_sum_lut(1)
    );
  Madd_sum_cy_1_Q : MUXCY
    port map (
      CI => Madd_sum_cy(0),
      DI => outsignal_1_OBUF_41,
      S => Madd_sum_lut(1),
      O => Madd_sum_cy(1)
    );
  Madd_sum_xor_1_Q : XORCY
    port map (
      CI => Madd_sum_cy(0),
      LI => Madd_sum_lut(1),
      O => outsignal_1_OBUF_41
    );
  Madd_sum_lut_2_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_2_OBUF_42,
      I1 => c_2_IBUF_26,
      O => Madd_sum_lut(2)
    );
  Madd_sum_cy_2_Q : MUXCY
    port map (
      CI => Madd_sum_cy(1),
      DI => outsignal_2_OBUF_42,
      S => Madd_sum_lut(2),
      O => Madd_sum_cy(2)
    );
  Madd_sum_xor_2_Q : XORCY
    port map (
      CI => Madd_sum_cy(1),
      LI => Madd_sum_lut(2),
      O => outsignal_2_OBUF_42
    );
  Madd_sum_lut_3_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_3_OBUF_43,
      I1 => c_3_IBUF_27,
      O => Madd_sum_lut(3)
    );
  Madd_sum_cy_3_Q : MUXCY
    port map (
      CI => Madd_sum_cy(2),
      DI => outsignal_3_OBUF_43,
      S => Madd_sum_lut(3),
      O => Madd_sum_cy(3)
    );
  Madd_sum_xor_3_Q : XORCY
    port map (
      CI => Madd_sum_cy(2),
      LI => Madd_sum_lut(3),
      O => outsignal_3_OBUF_43
    );
  Madd_sum_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_4_OBUF_44,
      I1 => c_4_IBUF_28,
      O => Madd_sum_lut(4)
    );
  Madd_sum_cy_4_Q : MUXCY
    port map (
      CI => Madd_sum_cy(3),
      DI => outsignal_4_OBUF_44,
      S => Madd_sum_lut(4),
      O => Madd_sum_cy(4)
    );
  Madd_sum_xor_4_Q : XORCY
    port map (
      CI => Madd_sum_cy(3),
      LI => Madd_sum_lut(4),
      O => outsignal_4_OBUF_44
    );
  Madd_sum_lut_5_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_5_OBUF_45,
      I1 => c_5_IBUF_29,
      O => Madd_sum_lut(5)
    );
  Madd_sum_cy_5_Q : MUXCY
    port map (
      CI => Madd_sum_cy(4),
      DI => outsignal_5_OBUF_45,
      S => Madd_sum_lut(5),
      O => Madd_sum_cy(5)
    );
  Madd_sum_xor_5_Q : XORCY
    port map (
      CI => Madd_sum_cy(4),
      LI => Madd_sum_lut(5),
      O => outsignal_5_OBUF_45
    );
  Madd_sum_lut_6_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_6_OBUF_46,
      I1 => c_6_IBUF_30,
      O => Madd_sum_lut(6)
    );
  Madd_sum_cy_6_Q : MUXCY
    port map (
      CI => Madd_sum_cy(5),
      DI => outsignal_6_OBUF_46,
      S => Madd_sum_lut(6),
      O => Madd_sum_cy(6)
    );
  Madd_sum_xor_6_Q : XORCY
    port map (
      CI => Madd_sum_cy(5),
      LI => Madd_sum_lut(6),
      O => outsignal_6_OBUF_46
    );
  Madd_sum_lut_7_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => outsignal_7_OBUF_47,
      I1 => c_7_IBUF_31,
      O => Madd_sum_lut(7)
    );
  Madd_sum_xor_7_Q : XORCY
    port map (
      CI => Madd_sum_cy(6),
      LI => Madd_sum_lut(7),
      O => outsignal_7_OBUF_47
    );
  c_7_IBUF : IBUF
    port map (
      I => c(7),
      O => c_7_IBUF_31
    );
  c_6_IBUF : IBUF
    port map (
      I => c(6),
      O => c_6_IBUF_30
    );
  c_5_IBUF : IBUF
    port map (
      I => c(5),
      O => c_5_IBUF_29
    );
  c_4_IBUF : IBUF
    port map (
      I => c(4),
      O => c_4_IBUF_28
    );
  c_3_IBUF : IBUF
    port map (
      I => c(3),
      O => c_3_IBUF_27
    );
  c_2_IBUF : IBUF
    port map (
      I => c(2),
      O => c_2_IBUF_26
    );
  c_1_IBUF : IBUF
    port map (
      I => c(1),
      O => c_1_IBUF_25
    );
  c_0_IBUF : IBUF
    port map (
      I => c(0),
      O => c_0_IBUF_24
    );
  outsignal_7_OBUF : OBUF
    port map (
      I => outsignal_7_OBUF_47,
      O => outsignal(7)
    );
  outsignal_6_OBUF : OBUF
    port map (
      I => outsignal_6_OBUF_46,
      O => outsignal(6)
    );
  outsignal_5_OBUF : OBUF
    port map (
      I => outsignal_5_OBUF_45,
      O => outsignal(5)
    );
  outsignal_4_OBUF : OBUF
    port map (
      I => outsignal_4_OBUF_44,
      O => outsignal(4)
    );
  outsignal_3_OBUF : OBUF
    port map (
      I => outsignal_3_OBUF_43,
      O => outsignal(3)
    );
  outsignal_2_OBUF : OBUF
    port map (
      I => outsignal_2_OBUF_42,
      O => outsignal(2)
    );
  outsignal_1_OBUF : OBUF
    port map (
      I => outsignal_1_OBUF_41,
      O => outsignal(1)
    );
  outsignal_0_OBUF : OBUF
    port map (
      I => outsignal_0_OBUF_40,
      O => outsignal(0)
    );

end Structure;

