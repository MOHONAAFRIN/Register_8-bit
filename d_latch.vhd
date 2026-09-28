library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
    Port (
        D  : in  STD_LOGIC;
        EN : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        QN : out STD_LOGIC
    );
end d_latch;

architecture Structural of d_latch is

    signal D_not : STD_LOGIC;
    signal S     : STD_LOGIC;
    signal R     : STD_LOGIC;
    signal Q_int : STD_LOGIC;
    signal QN_int : STD_LOGIC;

begin

    -- NOT D using NAND gate
    D_not <= D NAND D;

    -- Generate active-low S and R
    S <= D NAND EN;
    R <= D_not NAND EN;

    -- NAND-based SR Latch
    Q_int  <= S NAND QN_int;
    QN_int <= R NAND Q_int;

    -- Outputs
    Q  <= Q_int;
    QN <= QN_int;

end Structural;