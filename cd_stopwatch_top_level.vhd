-- This file needs editing by students

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity countdown_top_level is
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
end countdown_top_level;

architecture Behavioral of countdown_top_level is
-- Internal signal names have to go here
signal in_DP, out_DP : STD_LOGIC;
signal an_i : STD_LOGIC_VECTOR(3 downto 0);
signal digit_to_display : STD_LOGIC_VECTOR(3 downto 0);

signal sec_dig1_i, sec_dig2_i, min_dig1_i, min_dig2_i, digit_select_i : STD_LOGIC_VECTOR(3 downto 0);
signal CA_i, CB_i, CC_i, CD_i, CE_i, CF_i, CG_i : STD_LOGIC;

signal in_S1, in_S10, in_M1, in_M10 : STD_LOGIC;
-- Declare components here:
component cd_seven_segment_digit_selector is
    PORT ( clk          : in  STD_LOGIC;
           digit_select : out  STD_LOGIC_VECTOR (3 downto 0);
           an_outputs : out  STD_LOGIC_VECTOR (3 downto 0);
           reset        : in  STD_LOGIC
          );
end component;

component cd_clock_divider is
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
end component;


component cd_inputs is
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
end component;

-- Students fill in the VHDL code between these two lines
-- The missing code is component declarations, as needed.
-- Hint, follow the pattern above.
--==============================================
component cd_digit_multiplexor is
    PORT (sec_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
          sec_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
          min_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
          min_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
          selector   : in  STD_LOGIC_VECTOR(3 downto 0);
          
          led1:        out STD_LOGIC;
          
          time_digit : out STD_LOGIC_VECTOR(3 downto 0)
          );

end component;

component cd_seven_segment_decoder is
    PORT (CA   : out  STD_LOGIC;
          CB   : out  STD_LOGIC;
          CC   : out  STD_LOGIC;
          CD   : out  STD_LOGIC;
          CE   : out  STD_LOGIC;
          CF : out STD_LOGIC;
          CG : out STD_LOGIC;
          DP : out STD_LOGIC;
          dp_in : in STD_LOGIC;
          data : in STD_LOGIC_VECTOR(3 downto 0)
          );

end component;

--============================================== 

BEGIN
   -- Instantiate components here:
   CD_DIGIT_MUX : cd_digit_multiplexor
   PORT MAP( 
             sec_dig1   => sec_dig1_i,  
             sec_dig2   => sec_dig2_i, 
             min_dig1   => min_dig1_i,  
             min_dig2   => min_dig2_i,  
             selector   => digit_select_i,
             time_digit => digit_to_display,
             
             led1 => led1_CD

           );
   CD_SELECTOR : cd_seven_segment_digit_selector
   PORT MAP( clk          => clk,
             digit_select => digit_select_i, 
             an_outputs   => an_i,
             reset        => reset
           );
             
-- Students fill in the VHDL code between these two lines
-- The missing code is component instantiations, as needed.
-- Hint, follow the pattern above.
--clk      : in  STD_LOGIC;
--           reset    : in  STD_LOGIC;
--           enable   : in  STD_LOGIC;
--           sec_dig1 : out STD_LOGIC_VECTOR(3 downto 0);
--           sec_dig2 : out STD_LOGIC_VECTOR(3 downto 0);
--           min_dig1 : out STD_LOGIC_VECTOR(3 downto 0);
--           min_dig2 : out STD_LOGIC_VECTOR(3 downto 0)  
--==============================================
   CD_CLOCK_DIV : cd_clock_divider
   PORT MAP( clk          => clk,
             reset => reset,
             enable => SW_START,
             
             sec1 => in_S1,
             sec10 => in_S10,
             min1 => in_M1,
             min10 => in_M10,
             
             sec_dig1 => sec_dig1_i,
             sec_dig2 => sec_dig2_i,
             min_dig1 => min_dig1_i,
             min_dig2 => min_dig2_i                    
           );
    CD_inny: cd_inputs
    PORT MAP(
        clk => clk,
        
        sec1 => insec1,
        sec10 => insec10,
        min1 => inmin1,
        min10 => inmin10,
        
        sec1_o => in_S1,
        sec10_o => in_S10,
        min1_o => in_M1,
        min10_o => in_M10
    );
          
    CD_DECODER : cd_seven_segment_decoder
          PORT MAP( 
                      CA   => CA_i,
                      CB   => CB_i,
                      CC   => CC_i,
                      CD   => CD_i,
                      CE   => CE_i,
                      CF => CF_i,
                      CG => CG_i,
                      DP => out_DP,
                      dp_in => in_DP,
                      data => digit_to_display
                  );
--============================================== 
   
   
   -- Connect internal signals to outputs here:
   DP <= out_dp;
   CA <= CA_i;
   CB <= CB_i;
   CC <= CC_i;
   CD <= CD_i;
   CE <= CE_i;
   CF <= CF_i;
   CG <= CG_i;
   
   in_dp <= an_i(2); -- have the decimal point light up in the third digit of the 7-segment display (i.e. minutes digit)
 
   AN1 <= an_i(0); -- seconds digit
   AN2 <= an_i(1); -- tens of seconds digit
   AN3 <= an_i(2); -- minutes digit
   AN4 <= an_i(3); -- tens of minutes digit

END Behavioral;

