// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Jan 19 12:34:41 2026
// Host        : GEGI-3121-01WIN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/zeln2901/Downloads/pb_logique_seq-vivado2021-h2025/pb_logique_seq.gen/sources_1/bd/design_1/ip/design_1_mux2_0_0/design_1_mux2_0_0_stub.v
// Design      : design_1_mux2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mux2,Vivado 2024.1" *)
module design_1_mux2_0_0(sel, input1, input2, output0)
/* synthesis syn_black_box black_box_pad_pin="sel[1:0],input1[23:0],input2[23:0],output0[23:0]" */;
  input [1:0]sel;
  input [23:0]input1;
  input [23:0]input2;
  output [23:0]output0;
endmodule
