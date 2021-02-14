library ieee;
use ieee.std_logic_1164.all;

-- DO NOT CHANGE ANYTHING IN THE ENTITY

entity adder is
  port (
    input1    : in  std_logic_vector(5 downto 0);
    input2    : in  std_logic_vector(5 downto 0);
    carry_in  : in  std_logic;
    sum       : out std_logic_vector(5 downto 0);
    carry_out : out std_logic);
end adder;

-- DEFINE A RIPPLE-CARRY ADDER USING A STRUCTURE DESCRIPTION THAT CONSISTS OF 6
-- FULL ADDERS

architecture STR of adder is  

signal carry : std_logic_vector (4 downto 0);

begin  -- STR
--***********************************************--
FullAddr0 : entity work.fa
port map(
	input1 => input1(0),
	input2 => input2(0),
	carry_in => carry_in,
	sum => sum(0),
	carry_Out => carry(0)
	);
--***********************************************--

FullAddr1 : entity work.fa
port map(
	input1 => input1(1),
	input2 => input2(1),
	carry_in => carry(0),
	sum => sum(1),
	carry_Out => carry(1)
	);
--***********************************************--

FullAddr2 : entity work.fa
port map(
	input1 => input1(2),
	input2 => input2(2),
	carry_in => carry(1),
	sum => sum(2),
	carry_Out => carry(2)
	);
--***********************************************--

FullAddr3 : entity work.fa
port map(
	input1 => input1(3),
	input2 => input2(3),
	carry_in => carry(2),
	sum => sum(3),
	carry_Out => carry(3)
	);
--***********************************************--

FullAddr4 : entity work.fa
port map(
	input1 => input1(4),
	input2 => input2(4),
	carry_in => carry(3),
	sum => sum(4),
	carry_Out => carry(4)
	);
--***********************************************--

FullAddr5 : entity work.fa
port map(
	input1 => input1(5),
	input2 => input2(5),
	carry_in => carry(4),
	sum => sum(5),
	carry_Out => carry_out
	);
--***********************************************--
end STR;