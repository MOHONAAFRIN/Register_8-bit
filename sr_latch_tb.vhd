LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sr_latch_tb IS
END sr_latch_tb;

ARCHITECTURE behavior OF sr_latch_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT sr_latch
    PORT(
         S  : IN  std_logic;
         R  : IN  std_logic;
         Q  : OUT std_logic;
         QN : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal S : std_logic := '1';
    signal R : std_logic := '1';

    -- Outputs
    signal Q  : std_logic;
    signal QN : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)

    uut: sr_latch PORT MAP (
          S  => S,
          R  => R,
          Q  => Q,
          QN => QN
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Initial state: HOLD
        S <= '1';
        R <= '1';
        wait for 20 ns;

        -- SET
        S <= '0';
        R <= '1';
        wait for 20 ns;

        -- HOLD
        S <= '1';
        R <= '1';
        wait for 20 ns;

        -- RESET
        S <= '1';
        R <= '0';
        wait for 20 ns;

        -- HOLD
        S <= '1';
        R <= '1';
        wait for 20 ns;

        -- Invalid condition for NAND SR latch
        S <= '0';
        R <= '0';
        wait for 20 ns;

        -- Return to HOLD
        S <= '1';
        R <= '1';
        wait for 20 ns;

        wait;

    end process;

END;