//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Wed May 27 15:42:00 2026
//Host        : GEGI-3016-12WIN running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module M1_decodeur_i2s_imp_17RYJKZ
   (clk,
    i_data,
    i_lrc,
    i_reset,
    o_dat_left,
    o_dat_right,
    o_str_dat);
  input clk;
  input i_data;
  input i_lrc;
  input i_reset;
  output [23:0]o_dat_left;
  output [23:0]o_dat_right;
  output o_str_dat;

  wire clk_1;
  wire [6:0]compteur_nbits_0_o_val_cpt;
  wire i_data_1;
  wire i_lrc_1;
  wire i_reset_1;
  wire mef_decod_i2s_v1b_0_o_bit_enable;
  wire mef_decod_i2s_v1b_0_o_cpt_bit_reset;
  wire mef_decod_i2s_v1b_0_o_load_left;
  wire mef_decod_i2s_v1b_0_o_load_right;
  wire mef_decod_i2s_v1b_0_o_str_dat;
  wire [23:0]reg_24b_0_o_dat;
  wire [23:0]reg_24b_1_o_dat;
  wire [23:0]reg_dec_24b_0_o_dat;
  wire [0:0]xlconstant_0_dout;
  wire [23:0]xlconstant_1_dout;

  assign clk_1 = clk;
  assign i_data_1 = i_data;
  assign i_lrc_1 = i_lrc;
  assign i_reset_1 = i_reset;
  assign o_dat_left[23:0] = reg_24b_1_o_dat;
  assign o_dat_right[23:0] = reg_24b_0_o_dat;
  assign o_str_dat = mef_decod_i2s_v1b_0_o_str_dat;
  design_1_mef_decod_i2s_v1b_0_0 MEF_decodeur_i2s
       (.i_bclk(clk_1),
        .i_cpt_bits(compteur_nbits_0_o_val_cpt),
        .i_lrc(i_lrc_1),
        .i_reset(i_reset_1),
        .o_bit_enable(mef_decod_i2s_v1b_0_o_bit_enable),
        .o_cpt_bit_reset(mef_decod_i2s_v1b_0_o_cpt_bit_reset),
        .o_load_left(mef_decod_i2s_v1b_0_o_load_left),
        .o_load_right(mef_decod_i2s_v1b_0_o_load_right),
        .o_str_dat(mef_decod_i2s_v1b_0_o_str_dat));
  design_1_compteur_nbits_0_0 compteur_7bits
       (.clk(clk_1),
        .i_en(mef_decod_i2s_v1b_0_o_bit_enable),
        .o_val_cpt(compteur_nbits_0_o_val_cpt),
        .reset(mef_decod_i2s_v1b_0_o_cpt_bit_reset));
  design_1_reg_24b_0_0 registre_24bits_droite
       (.i_clk(clk_1),
        .i_dat(reg_dec_24b_0_o_dat),
        .i_en(mef_decod_i2s_v1b_0_o_load_right),
        .i_reset(i_reset_1),
        .o_dat(reg_24b_0_o_dat));
  design_1_reg_24b_0_1 registre_24bits_gauche
       (.i_clk(clk_1),
        .i_dat(reg_dec_24b_0_o_dat),
        .i_en(mef_decod_i2s_v1b_0_o_load_left),
        .i_reset(i_reset_1),
        .o_dat(reg_24b_1_o_dat));
  design_1_reg_dec_24b_0_0 registre_decalage_24bits
       (.i_clk(clk_1),
        .i_dat_bit(i_data_1),
        .i_dat_load(xlconstant_1_dout),
        .i_en(mef_decod_i2s_v1b_0_o_bit_enable),
        .i_load(xlconstant_0_dout),
        .i_reset(i_reset_1),
        .o_dat(reg_dec_24b_0_o_dat));
  design_1_xlconstant_0_2 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlconstant_0_3 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule

module M9_codeur_i2s_imp_1VJCTGL
   (i_bclk,
    i_dat_left,
    i_dat_right,
    i_lrc,
    i_reset,
    o_dat);
  input i_bclk;
  input [23:0]i_dat_left;
  input [23:0]i_dat_right;
  input i_lrc;
  input i_reset;
  output [0:0]o_dat;

  wire [6:0]compteur_nbits_0_o_val_cpt;
  wire i_bclk_0_1;
  wire i_lrc_0_1;
  wire i_reset_0_1;
  wire [23:0]input1_0_1;
  wire [23:0]input2_0_1;
  wire mef_cod_i2s_vsb_0_o_bit_enable;
  wire mef_cod_i2s_vsb_0_o_cpt_bit_reset;
  wire mef_cod_i2s_vsb_0_o_load_left;
  wire mef_cod_i2s_vsb_0_o_load_right;
  wire [23:0]mux2_0_output;
  wire [23:0]reg_dec_24b_fd_0_o_dat;
  wire [0:0]util_vector_logic_0_Res;
  wire [1:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlslice_0_Dout;

  assign i_bclk_0_1 = i_bclk;
  assign i_lrc_0_1 = i_lrc;
  assign i_reset_0_1 = i_reset;
  assign input1_0_1 = i_dat_left[23:0];
  assign input2_0_1 = i_dat_right[23:0];
  assign o_dat[0] = xlslice_0_Dout;
  design_1_compteur_nbits_0_1 compteur_nbits_0
       (.clk(i_bclk_0_1),
        .i_en(mef_cod_i2s_vsb_0_o_bit_enable),
        .o_val_cpt(compteur_nbits_0_o_val_cpt),
        .reset(mef_cod_i2s_vsb_0_o_cpt_bit_reset));
  design_1_mef_cod_i2s_vsb_0_0 mef_cod_i2s_vsb_0
       (.i_bclk(i_bclk_0_1),
        .i_cpt_bits(compteur_nbits_0_o_val_cpt),
        .i_lrc(i_lrc_0_1),
        .i_reset(i_reset_0_1),
        .o_bit_enable(mef_cod_i2s_vsb_0_o_bit_enable),
        .o_cpt_bit_reset(mef_cod_i2s_vsb_0_o_cpt_bit_reset),
        .o_load_left(mef_cod_i2s_vsb_0_o_load_left),
        .o_load_right(mef_cod_i2s_vsb_0_o_load_right));
  design_1_mux2_0_0 mux2_0
       (.input1(input1_0_1),
        .input2(input2_0_1),
        .output0(mux2_0_output),
        .sel(xlconcat_0_dout));
  design_1_reg_dec_24b_fd_0_0 reg_dec_24b_fd_0
       (.i_clk(i_bclk_0_1),
        .i_dat_bit(xlconstant_0_dout),
        .i_dat_load(mux2_0_output),
        .i_en(mef_cod_i2s_vsb_0_o_bit_enable),
        .i_load(util_vector_logic_0_Res),
        .i_reset(i_reset_0_1),
        .o_dat(reg_dec_24b_fd_0_o_dat));
  design_1_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(mef_cod_i2s_vsb_0_o_load_left),
        .Op2(mef_cod_i2s_vsb_0_o_load_right),
        .Res(util_vector_logic_0_Res));
  design_1_xlconcat_0_0 xlconcat_0
       (.In0(mef_cod_i2s_vsb_0_o_load_left),
        .In1(mef_cod_i2s_vsb_0_o_load_right),
        .dout(xlconcat_0_dout));
  design_1_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlslice_0_0 xlslice_0
       (.Din(reg_dec_24b_fd_0_o_dat),
        .Dout(xlslice_0_Dout));
endmodule

/* Modules à modifier:
MEF_decodeur_i2s (dans M1_decodeur_i2s)
M5_parametre_1
M6_parametre_2
M8_commande
Pour plus de clarté, vous pouvez cacher les fils pour les horloges
et les resets dans les paramètres (engrenage en haut a droite de cette fenêtre).
 */
(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=28,numReposBlks=26,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=18,numPkgbdBlks=0,bdsource=USER,\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"da_clkrst_cnt\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  input [3:0]i_btn;
  input i_lrc;
  input i_recdat;
  input [3:0]i_sw;
  output [7:0]o_param;
  output [0:0]o_pbdat;
  output [1:0]o_sel_fct;
  output [1:0]o_sel_par;

  wire [7:0]M10_conversion_affichage_JPmod;
  wire [3:0]M8_commande_o_btn_cd;
  wire [1:0]M8_commande_o_selection_par;
  wire [0:0]M9_codeur_i2s_o_dat;
  wire [7:0]calcul_param_1_0_o_param;
  wire [7:0]calcul_param_2_0_o_param;
  wire [7:0]calcul_param_3_0_o_param;
  wire clk_1;
  wire [23:0]decodeur_i2s_o_dat_right;
  wire decodeur_i2s_o_str_dat;
  wire [3:0]i_btn_1;
  wire [23:0]i_dat_left_1;
  wire [23:0]i_dat_right_1;
  wire i_data_1;
  wire i_lrc_1;
  wire i_reset_1;
  wire [3:0]i_sw_1;
  wire [1:0]module_commande_0_o_selection_fct;
  wire [7:0]mux4_1_output;
  wire [23:0]sig_fct_3_0_o_ech_fct;
  wire [23:0]sig_fct_sat_dure_0_o_ech_fct;
  wire [23:0]sig_fct_sat_dure_1_o_ech_fct;
  wire [7:0]xlconstant_0_dout;

  assign JPmod[7:0] = M10_conversion_affichage_JPmod;
  assign clk_1 = clk_100MHz;
  assign i_btn_1 = i_btn[3:0];
  assign i_data_1 = i_recdat;
  assign i_lrc_1 = i_lrc;
  assign i_sw_1 = i_sw[3:0];
  assign o_param[7:0] = mux4_1_output;
  assign o_pbdat[0] = M9_codeur_i2s_o_dat;
  assign o_sel_fct[1:0] = module_commande_0_o_selection_fct;
  assign o_sel_par[1:0] = M8_commande_o_selection_par;
  design_1_affhexPmodSSD_v3_0_0 M10_conversion_affichage
       (.DA(mux4_1_output),
        .JPmod(M10_conversion_affichage_JPmod),
        .clk(clk_1),
        .i_btn(M8_commande_o_btn_cd),
        .reset(i_reset_1));
  M1_decodeur_i2s_imp_17RYJKZ M1_decodeur_i2s
       (.clk(clk_1),
        .i_data(i_data_1),
        .i_lrc(i_lrc_1),
        .i_reset(i_reset_1),
        .o_dat_left(i_dat_left_1),
        .o_dat_right(decodeur_i2s_o_dat_right),
        .o_str_dat(decodeur_i2s_o_str_dat));
  design_1_sig_fct_sat_dure_0_0 M2_fonction_distortion_dure1
       (.i_ech(decodeur_i2s_o_dat_right),
        .o_ech_fct(sig_fct_sat_dure_0_o_ech_fct));
  design_1_sig_fct_sat_dure_0_1 M3_fonction_distorsion_dure2
       (.i_ech(decodeur_i2s_o_dat_right),
        .o_ech_fct(sig_fct_sat_dure_1_o_ech_fct));
  design_1_sig_fct_3_0_0 M4_fonction3
       (.i_ech(decodeur_i2s_o_dat_right),
        .o_ech_fct(sig_fct_3_0_o_ech_fct));
  design_1_calcul_param_1_0_0 M5_parametre_1
       (.i_bclk(clk_1),
        .i_ech(i_dat_right_1),
        .i_en(decodeur_i2s_o_str_dat),
        .i_reset(i_reset_1),
        .o_param(calcul_param_1_0_o_param));
  design_1_calcul_param_2_0_0 M6_parametre_2
       (.i_bclk(clk_1),
        .i_ech(i_dat_right_1),
        .i_en(decodeur_i2s_o_str_dat),
        .i_reset(i_reset_1),
        .o_param(calcul_param_2_0_o_param));
  design_1_calcul_param_3_0_0 M7_parametre_3
       (.i_bclk(clk_1),
        .i_ech(i_dat_right_1),
        .i_en(decodeur_i2s_o_str_dat),
        .i_reset(i_reset_1),
        .o_param(calcul_param_3_0_o_param));
  design_1_module_commande_0_0 M8_commande
       (.clk(clk_1),
        .i_btn(i_btn_1),
        .i_sw(i_sw_1),
        .o_btn_cd(M8_commande_o_btn_cd),
        .o_reset(i_reset_1),
        .o_selection_fct(module_commande_0_o_selection_fct),
        .o_selection_par(M8_commande_o_selection_par));
  M9_codeur_i2s_imp_1VJCTGL M9_codeur_i2s
       (.i_bclk(clk_1),
        .i_dat_left(i_dat_left_1),
        .i_dat_right(i_dat_right_1),
        .i_lrc(i_lrc_1),
        .i_reset(i_reset_1),
        .o_dat(M9_codeur_i2s_o_dat));
  design_1_mux4_0_0 Multiplexeur_choix_fonction
       (.input0(decodeur_i2s_o_dat_right),
        .input1(sig_fct_sat_dure_0_o_ech_fct),
        .input2(sig_fct_sat_dure_1_o_ech_fct),
        .input3(sig_fct_3_0_o_ech_fct),
        .output0(i_dat_right_1),
        .sel(module_commande_0_o_selection_fct));
  design_1_mux4_0_1 Multiplexeur_choix_parametre
       (.input0(xlconstant_0_dout),
        .input1(calcul_param_1_0_o_param),
        .input2(calcul_param_2_0_o_param),
        .input3(calcul_param_3_0_o_param),
        .output0(mux4_1_output),
        .sel(M8_commande_o_selection_par));
  design_1_xlconstant_0_0 parametre_0
       (.dout(xlconstant_0_dout));
endmodule
