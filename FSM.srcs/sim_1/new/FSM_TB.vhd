----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/29/2025 12:02:50 AM
-- Design Name: 
-- Module Name: FSM_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
  
entity FSM_TB is
end entity;
  
architecture sim of FSM_TB is
  
    -- We are using a low clock frequency to speed up the simulation
    constant ClockFrequencyHz : integer := 100; -- 100 Hz
    constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
      
    signal Clk         : std_logic := '1';
    signal nRst        : std_logic := '0';
    signal NorthRed    : std_logic;
    signal NorthYellow : std_logic;
    signal NorthGreen  : std_logic;
    signal WestRed     : std_logic;
    signal WestYellow  : std_logic;
    signal WestGreen   : std_logic;
  
begin
  
    -- The Device Under Test (DUT)
    i_TrafficLights : entity work.FSM(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        Clk         => Clk,
        nRst        => nRst,
        NorthRed    => NorthRed,
        NorthYellow => NorthYellow,
        NorthGreen  => NorthGreen,
        WestRed     => WestRed,
        WestYellow  => WestYellow,
        WestGreen   => WestGreen);
  
  
    -- Process for generating clock
    Clk <= not Clk after ClockPeriod / 2;
  
    -- Testbench sequence
    process is
    begin
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
      
        -- Take the DUT out of reset
        nRst <= '1';
      
        wait;
    end process;
      
end architecture;