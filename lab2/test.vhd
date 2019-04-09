library IEEE;
use IEEE.std_logic_1164.all; 


entity tbfsm is
end tbfsm;

architecture test of tbfsm is

signal t_a : std_logic_vector(15 downto 0);
signal t_e : std_logic_vector(15 downto 0);
signal t_b : std_logic_vector(15 downto 0);
signal t_c : std_logic_vector(15 downto 0);
signal t_d : std_logic_vector(15 downto 0);
signal t_f : std_logic_vector(15 downto 0);
signal t_clock: std_logic;
signal t_reset: std_logic;
signal t_out : std_logic_vector(15 downto 0);

