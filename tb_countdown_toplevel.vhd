----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2018 05:30:16 PM
-- Design Name: 
-- Module Name: tb_countdown_toplevel - Behavioral
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

entity tb_countdown_toplevel is
--  Port ( );
end tb_countdown_toplevel;

architecture Behavioral of tb_countdown_toplevel is
COMPONENT countdown_top_level
    PORT ( clk      : in  STD_LOGIC;
          reset    : in  STD_LOGIC;
          SW_START : in  STD_LOGIC;
          
          insec1   : in  STD_LOGIC;
          insec10   : in  STD_LOGIC;
          inmin1   : in  STD_LOGIC;
          inmin10   : in  STD_LOGIC;
          
          led1_CD:        out STD_LOGIC;
          
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
END COMPONENT;

signal clk, reset, SW_START,insec1,insec10, inmin1, inmin10  :   STD_LOGIC:='0';
signal CA, CB, CC,CD,CE,CF,CG,DP, AN1,AN2,AN3,AN4 :  STD_LOGIC;

begin

uut:countdown_top_level
PORT MAP(
    clk => clk,
    reset => reset,
    SW_START => SW_START,
    insec1 => insec1,
    insec10 => insec10,
    inmin1 => inmin1,
    inmin10 => inmin10,
    
    CA => CA,
    CB => CB,
    CC => CC,
    CD => CD,
    CE => CE,
    CF => CF,
    CG => CG,
    DP => DP,
    AN1 => AN1,
    AN2 => AN2,
    AN3 => AN3,
    AN4 => AN4
);


clkp: process begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
end process;

sbart: process begin
        SW_START <= '0';
        wait for 100 ns;
         SW_START <= '1';
         wait for 100 ns;
         SW_START <= '0';
         wait for 100 ns;
         SW_START <= '1';
    end process;

res: process begin
reset <= '1' ;           wait for 100 ns;
             reset <= '0';
             wait ;
        end process;

  lappy: process begin
        insec1 <= '1' ;     
        insec10 <= '1' ;    
        inmin1 <= '1' ;    
        inmin10 <= '1' ;       
        wait;   
     
    end process;

end Behavioral;

