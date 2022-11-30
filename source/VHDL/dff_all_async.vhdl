library ieee;
use ieee.std_logic_1164.all;

entity simple_dff is 
port (
    d       : in std_logic;
    clock   : in std_logic;
    reset   : in std_logic;
    enable  : in std_logic;
    q       : out std_logic
);
end entity;

architecture arch of simple_dff is

begin

dff : process(clock, reset)
begin
    if (reset='1') then 
        q <= '0';
    elsif (rising_edge(clock)) then 
        if(enable='1') then
            q <= d;
        end if;
    end if;
endprocess;

end architecture;  