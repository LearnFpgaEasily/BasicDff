library ieee;
use ieee.std_logic_1164.all;

entity dff_with_enable is 
port (
    d   : in std_logic;
    clock : in std_logic;
    enable  : in std_logic;
    q   : out std_logic
);
end entity;

architecture arch of dff_with_enable is

begin

dff_enable :process(clock)
begin
    if (rising_edge(clock)) then
        if(enable='1') then
            q<=d;
        end if;
    end if;
endprocess;

end architecture;  