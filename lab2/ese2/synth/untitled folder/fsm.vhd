library ieee; 
use ieee.std_logic_1164.all; 

entity fsm is 
       
	Port (	 
		     Clock: In std_logic;
		     reset :In std_logic;
		     S: Out std_logic_vector(3 downto 0));
end fsm; 



architecture behaviour of fsm is






TYPE STATE is (state1,state2,state3,state4,state5);
 attribute enum_encoding: string;
 attribute enum_encoding of state: type is "000 001 011 010 110";
 

signal CURRENTSTATE : STATE;
signal NEXTSTATE :  STATE;



begin

Clk_transition: process (CLOCK,reset)

begin 
if reset ='1' then
CURRENTSTATE <= state1;


elsif (CLOCK = '1' and CLOCK' EVENT) then
CURRENTSTATE <= NEXTSTATE;

end if ;

end process;

State_transition : process (CURRENTSTATE)
begin

case CURRENTSTATE is

when state1 => NEXTSTATE <= state2;

when state2 => NEXTSTATE <= state3;

when state3 => NEXTSTATE <= state4;
  
when  state4=> NEXTSTATE <= state5;

when state5 => NEXTSTATE <= state1;

when others => NEXTSTATE <= state1;  

end case ;
end process;


Output_fsm: process (CURRENTSTATE)

begin
  
  case CURRENTSTATE is

when state1 => S <= "0000";

when state2 => S <="0101";

when state3 => S <= "0111";
  
when state4 => S <= "1110";

when state5 => S <= "1010";

when others => S <= "0000";  

end case ;
end process;

end behaviour;








