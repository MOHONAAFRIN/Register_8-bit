LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nand_gate_testbench IS
END nand_gate_testbench;

ARCHITECTURE behavior OF nand_gate_testbench IS

    COMPONENT nand_gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN

    -- Unit Under Test
    uut: nand_gate PORT MAP (
        A => A,
        B => B,
        Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin

        -- 00 -> 1
        A <= '0';
        B <= '0';
        wait for 10 ns;

        -- 01 -> 1
        A <= '0';
        B <= '1';
        wait for 10 ns;

        -- 10 -> 1
        A <= '1';
        B <= '0';
        wait for 10 ns;

        -- 11 -> 0
        A <= '1';
        B <= '1';
        wait for 10 ns;

        wait;

    end process;

END;
