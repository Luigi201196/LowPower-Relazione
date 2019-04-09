
library IEEE;
use IEEE.std_logic_1164.all; --  libreria IEEE con definizione tipi standard logic
use IEEE.std_logic_signed.all; 


entity datapath_adder is
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
	SUM:	out std_logic_vector(15 downto 0)
);
end	datapath_adder;

---------------------------------------------

architecture behavioral of datapath_adder is

	signal operanda: std_logic_vector(15 downto 0);
	signal operandb: std_logic_vector(15 downto 0);

begin
 	P_MUX0 : process(MUX00,MUX01,MUX02,MUX03,SEL00,SEL01)
	variable SEL0 : std_logic_vector(1 downto 0);
	begin
		SEL0(0):=SEL00;
		SEL0(1):=SEL01;
		
		case SEL0 is
			when "00" =>
				operanda <= MUX00;
			when "01" =>
				operanda <= MUX01;
			when "10" => 
				operanda <= MUX02;
			when "11" =>
				operanda <= MUX03;
			when others =>
		end case;
	end process;

 	P_MUX1 : process(MUX10,MUX11,MUX12,MUX13,SEL10,SEL11)
	variable SEL1 : std_logic_vector(1 downto 0);
	begin
		SEL1(0):=SEL10;
		SEL1(1):=SEL11;
		
		case SEL1 is
			when "00" =>
				operandb <= MUX10;
			when "01" =>
				operandb <= MUX11;
			when "10" => 
				operandb <= MUX12;
			when "11" =>
				operandb <= MUX13;
			when others =>
		end case;
	end process;
	
	
	P_ADDER_REGISTER : process(clock,reset)
	begin
		if reset='1' then
	        	SUM <= (others => '0');
		elsif (CLOCK ='1' and CLOCK'EVENT) then 
			SUM <= operanda+operandb;
		end if;
	end process;

end behavioral;
 

configuration CFG_DP_ADDER of datapath_adder is
	for  behavioral
	end for;
end CFG_DP_ADDER;
