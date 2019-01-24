----------------------------------------------------------------------------------
-- Company: 		
-- Engineer: 		AADIDEV SOOKNANAN	
-- 
-- Create Date:    21:00:11 01/23/2019 
-- Design Name: 
-- Module Name:    display_driver - Behavioral 
-- Project Name: 
-- Target Devices: 	COOLRUNNER II PRO XC2C256
-- Tool versions: 	
-- Description: 		ISE 14.7
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity display_driver is
	Port
	(
		clk	:	in 	std_logic;
		reset	:	in 	std_logic;
		seg	:	out	std_logic_vector(7 downto 0);
		anode	:	inout	std_logic_vector(3 downto 0)
	);
end display_driver;

architecture Behavioral of display_driver is
-------------------------------------------signals----------------------------------------
signal 	clk_1kHz	:	std_logic;
signal	clk_1Hz	:	std_logic;
signal	display_value_sig	: std_logic_vector(15 downto 0);
begin
	display_value_sig	<=	"0011000000010110";	
	frequency_div: entity work.freq_divider(Behavioral)
		port map
		(
			clk	=>		clk,
			reset	=>		reset,
			clk1	=>		clk_1kHz,
			clk2	=>		clk_1Hz
		);

	display_mul: entity work.display_multiplexer(Behavioral)
	port map
	(
		clk			=>		clk_1kHz,
		reset			=>		reset,
		disp_value	=>		display_value_sig,
		seg			=>		seg,
		anode			=>		anode
	);
end Behavioral;

