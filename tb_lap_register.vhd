library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_lap_register is
--  Port ( );
end tb_lap_register;

architecture Behavioral of tb_lap_register is
COMPONENT lap_register
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
    
END COMPONENT;


 --Inputs
   signal clk    : STD_LOGIC := '0';
   signal reset  : STD_LOGIC := '0';
   signal lap_time : STD_LOGIC := '0';
   
    signal singleS, singleM : STD_LOGIC_VECTOR(3 downto 0);
    signal tenS, tenM : STD_LOGIC_VECTOR(3 downto 0);
    
    signal sec_dig1    : STD_LOGIC_VECTOR(3 downto 0);
    signal sec_dig2  : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig1 : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig2 : STD_LOGIC_VECTOR(3 downto 0);
    
    signal sec_dig1_L    : STD_LOGIC_VECTOR(3 downto 0);
    signal sec_dig2_L  : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig1_L : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig2_L : STD_LOGIC_VECTOR(3 downto 0);

 -- Clock period definitions
   constant clk_period : time := 100 ns;


begin
    
   uut: lap_register 
   PORT MAP (
                clk  => clk,
                reset    => reset,
                lap => lap_time, 
                sec_dig1 => sec_dig1,
                sec_dig2 => sec_dig2,
                min_dig1 => min_dig1,
                min_dig2 => min_dig2,
                
                L_sec_dig1 => sec_dig1_L,
                L_sec_dig2 => sec_dig2_L,
                L_min_dig1 => min_dig1_L,
                L_min_dig2 => min_dig2_L

            );
    
 -- Clock process definitions
   clk_process :process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
 
 
 -- Stimulus process
  clock: process
  begin      
     -- hold reset state for 100 ns. 
    sec_dig1 <= "0000";
    sec_dig2 <= "0000";
    min_dig1 <= "0000";
    min_dig2 <= "0000";
    wait for 50 ns; 
    
    sec_dig1 <= "0001";
    sec_dig2 <= "0001";
    min_dig1 <= "0001";
    min_dig2 <= "0001";
    wait for 50 ns; 
    
    sec_dig1 <= "0010";
    sec_dig2 <= "0010";
    min_dig1 <= "0010";
    min_dig2 <= "0010";
    wait for 50 ns; 
    
    sec_dig1 <= "0100";
    sec_dig2 <= "0100";
    min_dig1 <= "0100";
    min_dig2 <= "0100";
    wait for 50 ns; 
  end process;
    
    
    laptime: process
    begin      
       -- hold reset state for 100 ns. 
       lap_time <= '0';
       wait for 150 ns;
       lap_time <= '1';
       wait for 100 ns;
       lap_time <= '0';
       wait for 50 ns;
       lap_time <= '1';
       wait;
    end process;
    
end Behavioral;
