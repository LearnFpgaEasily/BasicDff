library ieee;
use ieee.std_logic_1164.all;

entity simple_dff is 
port (
    d   : in std_logic;
    clock: in std_logic;
    q  : out std_logic
);
end entity;

architecture arch of simple_dff is

begin

dff :process(clock)
begin
    if (rising_edge(clock)) then
        q <= d;
    end if;
endprocess;

end architecture;  
