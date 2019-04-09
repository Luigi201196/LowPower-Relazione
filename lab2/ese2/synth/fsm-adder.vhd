library ieee; 
use ieee.std_logic_1164.all; 

entity fsm_adder is 
       
	Port (	A:	In	std_logic_vector(15 downto 0);
		     B:	In	std_logic_vector(15 downto 0);
		     C:	In	std_logic_vector(15 downto 0);
		     D:	In	std_logic_vector(15 downto 0);
		     E:	In	std_logic_vector(15 downto 0);
		     F:	In	std_logic_vector(15 downto 0);
		     Clock: In std_logic;
		     reset :In std_logic;
		     Output: Out std_logic_vector(15 downto 0));
end fsm_adder; 



architecture behaviour of fsm_adder is



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


component fsm is 
       
	Port (	 
		     Clock: In std_logic;
		     reset: In std_logic;
		     S: Out std_logic_vector(3 downto 0));
end component; 

 



signal sel : std_logic_vector(3 downto 0);
SIGNAL sum_s: std_logic_vector(15 downto 0);

begin

fsm_pin: fsm port map (Clock=>clock, reset=>reset, S=>sel);
datapath_pin: datapath_adder port map(MUX00=>A, MUX01=>sum_s, MUX02=>F, MUX03=>E, MUX10=>B, MUX11=>C, MUX12=>sum_s, MUX13=>D, CLOCK=>CLOCK, RESET=>RESET, SEL00=>SEL(0), SEL01=>SEL(1), SEL10=>SEL(2), SEL11=>SEL(3), SUM=>SUM_S);

end behaviour;


