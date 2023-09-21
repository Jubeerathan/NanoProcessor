----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 10:41:27 PM
-- Design Name: 
-- Module Name: IDecoder_TB - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IDecoder_TB is
--  Port ( );
end IDecoder_TB;

architecture Behavioral of IDecoder_TB is
component InstructionDecoder
    Port ( ROM_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Select_B : out STD_LOGIC_VECTOR (2 downto 0);
           Enable_Reg : out STD_LOGIC_VECTOR (2 downto 0);
           AddSub : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           ImValue : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal ROM_Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Check_Jump, ImValue : STD_LOGIC_VECTOR (3 downto 0);
signal Select_A, Select_B, Enable_Reg, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
signal AddSub, Jump_Flag,LoadSelect : STD_LOGIC;

begin
UUT: InstructionDecoder 
    PORT MAP(  ROM_Instruction=>ROM_Instruction,
               Check_Jump=>Check_Jump,
               Select_A=>Select_A,
               Select_B =>Select_B,
               Enable_Reg=>Enable_Reg,
               AddSub=>AddSub,
               Jump_Flag=>Jump_Flag,
               Jump_Address=>Jump_Address,
               LoadSelect=>LoadSelect,
               ImValue=>ImValue
    );

process
begin
    Check_Jump<="1110";
    ROM_Instruction<="001011110000"; 
    wait for 100ns; 
    
    Check_Jump<="1010";
    ROM_Instruction<="011110000000"; 
    wait for 100ns; 

    Check_Jump<="1011";
    ROM_Instruction<="101100000111"; 
    wait for 100ns;
    
    Check_Jump<="0000";
    ROM_Instruction<="110110000100"; 
    wait for 100ns; 
    
    Check_Jump<="1010";
    ROM_Instruction<="111110000100"; 
    
    wait for 100ns;  
wait;
end process;
end Behavioral;
