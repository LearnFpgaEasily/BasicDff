library ieee;
use ieee.std_logic_1164.all;

entity simple_dff is 
port (
    d   : in std_logic;
    clk: in std_logic;
    q  : out std_logic
);
end entity;

architecture arch of simple_dff is

begin

dff : process(clk)
begin
    if (rising_edge(clk)) then
        q <= d;
    end if;
end process;

end architecture;  
