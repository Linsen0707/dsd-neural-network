library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Generator is
   Port (a : out unsigned (7 downto 0);
         b : out unsigned (7 downto 0));
end Generator;

architecture behavioral of Generator is
begin
    process
    begin
       a <= "00000000";
       b <= "00000000";

       wait for 50 ns;
       a <= "11111111";
       b <= "00000000";

       wait for 50 ns;
       a <= "00000000";
       b <= "11111111";

       wait for 50 ns;
       a <= "11111111";
       b <= "11111111";

       wait;
    end process;
end architecture behavioral;
        
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Network_Testbench is
end entity Network_Testbench;

architecture test of Network_Testbench is
   component Generator is
       Port (a : out unsigned (7 downto 0);
             b : out unsigned (7 downto 0));
   end component;

   component Network is 
       Port (	testa : in  unsigned (7 downto 0);
				   testb : in  unsigned (7 downto 0);
				   classification : out  unsigned (7 downto 0));
   end component;
   
   signal a,b,c : unsigned (7 downto 0);
   
begin
    dut:Network
    port map(a,b,c);
    
    gen:Generator
    port map(a, b);
        
    
           
end architecture;
