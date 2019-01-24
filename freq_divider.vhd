----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:49 01/23/2019 
-- Design Name: 
-- Module Name:    frequency_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_divider is
	port
		(
			clk	:	in 	std_logic;
			reset	:	in		std_logic;
			clk1	:	inout	std_logic;
			clk2	:	inout	std_logic
		);
end freq_divider;

architecture Behavioral of freq_divider is

begin
	clk_1kHz	:	process(clk, reset)
	variable a1: integer range 0 to 4000;
	begin
		if(reset = '1') then
			a1		:=	4000;
			clk1	<=	'1';
		elsif	rising_edge(clk) then
			a1		:=	a1 - 1;
			if	(a1 = 0) then
				a1		:=	4000;
				clk1 	<= not (clk1);
			end if;
		end if;
		
					
	end process;
	
	
	clk_1Hz	: process(clk, reset)
	variable a2: integer range 0 to 4000000;
	begin
		if(reset = '1') then
			a2		:=	4000000;
			clk2	<=	'1';
		elsif	rising_edge(clk) then
			a2		:=	a2 - 1;		
			if	(a2 = 0) then
				a2		:=	4000;
				clk2 	<= not (clk2);
			end if;			
		end if;		
	end process;
	
end Behavioral;

