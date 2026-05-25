// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Jan 19 12:35:43 2026
// Host        : GEGI-3121-01WIN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/zeln2901/Downloads/pb_logique_seq-vivado2021-h2025/pb_logique_seq.gen/sources_1/bd/design_1/ip/design_1_reg_24b_0_1/design_1_reg_24b_0_1_stub.v
// Design      : design_1_reg_24b_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "reg_24b,Vivado 2024.1" *)
module design_1_reg_24b_0_1(i_clk, i_reset, i_en, i_dat, o_dat)
/* synthesis syn_black_box black_box_pad_pin="i_reset,i_en,i_dat[23:0],o_dat[23:0]" */
/* synthesis syn_force_seq_prim="i_clk" */;
  input i_clk /* synthesis syn_isclock = 1 */;
  input i_reset;
  input i_en;
  input [23:0]i_dat;
  output [23:0]o_dat;
endmodule
