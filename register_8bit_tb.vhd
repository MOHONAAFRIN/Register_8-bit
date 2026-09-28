-------------------------------------------------------------------------------- 
-- Company:  
-- Engineer: 
-- 
-- Create Date:   07:00:09 09/28/2026 
-- Design Name:    
-- Module Name:   /home/ise/vlsi/assignment1/register_8bit_tb.vhd 
-- Project Name:  assignment1 
-- Target Device:   
-- Tool versions:   
-- Description:    
--  
-- VHDL Test Bench Created by ISE for module: register_8bit 
-------------------------------------------------------------------------------- 
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
  
ENTITY register_8bit_tb IS 
END register_8bit_tb; 
  
ARCHITECTURE behavior OF register_8bit_tb IS  
  
    COMPONENT register_8bit 
    PORT( 
         CLK   : IN  std_logic; 
         RESET : IN  std_logic; 
         LOAD  : IN  std_logic; 
         D     : IN  std_logic_vector(7 downto 0); 
         Q     : OUT std_logic_vector(7 downto 0) 
        ); 
    END COMPONENT; 
     
    -- Inputs 
    signal CLK   : std_logic := '0'; 
    signal RESET : std_logic := '0'; 
    signal LOAD  : std_logic := '0'; 
    signal D     : std_logic_vector(7 downto 0) := (others => '0'); 
 
    -- Outputs 
    signal Q : std_logic_vector(7 downto 0); 
 
    -- Clock period definitions 
    constant CLK_period : time := 10 ns; 
  
BEGIN 
  
    -- Instantiate the Unit Under Test (UUT) 
    uut: register_8bit PORT MAP ( 
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
        D     <= "00000000";
        wait for 20 ns;

        -- 2. Store 10101010
        RESET <= '0';
        LOAD  <= '1';
        D     <= "10101010";
        wait for 20 ns;

        -- 3. HOLD previous value
        LOAD  <= '0';
        D     <= "11111111";
        wait for 20 ns;

        -- 4. Store 11001100
        LOAD  <= '1';
        D     <= "11001100";
        wait for 20 ns;

        -- 5. HOLD previous value
        LOAD  <= '0';
        D     <= "00001111";
        wait for 20 ns;

        -- 6. Store 11110000
        LOAD  <= '1';
        D     <= "11110000";
        wait for 20 ns;

        -- 7. RESET again
        RESET <= '1';
        LOAD  <= '0';
        D     <= "11111111";
        wait for 20 ns;

        -- 8. Finish simulation
        wait;

    end process; 
 
END;