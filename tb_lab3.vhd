----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2018 04:40:02 PM
-- Design Name: 
-- Module Name: tb_lab3 - Behavioral
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

entity tb_lab3 is
--  Port ( );
end tb_lab3;

architecture Behavioral of tb_lab3 is

    component lab3_toplevel
    PORT (
    mode      : in  STD_LOGIC;
        
    clk      : in  STD_LOGIC;
    reset    : in  STD_LOGIC;
    SW_START : in  STD_LOGIC;
    
    insec1   : in  STD_LOGIC;
    insec10   : in  STD_LOGIC;
    inmin1   : in  STD_LOGIC;
    inmin10   : in  STD_LOGIC;
    
    lap_time      : in  STD_LOGIC;
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
    AN4      : out STD_LOGIC;
    LED1      : out STD_LOGIC
   );
   end component;
   
   signal clk      :   STD_LOGIC := '0';
   signal reset    :   STD_LOGIC := '0';
   signal SW_START :   STD_LOGIC := '0';
   signal mode :   STD_LOGIC := '0';
   signal lap_time :   STD_LOGIC := '0';
   signal insec1 :   STD_LOGIC := '0';
   signal insec10 :   STD_LOGIC := '0';
   signal inmin1 :   STD_LOGIC := '0';
   signal inmin10 :   STD_LOGIC := '0';

    signal CA       :  STD_LOGIC;
   signal CB       :  STD_LOGIC;
   signal CC       :  STD_LOGIC;
   signal CD       :  STD_LOGIC;
   signal CE       :  STD_LOGIC;
   signal CF       :  STD_LOGIC;
  signal  CG       :  STD_LOGIC;
  signal  DP       :  STD_LOGIC;
  signal  AN1      :  STD_LOGIC;
  signal  AN2      :  STD_LOGIC;
  signal  AN3      :  STD_LOGIC;
  signal  AN4      :  STD_LOGIC;
  signal  LED1      :  STD_LOGIC;
  
begin

    uut:lab3_toplevel
    PORT MAP(
        mode      => mode,
            
        clk      => clk,
        reset    => mode,
        SW_START => SW_START,
        
        insec1   => insec1,
        insec10   => insec10,
        inmin1   => inmin1,
        inmin10   => inmin10,
        
        lap_time     => lap_time,
        
        
        CA       => CA,
        CB       => CB,
        CC       => CC,
        CD        => CD,
        CE        => CE,
        CF        => CF,
        CG        => CG,
        DP        => DP,
        AN1       => AN1,
        AN2      => AN2,
        AN3       => AN3,
        AN4       => AN4,
        LED1       => LED1
    );
    SW_START <= '1';
    
    clking: process begin
        clk <= '0';
        wait for 50 ns;
         clk <= '1';
         wait for 50 ns;
    end process;
    
    moding: process begin
        mode <= '0';
        wait for 400 ns;
         mode <= '1';
         wait for 400 ns;
    end process;
    
    secing: process begin
        insec1   <= '1';
        insec10   <= '1';
        inmin1   <= '1';
        inmin10   <= '1';
        wait;
    end process;
    res: process begin
reset <= '0' ;           wait for 600 ns;
             reset <= '1';
             wait ;
        end process;


end Behavioral;
