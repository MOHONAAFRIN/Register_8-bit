library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LOAD  : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end register_8bit;

architecture Structural of register_8bit is

    component register_1bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            D     : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

begin

    R0: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(0),
            Q     => Q(0)
        );

    R1: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(1),
            Q     => Q(1)
        );

    R2: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(2),
            Q     => Q(2)
        );

    R3: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(3),
            Q     => Q(3)
        );

    R4: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(4),
            Q     => Q(4)
        );

    R5: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(5),
            Q     => Q(5)
        );

    R6: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(6),
            Q     => Q(6)
        );

    R7: register_1bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D(7),
            Q     => Q(7)
        );

end Structural;