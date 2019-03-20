----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2018 01:33:38 PM
-- Design Name: 
-- Module Name: input_demux - Behavioral
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

entity input_demux is
    PORT(  clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           mode     : in  STD_LOGIC; --0 for stopwatch, 1 for countdown
           SW_START : in  STD_LOGIC;
           lap_time : in  STD_LOGIC;

           
           insec1   : in  STD_LOGIC;
           insec10   : in  STD_LOGIC;
           inmin1   : in  STD_LOGIC;
           inmin10   : in  STD_LOGIC;
           
           clk_out       : out STD_LOGIC;
           reset_out     : out STD_LOGIC;
           SW_START_out  : out STD_LOGIC;
           CD_START_out  : out STD_LOGIC;
           Lap_time_out  : out STD_LOGIC;
           insec1_out    : out STD_LOGIC;
           insec10_out   : out STD_LOGIC;
           inmin1_out    : out STD_LOGIC;
           inmin10_out   : out STD_LOGIC
    );
    
end input_demux;

architecture Behavioral of input_demux is

    --common


    
begin

--    component countdown_top_level is
--        PORT(
--               clk      : in  STD_LOGIC;
--               reset    : in  STD_LOGIC;
--               SW_START : in  STD_LOGIC;
               
--               insec1   : in  STD_LOGIC;
--               insec10   : in  STD_LOGIC;
--               inmin1   : in  STD_LOGIC;
--               inmin10   : in  STD_LOGIC;
               
--               led1:        out STD_LOGIC;
               
--               CA       : out STD_LOGIC;
--               CB       : out STD_LOGIC;
--               CC       : out STD_LOGIC;
--               CD       : out STD_LOGIC;
--               CE       : out STD_LOGIC;
--               CF       : out STD_LOGIC;
--               CG       : out STD_LOGIC;
--               DP       : out STD_LOGIC;
--               AN1      : out STD_LOGIC;
--               AN2      : out STD_LOGIC;
--               AN3      : out STD_LOGIC;
--               AN4      : out STD_LOGIC
--        );
--    end component;
    
--    component stopwatch_top_level is
--        PORT ( clk      : in  STD_LOGIC;
--               reset    : in  STD_LOGIC;
--               SW_START : in  STD_LOGIC;
--               lap_time : in  STD_LOGIC;
               
--               CA       : out STD_LOGIC;
--               CB       : out STD_LOGIC;
--               CC       : out STD_LOGIC;
--               CD       : out STD_LOGIC;
--               CE       : out STD_LOGIC;
--               CF       : out STD_LOGIC;
--               CG       : out STD_LOGIC;
--               DP       : out STD_LOGIC;
--               AN1      : out STD_LOGIC;
--               AN2      : out STD_LOGIC;
--               AN3      : out STD_LOGIC;
--               AN4      : out STD_LOGIC
--             );
--    end component;
    
    
--begin
--    STOPWATCH: stopwatch_top_level
--    PORT MAP(
        
--        clk      => clk_to_module,
--        reset    => reset_to_module,
--        SW_START => sw_start_module,
--        lap_time => lap_time_in,
        
--        CA       : out STD_LOGIC;
--        CB       : out STD_LOGIC;
--        CC       : out STD_LOGIC;
--        CD       : out STD_LOGIC;
--        CE       : out STD_LOGIC;
--        CF       : out STD_LOGIC;
--        CG       : out STD_LOGIC;
--        DP       : out STD_LOGIC;
--        AN1      : out STD_LOGIC;
--        AN2      : out STD_LOGIC;
--        AN3      : out STD_LOGIC;
--        AN4      : out STD_LOGIC
--    );
    mode_switch: process(mode,SW_START) begin
        if(mode = '0') then
            SW_START_out <= SW_START;
            CD_START_out <= '0';
        else
            CD_START_out <= SW_START;
            SW_START_out <= '0';
        end if;
    end process;
    clk_out       <= clk;
    reset_out     <= reset;
    Lap_time_out  <= lap_time;
    insec1_out    <= insec1;
    insec10_out   <= insec10;
    inmin1_out    <= inmin1;
    inmin10_out   <= inmin10;

end Behavioral;
