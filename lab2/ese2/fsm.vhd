library ieee; 
use ieee.std_logic_1164.all; 

entity enumtype is 
       
	Port (	A:	In	std_logic_vector(15 downto 0);
		     B:	In	std_logic_vector(15 downto 0);
		     C:	In	std_logic_vector(15 downto 0);
		     D:	In	std_logic_vector(15 downto 0);
		     E:	In	std_logic_vector(15 downto 0);
		     F:	In	std_logic_vector(15 downto 0);
		     Clock: In std_logic;
		     reset :In std_logic;
		     Output: Out std_logic_vector(15 downto 0));
end enumtype; 



architecture behaviour of enumtype is

component datapath_adder is

port( 	MUX00:	in std_logic_vector(15 downto 0);
  MUX01:	in std_logic_vector(15 downto 0);
  MUX02:	in std_logic_vector(15 downto 0);
  MUX03:	in std_logic_vector(15 downto 0);
  MUX10:	in std_logic_vector(15 downto 0);
  MUX11:	in std_logic_vector(15 downto 0);
  MUX12:	in std_logic_vector(15 downto 0);
  MUX13:	in std_logic_vector(15 downto 0);
  clock: 	in std_logic;
  reset:	in std_logic;
  SEL00:	in std_logic;
  SEL01:	in std_logic;
  SEL10:	in std_logic;
  SEL11:	in std_logic;
  SUM:	out std_logic_vector(15 downto 0));
end	component;







TYPE STATE is (state1,state2,state3,state4,state5);
 attribute enum_encoding: string;
 attribute enum_encoding of state: type is "000 001 011 010 110";
 

signal CURRENTSTATE : STATE;
signal NEXTSTATE :  STATE;
signal S: std_logic_vector(3 downto 0);
SIGNAL USC: STD_LOGIC_VECTOR(15 DOWNTO 0);


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


sum: datapath_adder port map(MUX00=>A,MUX01=>USC,MUX02=>E,MUX03=>F,MUX10=>B,MUX11=>C,MUX12=>USC,MUX13=>D,SEL00=>S(0),SEL01=>S(1),SEL10=>S(2),SEL11=>S(3),SUM=>USC,clock=>clock,reset=>reset);
OUTPUT<=USC; 

end behaviour;








