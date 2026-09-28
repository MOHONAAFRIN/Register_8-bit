library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr_latch is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        QN : out STD_LOGIC
    );
end sr_latch;

architecture Structural of sr_latch is

    signal q_int  : STD_LOGIC;
    signal qn_int : STD_LOGIC;

begin

    q_int  <= S NAND qn_int;
    qn_int <= R NAND q_int;

    Q  <= q_int;
    QN <= qn_int;

end Structural;