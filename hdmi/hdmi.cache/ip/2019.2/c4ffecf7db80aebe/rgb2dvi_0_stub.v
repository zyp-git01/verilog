// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Nov  9 19:57:10 2020
// Host        : zhangyi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rgb2dvi_0_stub.v
// Design      : rgb2dvi_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "rgb2dvi,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(TMDS_Clk_p, TMDS_Clk_n, TMDS_Data_p, 
  TMDS_Data_n, aRst, vid_pData, vid_pVDE, vid_pHSync, vid_pVSync, PixelClk)
/* synthesis syn_black_box black_box_pad_pin="TMDS_Clk_p,TMDS_Clk_n,TMDS_Data_p[2:0],TMDS_Data_n[2:0],aRst,vid_pData[23:0],vid_pVDE,vid_pHSync,vid_pVSync,PixelClk" */;
  output TMDS_Clk_p;
  output TMDS_Clk_n;
  output [2:0]TMDS_Data_p;
  output [2:0]TMDS_Data_n;
  input aRst;
  input [23:0]vid_pData;
  input vid_pVDE;
  input vid_pHSync;
  input vid_pVSync;
  input PixelClk;
endmodule
