----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 AADIDEV SOOKNANAN
-- 
-- Create Date:    21:39:32 01/23/2019 
-- Design Name: 
-- Module Name:    display_multiplexer - Behavioral 
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

entity display_multiplexer is
	port
	(
		clk			:	in 	std_logic;
		reset			:	in		std_logic;
		disp_value	:	in 	std_logic_vector(15 downto 0);
		seg			:	out	std_logic_vector(7 downto 0);
		anode			:	inout	std_logic_vector(3 downto 0)
	);
end display_multiplexer;

architecture Behavioral of display_multiplexer is

begin
	selectAnode:	process(clk, reset)
	begin
		if reset	=	'1' then
			anode	<=	"1110";
		elsif	rising_edge(clk) then
			anode	<=	anode(0) & anode(3 downto 1);
		end if;
	end process;
	
	decodeChar: 	process(clk, reset, disp_value, anode)
	variable dispLED: std_logic_vector(3 downto 0);
	begin
		case 	anode is
		   when "1110" => dispLED := disp_value(3 downto 0);
		   when "1101" => dispLED := disp_value(7 downto 4);
		   when "1011" => dispLED := disp_value(11 downto 8);
		   when "0111" => dispLED := disp_value(15 downto 12);
			when others => dispLED := "0000";
		end case;
			
		case	dispLED is		  
	         when "0000"=>
		         seg <= "11000000";	--key 0
		      when "0001"=>
		   	   seg <= "11111001";	--key 1
		      when "0010"=>
		   	   seg <= "00100100";	--key 2
		      when "0011"=>
		   	   seg <= "00110000";	--key 3
		      when "0100"=>
		   	   seg <= "00011001";	--key 4
		      when "0101"=>
		   	   seg <= "00010010"; --key 5
		      when "0110"=>
			      seg <= "10000010";	--key 6
		      when "0111"=>
			      seg <= "01111000";	--key 7
		      when "1000"=>
			      seg <= "00000000";	--key 8
		      when "1001"=>
			      seg <= "00010000";	--key 9
		      when "1010"=>
			      seg <= "00001001";	--key * (H)
		      when "1011"=>
			      seg <= "01001001";	--key # (||)
		      when "1100"=>
			      seg <= "00001000";	--key A
		      when "1101"=>
			      seg <= "00000000";	--key B
		      when "1110"=>
			      seg <= "01000110";	--key C
		      when "1111"=>
			      seg <= "01000000";	--key D
		      when others =>
        		   seg <= "00000110";
		end case;
			
	end process;

end Behavioral;

