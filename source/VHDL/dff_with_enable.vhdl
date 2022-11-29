library ieee;
use ieee.std_logic_1164.all;

entity dff_with_enable is 
port (
    D   : in std_logic;
    CLK : in std_logic;
    CE  : in std_logic;
    Q   : out std_logic
);
end entity;

architecture arch of dff_with_enable is

begin

dff_CE : process(CLK)
begin
    if (rising_edge(CLK)) then
        if(CE='1') then
            Q<=D;
        end if;
    end if;
end process;

end architecture;  