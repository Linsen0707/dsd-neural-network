library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity ErrorCalc is
    Port ( inputs : in std_logic_vector (1 downto 0);   --inputs from switches
           result : in unsigned (7 downto 0);   --result from network
           error : out signed (15 downto 0));           --result of error calculation (output)
end ErrorCalc;

architecture Behavioral of ErrorCalc is
  type solvec is array(3 downto 0) of signed (15 downto 0);
  signal solution : solvec;
begin
  --vectors holding values of correct solution
  solution(0) <= "0000000000000000";
  solution(1) <= "0000000100000000";
  solution(2) <= "0000000100000000";
  solution(3) <= "0000000000000000";
  
  process (inputs, result)
      variable choice : integer;
    begin
      choice := to_integer(unsigned(inputs));
      error <= solution(choice) - signed("00000000"&result);
  end process;
end Behavioral;           