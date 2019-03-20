----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2018 03:59:35 PM
-- Design Name: 
-- Module Name: tb_sw - Behavioral
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

entity tb_sw is
--  Port ( );
end tb_sw;

architecture Behavioral of tb_sw is
COMPONENT sw_lap_mux
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
    
END COMPONENT;

    signal lap_time : STD_LOGIC := '0';
    
    signal sec_dig1_i    : STD_LOGIC_VECTOR(3 downto 0);
    signal sec_dig2_i  : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig1_i : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig2_i : STD_LOGIC_VECTOR(3 downto 0);
    
    signal sec_dig1_L    : STD_LOGIC_VECTOR(3 downto 0);
    signal sec_dig2_L  : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig1_L : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig2_L : STD_LOGIC_VECTOR(3 downto 0);
    
    signal sec_one_o   :   STD_LOGIC_VECTOR(3 downto 0);
    signal sec_ten_o   :   STD_LOGIC_VECTOR(3 downto 0);
    signal min_one_o   :   STD_LOGIC_VECTOR(3 downto 0);
    signal min_ten_o   :   STD_LOGIC_VECTOR(3 downto 0);
begin
uut: sw_lap_mux
    PORT MAP (

        selector => lap_time, 
        
        sec_dig1 => sec_dig1_i,
        sec_dig2 => sec_dig2_i,
        min_dig1 => min_dig1_i,
        min_dig2 => min_dig2_i,
        
        L_sec_dig1 => sec_dig1_L,
        L_sec_dig2 => sec_dig2_L,
        L_min_dig1 => min_dig1_L,
        L_min_dig2 => min_dig2_L,
        
        sec_one => sec_one_o,
        sec_ten => sec_ten_o,
        min_one => min_one_o,
        min_ten => min_ten_o
    
    );
    
    clockInput: process begin
            sec_dig1_i <= "0000";
            sec_dig2_i <= "0000";
            min_dig1_i <= "0000";
            min_dig2_i <= "0000";
            wait for 50 ns; 
    end process;
        
    stopWatch: process begin
        sec_dig1_L <= "1111";
        sec_dig2_L <= "1111";
        min_dig1_L <= "1111";
        min_dig2_L <= "1111";
        wait for 50 ns;
    end process;
    
    lapTime: process begin
        lap_time <= '0';
        wait for 200 ns;
        lap_time <= '1';
        wait for 200 ns;
    end process;

end Behavioral;
