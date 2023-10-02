-- Name : Shadeeb Hossain
--ID: sh7492
-- This is a test bench for a down counter


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity down_counter_tb is
end down_counter_tb;

architecture tb_architecture of down_counter_tb is
    signal clk       : STD_LOGIC := '0';
    signal rst       : STD_LOGIC := '0';
    signal cnt_ent   : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal cnt       : STD_LOGIC_VECTOR(5 downto 0);

    constant clk_period : time := 10 ns; -- Adjust as needed

    signal stop_simulation : boolean := false; -- Declare stop_simulation signal

begin
    -- Instantiate the down_counter
    uut : entity work.down_counter
        port map (
            clk     => clk,
            rst     => rst,
            cnt_ent => cnt_ent,
            cnt     => cnt
        );

    -- Clock process
    process
    begin
        while not stop_simulation loop
            clk <= not clk;
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        rst <= '1'; -- Reset initially
        wait for 10 ns;
        rst <= '0'; -- Deassert reset

        -- Test various scenarios
        wait for 20 ns;
        cnt_ent <= "01"; -- Set counter to down mode
        wait for 100 ns;

        cnt_ent <= "10"; -- Set counter to up mode
        wait for 100 ns;

        cnt_ent <= "00"; -- Stop the counter
        wait for 100 ns;

        cnt_ent <= "01"; -- Set counter to down mode again
        wait for 100 ns;

        -- Add more test cases as needed

        stop_simulation <= true;
        wait;
    end process;

end tb_architecture;

--In this test bench:

--The down_counter entity is instantiated as "uut," and its ports are connected to signals for testing.

--A clock generation process toggles the clock signal at a specified period.

--A stimulus process controls the reset signal and the "cnt_ent" signal to test different scenarios. 
--It resets the counter, sets it to down mode, up mode, and stops it at various time intervals.

--The "stop_simulation" flag is used to stop the simulation after all test cases have been executed.

--You may need to adjust the simulation time intervals and clock period based on your requirements.
-- Make sure to compile and simulate this test bench along with your down counter design to verify its functionality.