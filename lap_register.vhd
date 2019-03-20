----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 12:43:42 PM
-- Design Name: 
-- Module Name: lap_register - Behavioral
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

entity lap_register is
    PORT ( 
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        lap       : in  STD_LOGIC;
          
        sec_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        sec_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        
        L_sec_dig1   : out  STD_LOGIC_VECTOR(3 downto 0);
        L_sec_dig2   : out  STD_LOGIC_VECTOR(3 downto 0);
        L_min_dig1   : out  STD_LOGIC_VECTOR(3 downto 0);
        L_min_dig2   : out  STD_LOGIC_VECTOR(3 downto 0)  
    );
end lap_register;

architecture Behavioral of lap_register is

signal Q        : STD_LOGIC;  
signal load        : STD_LOGIC; 
signal sec_dig1_o, sec_dig2_o,min_dig1_o,min_dig2_o   :   STD_LOGIC_VECTOR(3 downto 0);  

begin
    pulse: process(clk,reset,lap) begin
        if (rising_edge(clk)) then 
            Q <= lap; 
        end if;
        load <= lap and (not Q);
        
    end process;
    store: process(clk, reset,load) begin
        if(reset = '1') then
            sec_dig1_o <= "0000";  
            sec_dig2_o <= "0000";  
            min_dig1_o <= "0000";    
            min_dig2_o <= "0000";  
        elsif(rising_edge(load)) then
            sec_dig1_o <= sec_dig1;  
            sec_dig2_o <= sec_dig2;  
            min_dig1_o <= min_dig1;  
            min_dig2_o <= min_dig2;  
        end if;
    end process; 
    L_sec_dig1 <= sec_dig1_o;
    L_sec_dig2 <= sec_dig2_o;
    L_min_dig1 <= min_dig1_o;
    L_min_dig2 <= min_dig2_o;

end Behavioral;
