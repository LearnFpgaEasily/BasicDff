library ieee;
use ieee.std_logic_1164.all;

entity simple_dff is 
port (
    D   : in std_logic;
    CLK : in std_logic;
    Q   : out std_logic
);
end entity;

architecture arch of simple_dff is

begin

dff : process(CLK)
begin
    if (rising_edge(CLK)) then
        Q<=D;
    end if;
end process;

end architecture;  
