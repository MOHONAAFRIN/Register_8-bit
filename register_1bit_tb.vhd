-------------------------------------------------------------------------------- 
-- Company:  
-- Engineer: 
-- 
-- Create Date:   06:55:34 09/28/2026 
-- Design Name:    
-- Module Name:   /home/ise/vlsi/assignment1/register_1bit_tb.vhd 
-- Project Name:  assignment1 
-- Target Device:   
-- Tool versions:   
-- Description:    
--  
-- VHDL Test Bench Created by ISE for module: register_1bit 
-------------------------------------------------------------------------------- 
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
  
ENTITY register_1bit_tb IS 
END register_1bit_tb; 
  
ARCHITECTURE behavior OF register_1bit_tb IS  
  
    COMPONENT register_1bit 
    PORT( 
         CLK   : IN  std_logic; 
         RESET : IN  std_logic; 
         LOAD  : IN  std_logic; 
         D     : IN  std_logic; 
         Q     : OUT std_logic 
        ); 
    END COMPONENT; 
     
    -- Inputs 
    signal CLK   : std_logic := '0'; 
    signal RESET : std_logic := '0'; 
    signal LOAD  : std_logic := '0'; 
    signal D     : std_logic := '0'; 
 
    -- Outputs 
    signal Q : std_logic; 
 
    -- Clock period 
    constant CLK_period : time := 10 ns; 
  
BEGIN 
  
    -- Instantiate the Unit Under Test (UUT) 
    uut: register_1bit PORT MAP ( 
          CLK   => CLK, 
          RESET => RESET, 
          LOAD  => LOAD, 
          D     => D, 
          Q     => Q 
        ); 
 
    -- Clock process 
    CLK_process :process 
    begin 
        CLK <= '0'; 
        wait for CLK_period/2; 
        CLK <= '1'; 
        wait for CLK_period/2; 
    end process; 
  
    -- Stimulus process 
    stim_proc: process 
    begin		 

        -- 1. RESET
        RESET <= '1';
        LOAD  <= '0';
        D     <= '0';
        wait for 20 ns;

        -- 2. Release RESET, LOAD = 1, store D = 1
        RESET <= '0';
        LOAD  <= '1';
        D     <= '1';
        wait for 20 ns;

        -- 3. LOAD = 0, Q should HOLD previous value
        LOAD  <= '0';
        D     <= '0';
        wait for 20 ns;

        -- 4. LOAD = 1, store D = 0
        LOAD  <= '1';
        D     <= '0';
        wait for 20 ns;

        -- 5. LOAD = 0, Q should HOLD 0
        LOAD  <= '0';
        D     <= '1';
        wait for 20 ns;

        -- 6. RESET again
        RESET <= '1';
        LOAD  <= '0';
        D     <= '1';
        wait for 20 ns;

        -- 7. Finish simulation
        wait;

    end process; 
 
END;