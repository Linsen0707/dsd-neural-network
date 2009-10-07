VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_50(9:0)
        SIGNAL XLXN_131(9:0)
        SIGNAL XLXN_157
        SIGNAL XLXN_156
        SIGNAL XLXN_132(7:0)
        SIGNAL XLXN_77(9:0)
        SIGNAL PS2D
        SIGNAL PS2C
        SIGNAL XLXN_64(7:0)
        SIGNAL XLXN_62
        SIGNAL XLXN_61
        SIGNAL XLXN_60
        SIGNAL OutRed(2:0)
        SIGNAL OutGreen(2:0)
        SIGNAL OutBlue(2:1)
        SIGNAL XLXN_466(2:0)
        SIGNAL XLXN_467(2:0)
        SIGNAL XLXN_468(1:0)
        SIGNAL btn(3:0)
        SIGNAL sw(7:0)
        SIGNAL dp
        SIGNAL led(7:0)
        SIGNAL seg(6:0)
        SIGNAL an(3:0)
        SIGNAL HSYNC
        SIGNAL VSYNC
        SIGNAL ck25MHz
        SIGNAL ck100MHz
        SIGNAL CLK2
        SIGNAL sw(7)
        SIGNAL XLXN_521
        SIGNAL CLK1
        SIGNAL XLXN_523(11:0)
        SIGNAL XLXN_524
        SIGNAL XLXN_525(9:0)
        SIGNAL XLXN_526(9:0)
        SIGNAL XLXN_532
        SIGNAL XLXN_533
        PORT BiDirectional PS2D
        PORT BiDirectional PS2C
        PORT Output OutRed(2:0)
        PORT Output OutGreen(2:0)
        PORT Output OutBlue(2:1)
        PORT Input btn(3:0)
        PORT Input sw(7:0)
        PORT Output dp
        PORT Output led(7:0)
        PORT Output seg(6:0)
        PORT Output an(3:0)
        PORT Output HSYNC
        PORT Output VSYNC
        PORT Input CLK2
        PORT Input CLK1
        BEGIN BLOCKDEF DispCtrl
            TIMESTAMP 2006 11 28 15 40 39
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            LINE N 64 128 0 128 
            RECTANGLE N 0 148 64 172 
            LINE N 0 160 64 160 
            RECTANGLE N 0 180 64 204 
            LINE N 0 192 64 192 
            RECTANGLE N 0 -140 64 -116 
            LINE N 64 -128 0 -128 
            RECTANGLE N 64 -256 352 224 
            RECTANGLE N 0 -28 64 -4 
            LINE N 0 -16 64 -16 
            RECTANGLE N 0 4 64 28 
            LINE N 64 16 0 16 
            RECTANGLE N 0 36 64 60 
            LINE N 64 48 0 48 
            RECTANGLE N 0 68 64 92 
            LINE N 64 80 0 80 
            RECTANGLE N 352 4 416 28 
            LINE N 352 16 416 16 
            RECTANGLE N 352 36 416 60 
            LINE N 352 48 416 48 
            RECTANGLE N 352 68 416 92 
            LINE N 352 80 416 80 
        END BLOCKDEF
        BEGIN BLOCKDEF Synchro
            TIMESTAMP 2006 11 28 13 45 40
            RECTANGLE N 64 -256 320 -32 
            LINE N 64 -224 0 -224 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -76 384 -52 
            LINE N 320 -64 384 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF mouse_controller
            TIMESTAMP 2006 11 11 20 51 23
            LINE N 64 -576 0 -576 
            LINE N 320 -448 384 -448 
            LINE N 64 -320 0 -320 
            RECTANGLE N 0 -396 64 -372 
            LINE N 64 -384 0 -384 
            LINE N 64 -416 0 -416 
            LINE N 64 -448 0 -448 
            LINE N 64 -480 0 -480 
            LINE N 64 -512 0 -512 
            LINE N 64 -608 0 -608 
            LINE N 320 -480 384 -480 
            LINE N 320 -512 384 -512 
            LINE N 320 -544 384 -544 
            LINE N 64 -288 0 -288 
            LINE N 4 -256 68 -256 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -204 64 -180 
            LINE N 0 -192 64 -192 
            RECTANGLE N 64 -640 320 -160 
            RECTANGLE N 320 -364 384 -340 
            LINE N 320 -352 384 -352 
            RECTANGLE N 320 -396 384 -372 
            LINE N 320 -384 384 -384 
            RECTANGLE N 320 -332 384 -308 
            LINE N 320 -320 384 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF ps2interface
            TIMESTAMP 2006 10 29 13 1 6
            RECTANGLE N 64 -384 320 -128 
            LINE N 64 -352 0 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -352 384 -352 
            LINE N 320 -256 384 -256 
            LINE N 384 -224 320 -224 
            RECTANGLE N 320 -204 384 -180 
            LINE N 320 -192 384 -192 
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
            LINE N 64 -320 0 -320 
            LINE N 0 -160 64 -160 
            LINE N 0 -192 64 -192 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd10
            TIMESTAMP 2006 10 29 14 29 4
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 37 29
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF clkdllctrl
            TIMESTAMP 2006 11 11 19 6 22
            RECTANGLE N 64 -128 320 0 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ckMux
            TIMESTAMP 2006 11 18 8 48 14
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF VideoRomNoText
            TIMESTAMP 2006 11 18 18 49 41
            RECTANGLE N 144 -184 320 -40 
            RECTANGLE N 320 -76 384 -52 
            LINE N 320 -64 384 -64 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -140 384 -116 
            LINE N 320 -128 384 -128 
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF SnakeLedDemo
            TIMESTAMP 2005 12 22 11 34 49
            RECTANGLE N 64 -256 320 128 
            LINE N 64 -224 0 -224 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 20 384 44 
            LINE N 320 32 384 32 
            RECTANGLE N 320 84 384 108 
            LINE N 320 96 384 96 
            RECTANGLE N 320 -172 384 -148 
            LINE N 384 -160 320 -160 
            RECTANGLE N 320 -236 384 -212 
            LINE N 384 -224 320 -224 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 DispCtrl
            PIN clk25MHz ck25MHz
            PIN bitMouseLeftBtn XLXN_524
            PIN xPos(9:0) XLXN_131(9:0)
            PIN yPos(9:0) XLXN_50(9:0)
            PIN Hcnt(9:0) XLXN_525(9:0)
            PIN Vcnt(9:0) XLXN_526(9:0)
            PIN inRed(2:0) XLXN_466(2:0)
            PIN inGreen(2:0) XLXN_467(2:0)
            PIN inBlue(1:0) XLXN_468(1:0)
            PIN outRed(2:0) OutRed(2:0)
            PIN outGreen(2:0) OutGreen(2:0)
            PIN outBlue(1:0) OutBlue(2:1)
            PIN adrVideoMem(11:0) XLXN_523(11:0)
        END BLOCK
        BEGIN BLOCK XLXI_65 gnd
            PIN G XLXN_157
        END BLOCK
        BEGIN BLOCK XLXI_62 gnd
            PIN G XLXN_156
        END BLOCK
        BEGIN BLOCK XLXI_25 mouse_controller
            PIN clk ck100MHz
            PIN rst XLXN_157
            PIN read XLXN_61
            PIN err XLXN_60
            PIN setx XLXN_157
            PIN sety XLXN_157
            PIN setmax_x XLXN_157
            PIN setmax_y XLXN_157
            PIN rx_data(7:0) XLXN_132(7:0)
            PIN value(9:0) XLXN_77(9:0)
            PIN left
            PIN middle
            PIN right
            PIN new_event
            PIN write XLXN_62
            PIN tx_data(7:0) XLXN_64(7:0)
            PIN xpos(9:0) XLXN_131(9:0)
            PIN ypos(9:0) XLXN_50(9:0)
            PIN zpos(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_43 gnd10
            PIN busGnd(9:0) XLXN_77(9:0)
        END BLOCK
        BEGIN BLOCK XLXI_27 ps2interface
            PIN clk ck100MHz
            PIN err XLXN_60
            PIN busy
            PIN read XLXN_61
            PIN write XLXN_62
            PIN rx_data(7:0) XLXN_132(7:0)
            PIN tx_data(7:0) XLXN_64(7:0)
            PIN rst XLXN_156
            PIN ps2_data PS2D
            PIN ps2_clk PS2C
        END BLOCK
        BEGIN BLOCK XLXI_66 clkdllctrl
            PIN ckDivOut ck25MHz
            PIN ckOut ck100MHz
            PIN ckIn XLXN_521
        END BLOCK
        BEGIN BLOCK XLXI_2 Synchro
            PIN ck25MHz ck25MHz
            PIN HS HSYNC
            PIN VS VSYNC
            PIN Hcnt(9:0) XLXN_525(9:0)
            PIN Vcnt(9:0) XLXN_526(9:0)
        END BLOCK
        BEGIN BLOCK XLXI_171 ckMux
            PIN ck0 CLK1
            PIN ck1 CLK2
            PIN sel sw(7)
            PIN ckOut XLXN_521
        END BLOCK
        BEGIN BLOCK XLXI_172 VideoRomNoText
            PIN outBlue(1:0) XLXN_468(1:0)
            PIN outGreen(2:0) XLXN_467(2:0)
            PIN outRed(2:0) XLXN_466(2:0)
            PIN AdrB(11:0) XLXN_523(11:0)
        END BLOCK
        BEGIN BLOCK XLXI_174 vcc
            PIN P XLXN_524
        END BLOCK
        BEGIN BLOCK XLXI_175 SnakeLedDemo
            PIN ck CLK1
            PIN dp dp
            PIN led(7:0) led(7:0)
            PIN seg(6:0) seg(6:0)
            PIN an(3:0) an(3:0)
            PIN sw(7:0) sw(7:0)
            PIN btn(3:0) btn(3:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 2240 928 R0
        END INSTANCE
        INSTANCE XLXI_62 992 1376 R0
        BEGIN BRANCH XLXN_156
            WIRE 1056 1248 1088 1248
        END BRANCH
        BEGIN BRANCH XLXN_132(7:0)
            WIRE 1472 1376 1552 1376
        END BRANCH
        BEGIN INSTANCE XLXI_25 1552 1600 R0
        END INSTANCE
        BEGIN BRANCH XLXN_77(9:0)
            WIRE 1456 1072 1504 1072
            WIRE 1504 1072 1504 1216
            WIRE 1504 1216 1552 1216
        END BRANCH
        BEGIN INSTANCE XLXI_43 1072 1104 R0
        END INSTANCE
        BEGIN BRANCH PS2D
            WIRE 816 1408 1088 1408
        END BRANCH
        BEGIN BRANCH PS2C
            WIRE 816 1376 1088 1376
        END BRANCH
        BEGIN BRANCH XLXN_64(7:0)
            WIRE 1472 1408 1552 1408
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 1472 1344 1552 1344
        END BRANCH
        BEGIN BRANCH XLXN_61
            WIRE 1472 1312 1552 1312
        END BRANCH
        BEGIN BRANCH XLXN_60
            WIRE 1472 1280 1552 1280
        END BRANCH
        BEGIN INSTANCE XLXI_27 1088 1568 R0
        END INSTANCE
        BEGIN BRANCH OutRed(2:0)
            WIRE 2656 944 2720 944
        END BRANCH
        BEGIN BRANCH OutGreen(2:0)
            WIRE 2656 976 2720 976
        END BRANCH
        BEGIN BRANCH OutBlue(2:1)
            WIRE 2656 1008 2720 1008
        END BRANCH
        BEGIN BRANCH XLXN_466(2:0)
            WIRE 2208 944 2240 944
        END BRANCH
        BEGIN BRANCH XLXN_467(2:0)
            WIRE 2208 976 2240 976
        END BRANCH
        BEGIN BRANCH XLXN_468(1:0)
            WIRE 2208 1008 2240 1008
        END BRANCH
        BEGIN BRANCH btn(3:0)
            WIRE 1456 1664 2736 1664
        END BRANCH
        BEGIN BRANCH sw(7:0)
            WIRE 1456 1728 1744 1728
            WIRE 1744 1728 1760 1728
            WIRE 1760 1728 2752 1728
        END BRANCH
        BEGIN BRANCH dp
            WIRE 1456 1792 1472 1792
            WIRE 1472 1792 2768 1792
        END BRANCH
        BEGIN BRANCH led(7:0)
            WIRE 1456 1856 1472 1856
            WIRE 1472 1856 2768 1856
        END BRANCH
        BEGIN BRANCH seg(6:0)
            WIRE 1456 1920 1472 1920
            WIRE 1472 1920 2768 1920
        END BRANCH
        BEGIN BRANCH an(3:0)
            WIRE 1456 1984 1472 1984
            WIRE 1472 1984 2768 1984
        END BRANCH
        BEGIN BRANCH HSYNC
            WIRE 1808 640 1824 640
            WIRE 1824 528 2720 528
            WIRE 1824 528 1824 640
        END BRANCH
        BEGIN BRANCH VSYNC
            WIRE 1808 704 1888 704
            WIRE 1888 560 1888 704
            WIRE 1888 560 2720 560
        END BRANCH
        BEGIN BRANCH sw(7)
            WIRE 912 608 912 1520
            WIRE 912 1520 1680 1520
            WIRE 1680 1520 1744 1520
            WIRE 1744 1520 1744 1632
            WIRE 912 608 960 608
            BEGIN DISPLAY 1680 1520 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1744 1728 1744 1632
        BEGIN BRANCH CLK2
            WIRE 784 544 944 544
            WIRE 944 544 960 544
        END BRANCH
        BEGIN BRANCH CLK1
            WIRE 784 480 864 480
            WIRE 864 480 960 480
            WIRE 864 480 864 1664
            WIRE 864 1664 1072 1664
        END BRANCH
        BEGIN BRANCH XLXN_131(9:0)
            WIRE 1936 1216 2112 1216
            WIRE 2112 1088 2240 1088
            WIRE 2112 1088 2112 1216
        END BRANCH
        BEGIN BRANCH XLXN_50(9:0)
            WIRE 1936 1248 2144 1248
            WIRE 2144 1120 2240 1120
            WIRE 2144 1120 2144 1248
        END BRANCH
        BEGIN BRANCH ck25MHz
            WIRE 1344 784 1408 784
            WIRE 1408 448 2000 448
            WIRE 2000 448 2000 704
            WIRE 2000 704 2240 704
            WIRE 1408 448 1408 640
            WIRE 1408 640 1424 640
            WIRE 1408 640 1408 784
        END BRANCH
        BEGIN INSTANCE XLXI_172 1824 1072 R0
        END INSTANCE
        BEGIN BRANCH XLXN_523(11:0)
            WIRE 2208 912 2240 912
        END BRANCH
        BEGIN BRANCH XLXN_524
            WIRE 2096 1072 2224 1072
            WIRE 2224 1056 2240 1056
            WIRE 2224 1056 2224 1072
        END BRANCH
        INSTANCE XLXI_174 2096 1136 R270
        BEGIN INSTANCE XLXI_175 1072 1888 R0
        END INSTANCE
        BEGIN BRANCH XLXN_525(9:0)
            WIRE 1808 768 2240 768
        END BRANCH
        BEGIN BRANCH XLXN_526(9:0)
            WIRE 1808 800 2240 800
        END BRANCH
        BEGIN BRANCH ck100MHz
            WIRE 1040 928 1040 992
            WIRE 1040 992 1552 992
            WIRE 1040 992 1040 1216
            WIRE 1040 1216 1088 1216
            WIRE 1040 928 1360 928
            WIRE 1344 848 1360 848
            WIRE 1360 848 1360 928
        END BRANCH
        BEGIN INSTANCE XLXI_2 1424 864 R0
        END INSTANCE
        IOMARKER 2720 944 OutRed(2:0) R0 28
        IOMARKER 2720 976 OutGreen(2:0) R0 28
        IOMARKER 2720 1008 OutBlue(2:1) R0 28
        IOMARKER 2720 528 HSYNC R0 28
        IOMARKER 2720 560 VSYNC R0 28
        BEGIN INSTANCE XLXI_66 960 880 R0
        END INSTANCE
        BEGIN BRANCH XLXN_521
            WIRE 944 688 944 784
            WIRE 944 784 960 784
            WIRE 944 688 1360 688
            WIRE 1344 480 1360 480
            WIRE 1360 480 1360 688
        END BRANCH
        BEGIN INSTANCE XLXI_171 960 640 R0
        END INSTANCE
        BEGIN BRANCH XLXN_157
            WIRE 1504 928 1520 928
            WIRE 1520 928 1520 1024
            WIRE 1520 1024 1520 1088
            WIRE 1520 1088 1520 1120
            WIRE 1520 1120 1520 1152
            WIRE 1520 1152 1552 1152
            WIRE 1520 1152 1520 1184
            WIRE 1520 1184 1552 1184
            WIRE 1520 1120 1552 1120
            WIRE 1520 1088 1552 1088
            WIRE 1520 1024 1552 1024
        END BRANCH
        INSTANCE XLXI_65 1376 864 R90
        IOMARKER 784 544 CLK2 R180 28
        IOMARKER 784 480 CLK1 R180 28
        IOMARKER 816 1408 PS2D R180 28
        IOMARKER 816 1376 PS2C R180 28
        IOMARKER 2752 1728 sw(7:0) R0 28
        IOMARKER 2736 1664 btn(3:0) R0 28
        IOMARKER 2768 1792 dp R0 28
        IOMARKER 2768 1856 led(7:0) R0 28
        IOMARKER 2768 1920 seg(6:0) R0 28
        IOMARKER 2768 1984 an(3:0) R0 28
    END SHEET
END SCHEMATIC
