-- This file needs editing by students

library IEEE;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;

entity cd_clock_divider is
    PORT ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           enable   : in  STD_LOGIC;
           
           sec1 : in STD_LOGIC;
           sec10 : in STD_LOGIC;
           min1 : in STD_LOGIC;
           min10 : in STD_LOGIC;
           
           sec_dig1 : out STD_LOGIC_VECTOR(3 downto 0);
           sec_dig2 : out STD_LOGIC_VECTOR(3 downto 0);
           min_dig1 : out STD_LOGIC_VECTOR(3 downto 0);
           min_dig2 : out STD_LOGIC_VECTOR(3 downto 0)
           );
end cd_clock_divider;

architecture Behavioral of cd_clock_divider is
-- Signals:
signal hundredhertz : STD_LOGIC;
signal onehertz, tensseconds, onesminutes, singlesec : STD_LOGIC;
signal singleSeconds, singleMinutes : STD_LOGIC_VECTOR(3 downto 0);
signal tenSeconds, tensMinutes : STD_LOGIC_VECTOR(3 downto 0);

constant add: STD_LOGIC_VECTOR(3 downto 0):= "0001";

-- Components declarations
component downcounter is
   Generic ( period : integer:= 4;
             WIDTH  : integer:= 3
           );
      PORT (  clk    : in  STD_LOGIC;
              pulse    : in  STD_LOGIC;
              reset  : in  STD_LOGIC;
              enable : in  STD_LOGIC;
              zero   : out STD_LOGIC;
              value  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
           );
end component;

--sddhjjh
signal falseEnable :  STD_LOGIC;

BEGIN
   
   oneHzClock: downcounter
   generic map(
               period => (100000000),   -- divide by 100_000_000 to divide 100 MHz down to 1 Hz 
--               period => (10),   -- divide by 100_000_000 to divide 100 MHz down to 1 Hz    
               WIDTH  => 28             -- 28 bits are required to hold the binary value of 101111101011110000100000000
              )
   PORT MAP (
               clk    => clk,
               pulse => '0',
               reset  => reset,
               enable => falseEnable,
               zero   => onehertz, -- this is a 1 Hz clock signal
               value  => open  -- Leave open since we won't display this value
            );
   
   singleSecondsClock: downcounter
   generic map(
--               period => (10),   -- Counts numbers between 0 and 9 -> that's 10 values!
               period => (9),
               WIDTH  => 4
              )
   PORT MAP (
               clk    => clk,
               pulse => sec1,
               reset => reset,
               enable => onehertz,
               zero   => singlesec,
               value  => singleSeconds -- binary value of seconds we decode to drive the 7-segment display        
            );
   
-- Students fill in the VHDL code between these two lines
-- The missing code is instantiations of upcounter (like above) as needed.
-- Take a hint from the clock_divider entity description's port map.
--==============================================
    tensSecondsClock: downcounter
       generic map(
                  -- period => (6),   -- Counts numbers between 0 and 9 -> that's 10 values!
                   period => (5),
                   WIDTH  => 4
                  )
       PORT MAP (
                   clk    => clk,
                   pulse => sec10,
                   reset  => reset,
                   enable => singlesec,
                   zero   => tensseconds,
                   value  => tenSeconds -- binary value of seconds we decode to drive the 7-segment display        
            );
            
            
      singleMinClock: downcounter
           generic map(
                       --period => (10),   -- Counts numbers between 0 and 9 -> that's 10 values!
                       period => (9),
                       WIDTH  => 4
                      )
           PORT MAP (
                       clk    => clk,
                       pulse => min1,
                       reset  => reset,
                       enable => tensseconds,
                       zero   => onesminutes,
                       value  => singleMinutes -- binary value of seconds we decode to drive the 7-segment display        
           );
                        
                        
        tensMinClock: downcounter
           generic map(
                       --period => (6),   -- Counts numbers between 0 and 9 -> that's 10 values!
                       period => (5),
                       WIDTH  => 4
                      )
           PORT MAP (
                       clk    => clk,
                       pulse => min10,
                       reset  => reset,
                       enable => onesminutes,
                       zero   => open,
                       value  => tensMinutes -- binary value of seconds we decode to drive the 7-segment display        
            );
                   
--============================================== 

--   This is where u see the impulse from the inputs
--   s1: process(sec1) begin
--        if(rising_edge(sec1)) then
--            singleSeconds <= (singleSeconds + add);
--        end if;

--    end process; 
    
--    s10: process(sec10) begin
--        if(rising_edge(sec10)) then
--            tenSeconds <= (tenSeconds + add);
--        end if;
--    end process; 
        
--    m1: process(min1) begin
--        if(rising_edge(min1)) then
--            singleMinutes <= (singleMinutes + add);
--        end if;
--    end process; 
            
--    m10: process(min10) begin
--        if(rising_edge(min10)) then
--            tensMinutes <= (tensMinutes + add);
--        end if;
--    end process; 
    
   -- Connect internal signals to outputs

    STOPPING: process(enable) begin
    falseEnable <= enable;
    if( singleSeconds = "0000" and tenSeconds = "0000" and singleMinutes = "0000" and tensMinutes = "0000") then
        falseEnable <= '0';
    end if;
   end process;
   sec_dig1 <= singleSeconds;
   
-- Students fill in the VHDL code between these two lines
-- The missing code is internal signal conections to outputs as needed, following the pattern of the previous statement.
-- Take a hint from the signal declarartions below architecture.
--==============================================
   sec_dig2 <= tenSeconds;
   min_dig1 <= singleMinutes;
   min_dig2 <= tensMinutes;
--============================================== 

   
END Behavioral;