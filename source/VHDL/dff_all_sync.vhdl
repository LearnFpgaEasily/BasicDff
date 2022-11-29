library ieee;
use ieee.std_logic_1164.all;

entity dff_all_sync is 
port (
    D   : in std_logic;
    CLK : in std_logic;
    SR  : in std_logic;
    CE  : in std_logic;
    Q   : out std_logic
);
end entity;

architecture arch of dff_all_sync is

begin

dff : process(CLK)
begin
    if (rising_edge(CLK)) then
        if (SR='1') then 
            Q <= '0';
        elsif(CE='1') then
            Q <= D;
        end if;
    end if;
end process;

end architecture;  