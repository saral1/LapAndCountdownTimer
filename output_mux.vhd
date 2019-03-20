----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2018 02:40:46 PM
-- Design Name: 
-- Module Name: output_mux - Behavioral
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

entity output_mux is
    PORT(  
           mode      : in  STD_LOGIC;

           CA1       : in STD_LOGIC;
           CB1       : in STD_LOGIC;
           CC1       : in STD_LOGIC;
           CD1       : in STD_LOGIC;
           CE1       : in STD_LOGIC;
           CF1       : in STD_LOGIC;
           CG1       : in STD_LOGIC;
           DP1       : in STD_LOGIC;
           AN1_1      : in STD_LOGIC;
           AN2_1      : in STD_LOGIC;
           AN3_1      : in STD_LOGIC;
           AN4_1      : in STD_LOGIC; 
           
           CA2       : in STD_LOGIC;
           CB2       : in STD_LOGIC;
           CC2       : in STD_LOGIC;
           CD2       : in STD_LOGIC;
           CE2       : in STD_LOGIC;
           CF2       : in STD_LOGIC;
           CG2       : in STD_LOGIC;
           DP2       : in STD_LOGIC;
           AN1_2      : in STD_LOGIC;
           AN2_2      : in STD_LOGIC;
           AN3_2      : in STD_LOGIC;
           AN4_2      : in STD_LOGIC;
           
           LED1_in      : in STD_LOGIC;
          LED1_out     : out STD_LOGIC;
           
           CA       : out STD_LOGIC;
           CB       : out STD_LOGIC;
           CC       : out STD_LOGIC;
           CD       : out STD_LOGIC;
           CE       : out STD_LOGIC;
           CF       : out STD_LOGIC;
           CG       : out STD_LOGIC;
           DP       : out STD_LOGIC;
           AN1      : out STD_LOGIC;
           AN2      : out STD_LOGIC;
           AN3      : out STD_LOGIC;
           AN4      : out STD_LOGIC

    );
end output_mux;

architecture Behavioral of output_mux is

begin
    mode_switch: process(mode) begin
        if(mode = '0') then
            CA <= CA1;
            CB <= CB1;
            CC <= CC1;
            CD <= CD1;
            CE <= CE1;
            CF <= CF1;
            CG <= CG1;
            DP <= DP1;
            AN1 <= AN1_1;
            AN2 <= AN2_1;
            AN3 <= AN3_1;
            AN4 <= AN4_1;
            
            LED1_out <= '0';
        else
            CA <= CA2;
            CB <= CB2;
            CC <= CC2;
            CD <= CD2;
            CE <= CE2;
            CF <= CF2;
            CG <= CG2;
            DP <= DP2;
            AN1 <= AN1_2;
            AN2 <= AN2_2;
            AN3 <= AN3_2;
            AN4 <= AN4_2;
            
            LED1_out <= LED1_in;
        end if;
    end process;

end Behavioral;
