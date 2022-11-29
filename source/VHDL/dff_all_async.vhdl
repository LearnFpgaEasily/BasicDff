library ieee;
use ieee.std_logic_1164.all;

entity simple_dff is 
port (
    D   : in std_logic;
    CLK : in std_logic;
    SR  : in std_logic;
    CE  : in std_logic;
    Q   : out std_logic
);
end entity;

architecture arch of simple_dff is

begin

dff : process(CLK, SR)
begin
    if (SR='1') then 
        Q <= '0';
    elsif (rising_edge(CLK)) then 
        if(CE='1') then
            Q <= D;
        end if;
    end if;
end process;

end architecture;  