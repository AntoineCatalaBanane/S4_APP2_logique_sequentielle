//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Mon May 25 13:44:37 2026
//Host        : omarchy running 64-bit Arch Linux
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (JPmod,
    clk_100MHz,
    i_btn,
    i_lrc,
    i_recdat,
    i_sw,
    o_param,
    o_pbdat,
    o_sel_fct,
    o_sel_par);
  output [7:0]JPmod;
  input clk_100MHz;
  input [3:0]i_btn;
  input i_lrc;
  input i_recdat;
  input [3:0]i_sw;
  output [7:0]o_param;
  output [0:0]o_pbdat;
  output [1:0]o_sel_fct;
  output [1:0]o_sel_par;

  wire [7:0]JPmod;
  wire clk_100MHz;
  wire [3:0]i_btn;
  wire i_lrc;
  wire i_recdat;
  wire [3:0]i_sw;
  wire [7:0]o_param;
  wire [0:0]o_pbdat;
  wire [1:0]o_sel_fct;
  wire [1:0]o_sel_par;

  design_1 design_1_i
       (.JPmod(JPmod),
        .clk_100MHz(clk_100MHz),
        .i_btn(i_btn),
        .i_lrc(i_lrc),
        .i_recdat(i_recdat),
        .i_sw(i_sw),
        .o_param(o_param),
        .o_pbdat(o_pbdat),
        .o_sel_fct(o_sel_fct),
        .o_sel_par(o_sel_par));
endmodule
