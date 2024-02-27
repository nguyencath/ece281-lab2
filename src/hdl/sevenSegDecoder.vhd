----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 12:48:54 PM
-- Design Name: 
-- Module Name: sevenSegDecoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder is
    Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is
  -- declare the component of your top-level design unit under test (UUT)
      component sevenSegDecoder is
        port(
           i_D : in std_logic_vector (3 downto 0);
           o_S : out std_logic_vector (6 downto 0)
        );    
      end component;
    
      -- signals for the UUT
--      signal w_sw : std_logic_vector (3 downto 0);
--      signal w_seg : std_logic_vector (6 downto 0);
      signal c_Sa, c_Sb, c_Sc, c_Sd, c_Se, c_Sf, c_Sg :  std_logic := '1'; 

begin
    -- PORT MAPS ----------------------------------------

	--	Port map: wire your component up to the switches and seven-segment display cathodes
	-----------------------------------------------------	
      o_S(0) <= c_Sa;
      o_S(1) <= c_Sb;
      o_S(2) <= c_Sc;
      o_S(3) <= c_Sd;
      o_S(4) <= c_Se;
      o_S(5) <= c_Sf;
      o_S(6) <= c_Sg;
      
      c_Sa <= (not i_D(3) and not i_D(2) and not i_D(1) and i_D(0))
            or (i_D(3) and not i_D(2) and i_D(1) and i_D(0))
            or (i_D(2) and not i_D(1) and not i_D(0))
            or (i_D(3) and i_D(2) and not i_D(1));
      c_Sb <= (not i_D(3) and i_D(2) and not i_D(1) and i_D(0))
            or (i_D(3) and i_D(2) and not i_D(0))
            or (i_D(3) and i_D(1) and i_D(0))
            or (i_D(2) and i_D(1) and not i_D(0));
      c_Sc <= (not i_D(3) and not i_D(2) and i_D(1) and not i_D(0))
            or (i_D(3) and i_D(2) and i_D(1))
            or (i_D(3) and i_D(2) and not i_D(0));
      c_Sd <= (not i_D(3) and i_D(2) and not i_D(1) and not i_D(0))
            or (i_D(3) and not i_D(2) and i_D(1) and not i_D(0))
            or (not i_D(2) and not i_D(1) and i_D(0))
            or (i_D(2) and i_D(1) and i_D(0));
      c_Se <= (not i_D(3) and i_D(2) and not i_D(1))
            or (not i_D(2) and not i_D(1) and i_D(0))
            or (not i_D(3) and i_D(0));
      c_Sf <= (not i_D(3) and not i_D(2) and i_D(0))
            or (not i_D(3) and not i_D(2) and i_D(1))
            or (not i_D(3) and i_D(1) and i_D(0))
            or (i_D(3) and i_D(2) and not i_D(1));
      c_Sg <= (not i_D(3) and i_D(2) and i_D(1) and i_D(0))
            or (not i_D(3) and not i_D(2) and not i_D(1));
	-- CONCURRENT STATEMENTS ----------------------------
    
    
    
end Behavioral;
