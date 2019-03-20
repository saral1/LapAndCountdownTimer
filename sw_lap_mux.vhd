----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 01:17:39 PM
-- Design Name: 
-- Module Name: sw_lap_mux - Behavioral
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

entity sw_lap_mux is
    PORT ( 
        selector       : in  STD_LOGIC;
          
        sec_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        sec_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
      
        L_sec_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        L_sec_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        L_min_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        L_min_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        
        sec_one   : out  STD_LOGIC_VECTOR(3 downto 0);
        sec_ten   : out  STD_LOGIC_VECTOR(3 downto 0);
        min_one   : out  STD_LOGIC_VECTOR(3 downto 0);
        min_ten   : out  STD_LOGIC_VECTOR(3 downto 0)
        
    );
end sw_lap_mux;

architecture Behavioral of sw_lap_mux is
    
begin

    mux : process(selector) begin 
        if(selector = '0') then
            sec_one <= sec_dig1;
            sec_ten <= sec_dig2;
            min_one <= min_dig1;
            min_ten <= min_dig2;
        else
            sec_one <= L_sec_dig1;
            sec_ten <= L_sec_dig2;
            min_one <= L_min_dig1;
            min_ten <= L_min_dig2;
            
        end if;
    end process;
end Behavioral;
