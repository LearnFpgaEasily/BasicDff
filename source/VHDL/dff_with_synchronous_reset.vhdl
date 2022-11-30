library ieee;
use ieee.std_logic_1164.all;

entity dff_all_sync is 
port (
    d   : in std_logic;
    clock : in std_logic;
    reset  : in std_logic;
    enable  : in std_logic;
    q   : out std_logic
);
end entity;

architecture arch of dff_all_sync is

begin

dff :process(clock)
begin 
    if (rising_edge(clock)) then
        if (reset='1') then 
            q <= '0';
        else
            q <= d;
        end if;
    end if;
endprocess;

end architecture;  