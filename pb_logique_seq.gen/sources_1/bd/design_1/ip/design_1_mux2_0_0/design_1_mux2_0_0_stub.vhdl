-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Jan 19 12:34:41 2026
-- Host        : GEGI-3121-01WIN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/zeln2901/Downloads/pb_logique_seq-vivado2021-h2025/pb_logique_seq.gen/sources_1/bd/design_1/ip/design_1_mux2_0_0/design_1_mux2_0_0_stub.vhdl
-- Design      : design_1_mux2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_mux2_0_0 is
  Port ( 
    sel : in STD_LOGIC_VECTOR ( 1 downto 0 );
    input1 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    input2 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    output0 : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );

end design_1_mux2_0_0;

architecture stub of design_1_mux2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "sel[1:0],input1[23:0],input2[23:0],output0[23:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "mux2,Vivado 2024.1";
begin
end;
