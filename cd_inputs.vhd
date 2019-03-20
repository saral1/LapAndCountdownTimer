----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 06:46:28 PM
-- Design Name: 
-- Module Name: inputs - Behavioral
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

entity cd_inputs is
    PORT ( 
        clk      : in  STD_LOGIC;
        
        sec1 : in STD_LOGIC;
        sec10 : in STD_LOGIC;
        min1 : in STD_LOGIC;
        min10 : in STD_LOGIC;
        
        sec1_o : out STD_LOGIC;
        sec10_o : out STD_LOGIC;
        min1_o : out STD_LOGIC;
        min10_o : out STD_LOGIC
       );
end cd_inputs;

architecture Behavioral of cd_inputs is
 
signal QS1        : STD_LOGIC;  
signal loadS1        : STD_LOGIC;    

signal QS10        : STD_LOGIC;  
signal loadS10        : STD_LOGIC;   

signal QM1        : STD_LOGIC;  
signal loadM1        : STD_LOGIC;   

signal QM10        : STD_LOGIC;  
signal loadM10        : STD_LOGIC;   
    
begin
    s1: process(clk,loadS1) begin
        if (rising_edge(clk)) then 
            QS1 <= sec1; 
        end if;
        loadS1 <= sec1 and (not QS1);
    end process;
    
    s10: process(clk,loadS10) begin
        if (rising_edge(clk)) then 
            QS10 <= sec10; 
        end if;
        loadS10 <= sec10 and (not QS10);
    end process;
        
    m1: process(clk,loadM1) begin
        if (rising_edge(clk)) then 
            QM1 <= min1; 
        end if;
        loadM1 <= min1 and (not QM1);
    end process;
    
    m10: process(clk,loadM10) begin
        if (rising_edge(clk)) then 
            QM10 <= min10; 
        end if;
        loadM10 <= min10 and (not QM10);
    end process;
    
    sec1_o <= loadS1;
    sec10_o <= loadS10;
    min1_o <= loadM1;
    min10_o <= loadM10;
    
end Behavioral;
