LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_latch_tb IS
END d_latch_tb;

ARCHITECTURE behavior OF d_latch_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT d_latch
    PORT(
         D  : IN  std_logic;
         EN : IN  std_logic;
         Q  : OUT std_logic;
         QN : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal D  : std_logic := '0';
    signal EN : std_logic := '0';

    -- Outputs
    signal Q  : std_logic;
    signal QN : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)

    uut: d_latch PORT MAP (
          D  => D,
          EN => EN,
          Q  => Q,
          QN => QN
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- EN = 0, D = 0
        -- HOLD
        D  <= '0';
        EN <= '0';
        wait for 20 ns;

        -- EN = 1, D = 0
        -- Q should become 0
        D  <= '0';
        EN <= '1';
        wait for 20 ns;

        -- EN = 1, D = 1
        -- Q should become 1
        D  <= '1';
        EN <= '1';
        wait for 20 ns;

        -- EN = 0, D = 0
        -- Q should remain 1 (HOLD)
        D  <= '0';
        EN <= '0';
        wait for 20 ns;

        -- EN = 1, D = 0
        -- Q should become 0
        D  <= '0';
        EN <= '1';
        wait for 20 ns;

        -- EN = 0, D = 1
        -- Q should remain 0 (HOLD)
        D  <= '1';
        EN <= '0';
        wait for 20 ns;

        wait;

    end process;

END;