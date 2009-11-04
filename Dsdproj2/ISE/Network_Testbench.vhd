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
  type inpvec is array(3 downto 0) of unsigned (7 downto 0);
  signal solution : solvec;
  signal inputa : inpvec;
  signal inputb : inpvec;
begin
 
    inputa(0) <= "11111111";
    inputb(0) <= "11111111";
    
    inputa(1) <= "11111111";
    inputb(1) <= "00000000";
    
    inputa(2) <= "00000000";
    inputb(2) <= "11111111";
    
    inputa(3) <= "00000000";
    inputb(3) <= "00000000";
  
    solution(0) <= "0000000000000000";
    solution(1) <= "0000000100000000";
    solution(2) <= "0000000100000000";
    solution(3) <= "0000000000000000";
  
    process
      variable untrained : boolean := true;
      variable choice : integer := 0;
      variable count : integer := 0;
      variable result : unsigned(15 downto 0);
      variable prng : unsigned(2 downto 0) := "001";
      
    begin
      while (untrained) loop
      untrained := false;
        count := 0;
        while (count < 8) loop
          wait for 5 ns;
          prng := (prng(0) xor prng(1)) & prng(2) & prng(1);
          choice := to_integer(prng(2 downto 1));
          a <= inputa(choice);
          b <= inputb(choice);
          e <= "0000000000000000";
          wait for 5 ns;
          mode <= true;
          result := "00000000" & x;
          wait for 5 ns;
          if (abs(solution(choice) - signed(result)) > "0000000010000000") then
            untrained := untrained or true;
          end if;
          e <= solution(choice) - signed(result);
          wait for 5 ns;
          mode <= false;   
          count := count + 1;
        end loop;
     end loop;
     e <= "0000000000000000";
     mode <= false;
     wait for 100 ns;
      count := 0;
      while (count < 4) loop
        wait for 5 ns;
        a <= inputa(count);
        b <= inputb(count);
        count := count + 1;
        wait for 5 ns;
      end loop;
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
