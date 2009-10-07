--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.02i
--  \   \         Application : sch2vhdl
--  /   /         Filename : BasysRevEDemo.vhf
-- /___/   /\     Timestamp : 02/26/2008 19:18:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\XilinxWebPack9.2\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3e -flat -suppress -w C:/Projects/Mircea's_Projects/Board_Tests/Basys/WP9.2/Demo/UncompiledBasysRevEDemo/BasysRevEDemo.sch BasysRevEDemo.vhf
--Design Name: BasysRevEDemo
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity BasysRevEDemo is
   port ( btn      : in    std_logic_vector (3 downto 0); 
          CLK1     : in    std_logic; 
          CLK2     : in    std_logic; 
          sw       : in    std_logic_vector (7 downto 0); 
          an       : out   std_logic_vector (3 downto 0); 
          dp       : out   std_logic; 
          HSYNC    : out   std_logic; 
          led      : out   std_logic_vector (7 downto 0); 
          OutBlue  : out   std_logic_vector (2 downto 1); 
          OutGreen : out   std_logic_vector (2 downto 0); 
          OutRed   : out   std_logic_vector (2 downto 0); 
          seg      : out   std_logic_vector (6 downto 0); 
          VSYNC    : out   std_logic; 
          PS2C     : inout std_logic; 
          PS2D     : inout std_logic);
end BasysRevEDemo;

architecture BEHAVIORAL of BasysRevEDemo is
   attribute BOX_TYPE   : string ;
   signal ck25MHz  : std_logic;
   signal ck100MHz : std_logic;
   signal XLXN_50  : std_logic_vector (9 downto 0);
   signal XLXN_60  : std_logic;
   signal XLXN_61  : std_logic;
   signal XLXN_62  : std_logic;
   signal XLXN_64  : std_logic_vector (7 downto 0);
   signal XLXN_77  : std_logic_vector (9 downto 0);
   signal XLXN_131 : std_logic_vector (9 downto 0);
   signal XLXN_132 : std_logic_vector (7 downto 0);
   signal XLXN_156 : std_logic;
   signal XLXN_157 : std_logic;
   signal XLXN_466 : std_logic_vector (2 downto 0);
   signal XLXN_467 : std_logic_vector (2 downto 0);
   signal XLXN_468 : std_logic_vector (1 downto 0);
   signal XLXN_521 : std_logic;
   signal XLXN_523 : std_logic_vector (11 downto 0);
   signal XLXN_524 : std_logic;
   signal XLXN_525 : std_logic_vector (9 downto 0);
   signal XLXN_526 : std_logic_vector (9 downto 0);
   component DispCtrl
      port ( clk25MHz        : in    std_logic; 
             bitMouseLeftBtn : in    std_logic; 
             xPos            : in    std_logic_vector (9 downto 0); 
             yPos            : in    std_logic_vector (9 downto 0); 
             Hcnt            : in    std_logic_vector (9 downto 0); 
             Vcnt            : in    std_logic_vector (9 downto 0); 
             inRed           : in    std_logic_vector (2 downto 0); 
             inGreen         : in    std_logic_vector (2 downto 0); 
             inBlue          : in    std_logic_vector (1 downto 0); 
             outRed          : out   std_logic_vector (2 downto 0); 
             outGreen        : out   std_logic_vector (2 downto 0); 
             outBlue         : out   std_logic_vector (1 downto 0); 
             adrVideoMem     : out   std_logic_vector (11 downto 0));
   end component;
   
   component Synchro
      port ( ck25MHz : in    std_logic; 
             HS      : out   std_logic; 
             VS      : out   std_logic; 
             Hcnt    : out   std_logic_vector (9 downto 0); 
             Vcnt    : out   std_logic_vector (9 downto 0));
   end component;
   
   component mouse_controller
      port ( clk       : in    std_logic; 
             rst       : in    std_logic; 
             read      : in    std_logic; 
             err       : in    std_logic; 
             setx      : in    std_logic; 
             sety      : in    std_logic; 
             setmax_x  : in    std_logic; 
             setmax_y  : in    std_logic; 
             rx_data   : in    std_logic_vector (7 downto 0); 
             value     : in    std_logic_vector (9 downto 0); 
             left      : out   std_logic; 
             middle    : out   std_logic; 
             right     : out   std_logic; 
             new_event : out   std_logic; 
             write     : out   std_logic; 
             tx_data   : out   std_logic_vector (7 downto 0); 
             xpos      : out   std_logic_vector (9 downto 0); 
             ypos      : out   std_logic_vector (9 downto 0); 
             zpos      : out   std_logic_vector (3 downto 0));
   end component;
   
   component ps2interface
      port ( clk      : in    std_logic; 
             err      : out   std_logic; 
             busy     : out   std_logic; 
             read     : out   std_logic; 
             write    : in    std_logic; 
             rx_data  : out   std_logic_vector (7 downto 0); 
             tx_data  : in    std_logic_vector (7 downto 0); 
             rst      : in    std_logic; 
             ps2_data : inout std_logic; 
             ps2_clk  : inout std_logic);
   end component;
   
   component gnd10
      port ( busGnd : out   std_logic_vector (9 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component clkdllctrl
      port ( ckDivOut : out   std_logic; 
             ckOut    : inout std_logic; 
             ckIn     : in    std_logic);
   end component;
   
   component ckMux
      port ( ck0   : in    std_logic; 
             ck1   : in    std_logic; 
             sel   : in    std_logic; 
             ckOut : out   std_logic);
   end component;
   
   component VideoRomNoText
      port ( outBlue  : inout std_logic_vector (1 downto 0); 
             outGreen : inout std_logic_vector (2 downto 0); 
             outRed   : inout std_logic_vector (2 downto 0); 
             AdrB     : in    std_logic_vector (11 downto 0));
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component SnakeLedDemo
      port ( ck  : in    std_logic; 
             dp  : out   std_logic; 
             led : out   std_logic_vector (7 downto 0); 
             seg : out   std_logic_vector (6 downto 0); 
             an  : out   std_logic_vector (3 downto 0); 
             sw  : in    std_logic_vector (7 downto 0); 
             btn : in    std_logic_vector (3 downto 0));
   end component;
   
begin
   XLXI_1 : DispCtrl
      port map (bitMouseLeftBtn=>XLXN_524,
                clk25MHz=>ck25MHz,
                Hcnt(9 downto 0)=>XLXN_525(9 downto 0),
                inBlue(1 downto 0)=>XLXN_468(1 downto 0),
                inGreen(2 downto 0)=>XLXN_467(2 downto 0),
                inRed(2 downto 0)=>XLXN_466(2 downto 0),
                Vcnt(9 downto 0)=>XLXN_526(9 downto 0),
                xPos(9 downto 0)=>XLXN_131(9 downto 0),
                yPos(9 downto 0)=>XLXN_50(9 downto 0),
                adrVideoMem(11 downto 0)=>XLXN_523(11 downto 0),
                outBlue(1 downto 0)=>OutBlue(2 downto 1),
                outGreen(2 downto 0)=>OutGreen(2 downto 0),
                outRed(2 downto 0)=>OutRed(2 downto 0));
   
   XLXI_2 : Synchro
      port map (ck25MHz=>ck25MHz,
                Hcnt(9 downto 0)=>XLXN_525(9 downto 0),
                HS=>HSYNC,
                Vcnt(9 downto 0)=>XLXN_526(9 downto 0),
                VS=>VSYNC);
   
   XLXI_25 : mouse_controller
      port map (clk=>ck100MHz,
                err=>XLXN_60,
                read=>XLXN_61,
                rst=>XLXN_157,
                rx_data(7 downto 0)=>XLXN_132(7 downto 0),
                setmax_x=>XLXN_157,
                setmax_y=>XLXN_157,
                setx=>XLXN_157,
                sety=>XLXN_157,
                value(9 downto 0)=>XLXN_77(9 downto 0),
                left=>open,
                middle=>open,
                new_event=>open,
                right=>open,
                tx_data(7 downto 0)=>XLXN_64(7 downto 0),
                write=>XLXN_62,
                xpos(9 downto 0)=>XLXN_131(9 downto 0),
                ypos(9 downto 0)=>XLXN_50(9 downto 0),
                zpos=>open);
   
   XLXI_27 : ps2interface
      port map (clk=>ck100MHz,
                rst=>XLXN_156,
                tx_data(7 downto 0)=>XLXN_64(7 downto 0),
                write=>XLXN_62,
                busy=>open,
                err=>XLXN_60,
                read=>XLXN_61,
                rx_data(7 downto 0)=>XLXN_132(7 downto 0),
                ps2_clk=>PS2C,
                ps2_data=>PS2D);
   
   XLXI_43 : gnd10
      port map (busGnd(9 downto 0)=>XLXN_77(9 downto 0));
   
   XLXI_62 : GND
      port map (G=>XLXN_156);
   
   XLXI_65 : GND
      port map (G=>XLXN_157);
   
   XLXI_66 : clkdllctrl
      port map (ckIn=>XLXN_521,
                ckDivOut=>ck25MHz,
                ckOut=>ck100MHz);
   
   XLXI_171 : ckMux
      port map (ck0=>CLK1,
                ck1=>CLK2,
                sel=>sw(7),
                ckOut=>XLXN_521);
   
   XLXI_172 : VideoRomNoText
      port map (AdrB(11 downto 0)=>XLXN_523(11 downto 0),
                outBlue(1 downto 0)=>XLXN_468(1 downto 0),
                outGreen(2 downto 0)=>XLXN_467(2 downto 0),
                outRed(2 downto 0)=>XLXN_466(2 downto 0));
   
   XLXI_174 : VCC
      port map (P=>XLXN_524);
   
   XLXI_175 : SnakeLedDemo
      port map (btn(3 downto 0)=>btn(3 downto 0),
                ck=>CLK1,
                sw(7 downto 0)=>sw(7 downto 0),
                an(3 downto 0)=>an(3 downto 0),
                dp=>dp,
                led(7 downto 0)=>led(7 downto 0),
                seg(6 downto 0)=>seg(6 downto 0));
   
end BEHAVIORAL;


