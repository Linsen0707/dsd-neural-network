library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Generator is
   Port (a : out unsigned (7 downto 0);
         b : out unsigned (7 downto 0);
         x : in unsigned (7 downto 0);
         e : out signed (15 downto 0);
         mode : out boolean);
end Generator;

architecture behavioral of Generator is
  type solvec is array(3 downto 0) of signed (15 downto 0);
  signal solution : solvec;
begin
  
    solution(0) <= "0000000000000000";
    solution(1) <= "0000000100000000";
    solution(2) <= "0000000100000000";
    solution(3) <= "0000000000000000";
  
    process
      variable epoch : integer := 0;
    begin
      while (epoch < 2000) loop

       a <= "00000000";
       b <= "00000000";
       e <= "0000000000000000";
       wait for 5 ns;
       mode <= true;
       wait for 5 ns;
       e <= solution(0) - signed("00000000"&x);  
       wait for 5 ns;
       mode <= false;   
       wait for 5 ns;

       a <= "11111111";
       b <= "00000000";
       e <= "0000000000000000";
       wait for 5 ns;
       mode <= true;
       wait for 5 ns;
       e <= solution(1) - signed("00000000"&x);  
       wait for 5 ns;
       mode <= false;   
       wait for 5 ns;       
       
       a <= "00000000";
       b <= "11111111";
       e <= "0000000000000000";
       wait for 5 ns;
       mode <= true;
       wait for 5 ns;
       e <= solution(2) - signed("00000000"&x);  
       wait for 5 ns;
       mode <= false;   
       wait for 5 ns;
       
       a <= "11111111";
       b <= "11111111";
       e <= "0000000000000000";
       wait for 5 ns;
       mode <= true;
       wait for 5 ns;
       e <= solution(3) - signed("00000000"&x);  
       wait for 5 ns;
       mode <= false;   
       wait for 5 ns;
      
     end loop;
  
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
             b : out unsigned (7 downto 0);
             x : in unsigned (7 downto 0);
             e : out signed (15 downto 0);
             mode : out boolean);
   end component;

   component Network is 
    Port (	testa : in  unsigned (7 downto 0);
				testb : in  unsigned (7 downto 0);
				classification : out  unsigned (7 downto 0);
				lasterror : in signed(15 downto 0);
				learnmode : in boolean);
   end component;
   
   signal a,b,x : unsigned (7 downto 0);
   signal e : signed(15 downto 0);
   signal mode : boolean;
   
begin
    dut:Network
    port map(a,b,x,e,mode);
    
    gen:Generator
    port map(a,b,x,e,mode);
        
end architecture;
