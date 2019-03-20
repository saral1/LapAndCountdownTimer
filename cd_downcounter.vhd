library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity downcounter is
  Generic ( period: integer:= 4;       
            WIDTH  : integer:= 3
		  );
    PORT ( clk    : in  STD_LOGIC;
           pulse    : in  STD_LOGIC;
           reset  : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           zero   : out STD_LOGIC;
           value  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)
         );
end downcounter;

architecture Behavioral of downcounter is
  signal current_count : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
  signal zero_i        : STD_LOGIC; 
  
  constant max_count   : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := 
						STD_LOGIC_VECTOR(to_unsigned(period,WIDTH));
  constant zeros       : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
  constant add: STD_LOGIC_VECTOR(3 downto 0):= "0001";
BEGIN
   
count: process(clk,reset,pulse) begin
    if (rising_edge(clk)) then 
        if (reset = '1') then 
            current_count <= max_count;
            zero_i        <= '0';
        elsif(pulse = '1') then
            current_count <= (current_count + '1');  
            if(current_count = max_count) then
                current_count <= zeros;
            end if;   
        elsif (enable = '1') then 
        if (current_count = zeros) then
            current_count <= max_count;
            zero_i        <= '1';
        else 
            current_count <= current_count - '1'; -- continue counting down
            zero_i        <= '0';
        end if;
        else 
            zero_i <= '0';
        end if;
    end if;

--    if(rising_edge(pulse)) then
--        current_count <= (current_count + add);
--    end if;

    end process;
   
   
   value <= current_count; 
   zero  <= zero_i; 
   
END Behavioral;
