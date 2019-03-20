----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2018 02:47:25 PM
-- Design Name: 
-- Module Name: lab3_toplevel - Behavioral
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

entity lab3_toplevel is
    PORT(
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
end lab3_toplevel;

architecture Behavioral of lab3_toplevel is
    component input_demux is
        PORT(  
            clk      : in  STD_LOGIC;
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
    
    end component;
    component countdown_top_level is
        PORT(
               clk      : in  STD_LOGIC;
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
    end component;
    
    component stopwatch_top_level is
        PORT ( clk      : in  STD_LOGIC;
               reset    : in  STD_LOGIC;
               SW_START : in  STD_LOGIC;
               lap_time : in  STD_LOGIC;
               
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
    end component;
    
    component output_mux is
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
    end component;
    
    signal clk_i , reset_i, sw_start_i: STD_LOGIC;
    signal clk_o , reset_o, sw_start_o: STD_LOGIC;
    

    signal sec1_o , sec10_o, min1_o, min10_o: STD_LOGIC;
    
    signal lap_time_i : STD_LOGIC;
    signal lap_time_o : STD_LOGIC;
    signal led1_i : STD_LOGIC;
    signal led1_o : STD_LOGIC;
    signal CD_START_o : STD_LOGIC;
    
    signal CA_SW , CB_SW, CC_SW, CD_SW, CE_SW , CF_SW, CG_SW, DP_SW , AN1_SW, AN2_SW ,AN3_SW, AN4_SW: STD_LOGIC;
    signal CA_CD , CB_CD, CC_CD, CD_CD, CE_CD , CF_CD, CG_CD, DP_CD , AN1_CD, AN2_CD ,AN3_CD, AN4_CD: STD_LOGIC;
    signal CA_o, CB_o, CC_o, CD_o, CE_o, CF_o, CG_o, DP_o, AN1_o, AN2_o, AN3_o, AN4_o : STD_LOGIC;
begin
    
    INPUT_MULTI: input_demux 
        PORT MAP(  
            clk      => clk,
            reset    => reset,
            mode     => mode,
            SW_START => SW_START,
            lap_time => lap_time,
            
            
            insec1   => insec1,
            insec10  => insec10,
            inmin1   => inmin1,
            inmin10   => inmin10,
            
            clk_out       => clk_o,
            reset_out     => reset_o,
            SW_START_out  => sw_start_o,
            CD_START_out  => CD_START_o,
            Lap_time_out  => lap_time_o,
            insec1_out    => sec1_o,
            insec10_out   => sec10_o,
            inmin1_out    => min1_o,
            inmin10_out   => min10_o
        );


    STOPWATCH: stopwatch_top_level
    PORT MAP(
    
        clk      => clk_o,
        reset    => reset_o,
        SW_START => sw_start_o,
        lap_time => lap_time_o,
        
        CA       => CA_SW,
        CB       => CB_SW,
        CC       => CC_SW,
        CD       => CD_SW,
        CE       => CE_SW,
        CF       => CF_SW,
        CG       => CG_SW,
        DP       => DP_SW,
        AN1       => AN1_SW,
        AN2       => AN2_SW,
        AN3       => AN3_SW,
        AN4      => AN4_SW
        
    );
    COUNTDOWN: countdown_top_level
    PORT MAP(
    
        clk      => clk_o,
        reset    => reset_o,
        SW_START => CD_START_o,
        
        insec1   => sec1_o,
        insec10   => sec10_o,
        inmin1   => min1_o,
        inmin10   => min10_o,
        
        led1_CD => led1_i,
        
        CA       => CA_CD,
        CB       => CB_CD,
        CC       => CC_CD,
        CD       => CD_CD,
        CE       => CE_CD,
        CF       => CF_CD,
        CG       => CG_CD,
        DP       => DP_CD,
        AN1       => AN1_CD,
        AN2       => AN2_CD,
        AN3       => AN3_CD,
        AN4      => AN4_CD
    );
    
    OUTPUT_MULTI: output_mux
    PORT MAP(
        mode      => mode,
        
        CA1       => CA_SW,
        CB1       => CB_SW,
        CC1       => CC_SW,
        CD1       => CD_SW,
        CE1       => CE_SW,
        CF1       => CF_SW,
        CG1       => CG_SW,
        DP1       => DP_SW,
        AN1_1       => AN1_SW,
        AN2_1       => AN2_SW,
        AN3_1       => AN3_SW,
        AN4_1      => AN4_SW,
        
        CA2       => CA_CD,
        CB2       => CB_CD,
        CC2       => CC_CD,
        CD2       => CD_CD,
        CE2       => CE_CD,
        CF2       => CF_CD,
        CG2       => CG_CD,
        DP2       => DP_CD,
        AN1_2       => AN1_CD,
        AN2_2       => AN2_CD,
        AN3_2       => AN3_CD,
        AN4_2      => AN4_CD,
        
        LED1_in => led1_i,
        
        CA       => CA_o,
        CB       => CB_o,
        CC       => CC_o,
        CD       => CD_o,
        CE       => CE_o,
        CF       => CF_o,
        CG       => CG_o,
        DP       => DP_o,
        AN1       => AN1_o,
        AN2       => AN2_o,
        AN3       => AN3_o,
        AN4      => AN4_o,
        LED1_out     => led1_o  
);    
      
    CA       <= CA_o;
    CB       <= CB_o;
    CC       <= CC_o;
    CD       <= CD_o;
    CE       <= CE_o;
    CF       <= CF_o;
    CG       <= CG_o;
    DP       <= DP_o;
    AN1       <= AN1_o;
    AN2       <= AN2_o;
    AN3       <= AN3_o;
    AN4      <= AN4_o;
    LED1     <= led1_o;  

end Behavioral;
