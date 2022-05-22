module ct_ifu_ras(
  input         cp0_ifu_icg_en,
  input         cp0_ifu_ras_en,
  input         cp0_yy_clk_en,
  input  [1:0]  cp0_yy_priv_mode,
  input         cpurst_b,
  input         forever_cpuclk,
  input         ibctrl_ras_inst_pcall,
  input         ibctrl_ras_pcall_vld,
  input         ibctrl_ras_pcall_vld_for_gateclk,
  input         ibctrl_ras_preturn_vld,
  input         ibctrl_ras_preturn_vld_for_gateclk,
  input  [38:0] ibdp_ras_push_pc,
  input         pad_yy_icg_scan_en,
  input         rtu_ifu_flush,
  input  [38:0] rtu_ifu_retire0_inc_pc,
  input         rtu_ifu_retire0_mispred,
  input         rtu_ifu_retire0_pcall,
  input         rtu_ifu_retire0_preturn,
  output        ras_ipdp_data_vld,
  output [38:0] ras_ipdp_pc,
  output [38:0] ras_l0_btb_pc,
  output [38:0] ras_l0_btb_push_pc,
  output        ras_l0_btb_ras_push
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
`endif // RANDOMIZE_REG_INIT
  wire  m_rtu_ptr_upd_clk_clk_in; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_global_en; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_module_en; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_local_en; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_external_en; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 117:33]
  wire  m_rtu_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 117:33]
  wire  m_top_ptr_upd_clk_clk_in; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_global_en; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_module_en; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_local_en; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_external_en; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 159:33]
  wire  m_top_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 159:33]
  wire  m_status_ptr_upd_clk_clk_in; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_global_en; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_module_en; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_local_en; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_external_en; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 206:36]
  wire  m_status_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 206:36]
  wire  gated_clk_cell_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_1_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_2_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_3_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_4_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_clk_in; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_global_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_module_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_local_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_external_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 222:49]
  wire  gated_clk_cell_5_clk_out; // @[ct_ifu_ras.scala 222:49]
  wire  m_rtu_fifo_ptr_upd_clk_clk_in; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_global_en; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_module_en; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_local_en; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_external_en; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 266:38]
  wire  m_rtu_fifo_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 266:38]
  wire  gated_clk_cell_6_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_6_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_7_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_8_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_9_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_10_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_11_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_12_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_13_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_14_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_15_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_16_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_clk_in; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_global_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_module_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_local_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_external_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 275:50]
  wire  gated_clk_cell_17_clk_out; // @[ct_ifu_ras.scala 275:50]
  wire  _T = rtu_ifu_retire0_pcall & rtu_ifu_retire0_preturn; // @[ct_ifu_ras.scala 92:33]
  wire  rtu_ptr_upd_clk = m_rtu_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 83:29 ct_ifu_ras.scala 119:19]
  wire  _T_19 = ~cpurst_b; // @[ct_ifu_ras.scala 108:61]
  reg [4:0] rtu_ptr; // @[ct_ifu_ras.scala 109:28]
  wire  _T_2 = rtu_ptr[3:0] == 4'hb; // @[ct_ifu_ras.scala 95:23]
  wire  _T_4 = ~rtu_ptr[4]; // @[ct_ifu_ras.scala 96:26]
  wire [4:0] _T_5 = {_T_4,4'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_7 = rtu_ptr + 5'h1; // @[ct_ifu_ras.scala 98:30]
  wire [4:0] _GEN_0 = _T_2 ? _T_5 : _T_7; // @[ct_ifu_ras.scala 95:33]
  wire  status_ptr_upd_clk = m_status_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 50:32 ct_ifu_ras.scala 213:22]
  reg [4:0] status_ptr; // @[ct_ifu_ras.scala 184:31]
  wire  rtu_ras_empty = rtu_ptr == status_ptr; // @[ct_ifu_ras.scala 107:29]
  wire  _T_8 = ~rtu_ras_empty; // @[ct_ifu_ras.scala 100:44]
  wire  _T_9 = rtu_ifu_retire0_preturn & _T_8; // @[ct_ifu_ras.scala 100:41]
  wire  _T_11 = rtu_ptr[3:0] == 4'h0; // @[ct_ifu_ras.scala 101:23]
  wire [4:0] _T_14 = {_T_4,4'hb}; // @[Cat.scala 29:58]
  wire [4:0] _T_16 = rtu_ptr - 5'h1; // @[ct_ifu_ras.scala 104:30]
  wire [4:0] _GEN_1 = _T_11 ? _T_14 : _T_16; // @[ct_ifu_ras.scala 101:32]
  wire [4:0] _GEN_2 = _T_9 ? _GEN_1 : rtu_ptr; // @[ct_ifu_ras.scala 100:60]
  wire [4:0] _GEN_3 = rtu_ifu_retire0_pcall ? _GEN_0 : _GEN_2; // @[ct_ifu_ras.scala 94:40]
  wire [4:0] rtu_ptr_pre = _T ? rtu_ptr : _GEN_3; // @[ct_ifu_ras.scala 92:64]
  wire  _T_22 = rtu_ifu_retire0_pcall | rtu_ifu_retire0_preturn; // @[ct_ifu_ras.scala 127:72]
  wire  _T_24 = ibctrl_ras_pcall_vld & ibctrl_ras_preturn_vld; // @[ct_ifu_ras.scala 133:23]
  wire  top_ptr_upd_clk = m_top_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 89:29 ct_ifu_ras.scala 161:19]
  reg [4:0] top_ptr; // @[ct_ifu_ras.scala 151:28]
  wire  _T_26 = top_ptr[3:0] == 4'hb; // @[ct_ifu_ras.scala 136:23]
  wire  _T_28 = ~top_ptr[4]; // @[ct_ifu_ras.scala 137:26]
  wire [4:0] _T_29 = {_T_28,4'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_31 = top_ptr + 5'h1; // @[ct_ifu_ras.scala 139:30]
  wire  ras_empty = top_ptr == status_ptr; // @[ct_ifu_ras.scala 216:25]
  wire  _T_32 = ~ras_empty; // @[ct_ifu_ras.scala 141:25]
  wire  _T_33 = ibctrl_ras_preturn_vld & _T_32; // @[ct_ifu_ras.scala 141:22]
  wire  _T_35 = top_ptr[3:0] == 4'h0; // @[ct_ifu_ras.scala 142:23]
  wire [4:0] _T_38 = {_T_28,4'hb}; // @[Cat.scala 29:58]
  wire [4:0] _T_40 = top_ptr - 5'h1; // @[ct_ifu_ras.scala 145:30]
  wire  top_entry_rtu_updt = rtu_ifu_retire0_mispred | rtu_ifu_flush; // @[ct_ifu_ras.scala 173:52]
  wire  _T_45 = top_entry_rtu_updt | ibctrl_ras_pcall_vld_for_gateclk; // @[ct_ifu_ras.scala 170:25]
  wire  _T_46 = _T_45 | ibctrl_ras_preturn_vld_for_gateclk; // @[ct_ifu_ras.scala 171:43]
  wire  _T_50 = status_ptr[3:0] == 4'hb; // @[ct_ifu_ras.scala 178:24]
  wire [4:0] _T_51 = ~status_ptr; // @[ct_ifu_ras.scala 179:27]
  wire [8:0] _T_52 = {_T_51,4'h0}; // @[Cat.scala 29:58]
  wire [4:0] _T_54 = status_ptr + 5'h1; // @[ct_ifu_ras.scala 181:34]
  wire [8:0] _GEN_13 = _T_50 ? _T_52 : {{4'd0}, _T_54}; // @[ct_ifu_ras.scala 178:34]
  wire  _T_58 = cp0_ifu_ras_en & top_entry_rtu_updt; // @[ct_ifu_ras.scala 186:28]
  wire  _T_61 = rtu_ptr_pre[4] ^ top_ptr[4]; // @[ct_ifu_ras.scala 187:27]
  wire [4:0] _T_64 = {status_ptr[4],rtu_ptr_pre[3:0]}; // @[Cat.scala 29:58]
  wire  _T_79 = ~status_ptr[4]; // @[ct_ifu_ras.scala 217:32]
  wire [4:0] _T_81 = {_T_79,status_ptr[3:0]}; // @[Cat.scala 29:58]
  wire  ras_full = top_ptr == _T_81; // @[ct_ifu_ras.scala 217:24]
  wire  _T_65 = cp0_ifu_ras_en & ras_full; // @[ct_ifu_ras.scala 192:34]
  wire  _T_66 = _T_65 & ibctrl_ras_pcall_vld; // @[ct_ifu_ras.scala 192:46]
  wire  _T_67 = _T_66 & ibctrl_ras_preturn_vld; // @[ct_ifu_ras.scala 192:58]
  wire  _T_71 = _T_65 & ibctrl_ras_preturn_vld; // @[ct_ifu_ras.scala 196:46]
  wire  _T_73 = status_ptr[3:0] == 4'h0; // @[ct_ifu_ras.scala 197:28]
  wire [4:0] _T_75 = status_ptr - 5'h1; // @[ct_ifu_ras.scala 200:38]
  wire [3:0] status_ptr_pre = _GEN_13[3:0]; // @[ct_ifu_ras.scala 49:28 ct_ifu_ras.scala 179:20 ct_ifu_ras.scala 181:20]
  wire  _T_84 = _T_65 & ibctrl_ras_pcall_vld_for_gateclk; // @[ct_ifu_ras.scala 218:58]
  wire  _T_86 = _T_65 & ibctrl_ras_preturn_vld_for_gateclk; // @[ct_ifu_ras.scala 219:35]
  wire  _T_87 = _T_84 | _T_86; // @[ct_ifu_ras.scala 218:97]
  wire  rtu_entry_upd_clk_0 = gated_clk_cell_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_0; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_0; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_0; // @[ct_ifu_ras.scala 234:42]
  wire  _T_96 = cp0_ifu_ras_en & rtu_ifu_retire0_pcall; // @[ct_ifu_ras.scala 238:30]
  wire  _T_103 = rtu_ptr[3:0] == 4'h6; // @[ct_ifu_ras.scala 249:66]
  wire  rtu_entry_push_0 = _T_11 | _T_103; // @[ct_ifu_ras.scala 249:49]
  wire  _T_97 = _T_96 & rtu_entry_push_0; // @[ct_ifu_ras.scala 238:58]
  wire  _T_98 = rtu_ifu_retire0_pcall & rtu_entry_push_0; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_entry_upd_clk_1 = gated_clk_cell_1_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_1; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_1; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_1; // @[ct_ifu_ras.scala 234:42]
  wire  _T_118 = rtu_ptr[3:0] == 4'h1; // @[ct_ifu_ras.scala 249:40]
  wire  _T_120 = rtu_ptr[3:0] == 4'h7; // @[ct_ifu_ras.scala 249:66]
  wire  rtu_entry_push_1 = _T_118 | _T_120; // @[ct_ifu_ras.scala 249:49]
  wire  _T_114 = _T_96 & rtu_entry_push_1; // @[ct_ifu_ras.scala 238:58]
  wire  _T_115 = rtu_ifu_retire0_pcall & rtu_entry_push_1; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_entry_upd_clk_2 = gated_clk_cell_2_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_2; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_2; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_2; // @[ct_ifu_ras.scala 234:42]
  wire  _T_135 = rtu_ptr[3:0] == 4'h2; // @[ct_ifu_ras.scala 249:40]
  wire  _T_137 = rtu_ptr[3:0] == 4'h8; // @[ct_ifu_ras.scala 249:66]
  wire  rtu_entry_push_2 = _T_135 | _T_137; // @[ct_ifu_ras.scala 249:49]
  wire  _T_131 = _T_96 & rtu_entry_push_2; // @[ct_ifu_ras.scala 238:58]
  wire  _T_132 = rtu_ifu_retire0_pcall & rtu_entry_push_2; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_entry_upd_clk_3 = gated_clk_cell_3_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_3; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_3; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_3; // @[ct_ifu_ras.scala 234:42]
  wire  _T_152 = rtu_ptr[3:0] == 4'h3; // @[ct_ifu_ras.scala 249:40]
  wire  _T_154 = rtu_ptr[3:0] == 4'h9; // @[ct_ifu_ras.scala 249:66]
  wire  rtu_entry_push_3 = _T_152 | _T_154; // @[ct_ifu_ras.scala 249:49]
  wire  _T_148 = _T_96 & rtu_entry_push_3; // @[ct_ifu_ras.scala 238:58]
  wire  _T_149 = rtu_ifu_retire0_pcall & rtu_entry_push_3; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_entry_upd_clk_4 = gated_clk_cell_4_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_4; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_4; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_4; // @[ct_ifu_ras.scala 234:42]
  wire  _T_169 = rtu_ptr[3:0] == 4'h4; // @[ct_ifu_ras.scala 249:40]
  wire  _T_171 = rtu_ptr[3:0] == 4'ha; // @[ct_ifu_ras.scala 249:66]
  wire  rtu_entry_push_4 = _T_169 | _T_171; // @[ct_ifu_ras.scala 249:49]
  wire  _T_165 = _T_96 & rtu_entry_push_4; // @[ct_ifu_ras.scala 238:58]
  wire  _T_166 = rtu_ifu_retire0_pcall & rtu_entry_push_4; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_entry_upd_clk_5 = gated_clk_cell_5_clk_out; // @[ct_ifu_ras.scala 67:31 ct_ifu_ras.scala 230:26]
  reg [38:0] rtu_entry_pc_5; // @[ct_ifu_ras.scala 232:35]
  reg  rtu_entry_filled_5; // @[ct_ifu_ras.scala 233:39]
  reg [1:0] rtu_entry_priv_mode_5; // @[ct_ifu_ras.scala 234:42]
  wire  _T_186 = rtu_ptr[3:0] == 4'h5; // @[ct_ifu_ras.scala 249:40]
  wire  rtu_entry_push_5 = _T_186 | _T_2; // @[ct_ifu_ras.scala 249:49]
  wire  _T_182 = _T_96 & rtu_entry_push_5; // @[ct_ifu_ras.scala 238:58]
  wire  _T_183 = rtu_ifu_retire0_pcall & rtu_entry_push_5; // @[ct_ifu_ras.scala 248:54]
  wire  rtu_fifo_ptr_upd_clk = m_rtu_fifo_ptr_upd_clk_clk_out; // @[ct_ifu_ras.scala 81:34 ct_ifu_ras.scala 273:24]
  reg [3:0] rtu_fifo_ptr; // @[ct_ifu_ras.scala 258:33]
  wire [4:0] _T_196 = rtu_ifu_retire0_pcall ? rtu_ptr : {{1'd0}, rtu_fifo_ptr}; // @[ct_ifu_ras.scala 264:26]
  wire [3:0] rtu_fifo_ptr_pre = _T_196[3:0]; // @[ct_ifu_ras.scala 80:30 ct_ifu_ras.scala 264:20]
  wire  ras_entry_upd_clk_0 = gated_clk_cell_6_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_0; // @[ct_ifu_ras.scala 286:35]
  wire  _T_209 = rtu_fifo_ptr_pre == 4'h5; // @[ct_ifu_ras.scala 320:44]
  wire  _T_210 = rtu_fifo_ptr_pre == 4'h4; // @[ct_ifu_ras.scala 321:25]
  wire  _T_211 = _T_209 | _T_210; // @[ct_ifu_ras.scala 320:59]
  wire  _T_212 = rtu_fifo_ptr_pre == 4'h3; // @[ct_ifu_ras.scala 322:25]
  wire  _T_213 = _T_211 | _T_212; // @[ct_ifu_ras.scala 321:40]
  wire  _T_214 = rtu_fifo_ptr_pre == 4'h2; // @[ct_ifu_ras.scala 323:25]
  wire  _T_215 = _T_213 | _T_214; // @[ct_ifu_ras.scala 322:40]
  wire  _T_216 = rtu_fifo_ptr_pre == 4'h1; // @[ct_ifu_ras.scala 324:25]
  wire  _T_217 = _T_215 | _T_216; // @[ct_ifu_ras.scala 323:40]
  wire  _T_218 = rtu_fifo_ptr_pre == 4'h0; // @[ct_ifu_ras.scala 325:25]
  wire  rtu_entry_copy_0 = _T_217 | _T_218; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_0; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_0; // @[ct_ifu_ras.scala 306:39]
  wire  _T_207 = top_entry_rtu_updt & rtu_entry_copy_0; // @[ct_ifu_ras.scala 309:31]
  wire  _T_208 = ibctrl_ras_pcall_vld & _T_35; // @[ct_ifu_ras.scala 312:27]
  wire  _GEN_44 = _T_208 | ras_entry_filled_0; // @[ct_ifu_ras.scala 312:45]
  wire  _T_223 = ibctrl_ras_pcall_vld_for_gateclk & _T_35; // @[ct_ifu_ras.scala 328:43]
  wire  _T_224 = _T_207 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_1 = gated_clk_cell_7_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_1; // @[ct_ifu_ras.scala 286:35]
  wire  _T_236 = rtu_fifo_ptr_pre == 4'h6; // @[ct_ifu_ras.scala 320:44]
  wire  _T_238 = _T_236 | _T_209; // @[ct_ifu_ras.scala 320:59]
  wire  _T_240 = _T_238 | _T_210; // @[ct_ifu_ras.scala 321:40]
  wire  _T_242 = _T_240 | _T_212; // @[ct_ifu_ras.scala 322:40]
  wire  _T_244 = _T_242 | _T_214; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_1 = _T_244 | _T_216; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_1; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_1; // @[ct_ifu_ras.scala 306:39]
  wire  _T_234 = top_entry_rtu_updt & rtu_entry_copy_1; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_52 = _T_208 | ras_entry_filled_1; // @[ct_ifu_ras.scala 312:45]
  wire  _T_251 = _T_234 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_2 = gated_clk_cell_8_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_2; // @[ct_ifu_ras.scala 286:35]
  wire  _T_263 = rtu_fifo_ptr_pre == 4'h7; // @[ct_ifu_ras.scala 320:44]
  wire  _T_265 = _T_263 | _T_236; // @[ct_ifu_ras.scala 320:59]
  wire  _T_267 = _T_265 | _T_209; // @[ct_ifu_ras.scala 321:40]
  wire  _T_269 = _T_267 | _T_210; // @[ct_ifu_ras.scala 322:40]
  wire  _T_271 = _T_269 | _T_212; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_2 = _T_271 | _T_214; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_2; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_2; // @[ct_ifu_ras.scala 306:39]
  wire  _T_261 = top_entry_rtu_updt & rtu_entry_copy_2; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_60 = _T_208 | ras_entry_filled_2; // @[ct_ifu_ras.scala 312:45]
  wire  _T_278 = _T_261 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_3 = gated_clk_cell_9_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_3; // @[ct_ifu_ras.scala 286:35]
  wire  _T_290 = rtu_fifo_ptr_pre == 4'h8; // @[ct_ifu_ras.scala 320:44]
  wire  _T_292 = _T_290 | _T_263; // @[ct_ifu_ras.scala 320:59]
  wire  _T_294 = _T_292 | _T_236; // @[ct_ifu_ras.scala 321:40]
  wire  _T_296 = _T_294 | _T_209; // @[ct_ifu_ras.scala 322:40]
  wire  _T_298 = _T_296 | _T_210; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_3 = _T_298 | _T_212; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_3; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_3; // @[ct_ifu_ras.scala 306:39]
  wire  _T_288 = top_entry_rtu_updt & rtu_entry_copy_3; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_68 = _T_208 | ras_entry_filled_3; // @[ct_ifu_ras.scala 312:45]
  wire  _T_305 = _T_288 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_4 = gated_clk_cell_10_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_4; // @[ct_ifu_ras.scala 286:35]
  wire  _T_317 = rtu_fifo_ptr_pre == 4'h9; // @[ct_ifu_ras.scala 320:44]
  wire  _T_319 = _T_317 | _T_290; // @[ct_ifu_ras.scala 320:59]
  wire  _T_321 = _T_319 | _T_263; // @[ct_ifu_ras.scala 321:40]
  wire  _T_323 = _T_321 | _T_236; // @[ct_ifu_ras.scala 322:40]
  wire  _T_325 = _T_323 | _T_209; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_4 = _T_325 | _T_210; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_4; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_4; // @[ct_ifu_ras.scala 306:39]
  wire  _T_315 = top_entry_rtu_updt & rtu_entry_copy_4; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_76 = _T_208 | ras_entry_filled_4; // @[ct_ifu_ras.scala 312:45]
  wire  _T_332 = _T_315 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_5 = gated_clk_cell_11_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_5; // @[ct_ifu_ras.scala 286:35]
  wire  _T_344 = rtu_fifo_ptr_pre == 4'ha; // @[ct_ifu_ras.scala 320:44]
  wire  _T_346 = _T_344 | _T_317; // @[ct_ifu_ras.scala 320:59]
  wire  _T_348 = _T_346 | _T_290; // @[ct_ifu_ras.scala 321:40]
  wire  _T_350 = _T_348 | _T_263; // @[ct_ifu_ras.scala 322:40]
  wire  _T_352 = _T_350 | _T_236; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_5 = _T_352 | _T_209; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_5; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_5; // @[ct_ifu_ras.scala 306:39]
  wire  _T_342 = top_entry_rtu_updt & rtu_entry_copy_5; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_84 = _T_208 | ras_entry_filled_5; // @[ct_ifu_ras.scala 312:45]
  wire  _T_359 = _T_342 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_6 = gated_clk_cell_12_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_6; // @[ct_ifu_ras.scala 286:35]
  wire  _T_371 = rtu_fifo_ptr_pre == 4'hb; // @[ct_ifu_ras.scala 320:44]
  wire  _T_373 = _T_371 | _T_344; // @[ct_ifu_ras.scala 320:59]
  wire  _T_375 = _T_373 | _T_317; // @[ct_ifu_ras.scala 321:40]
  wire  _T_377 = _T_375 | _T_290; // @[ct_ifu_ras.scala 322:40]
  wire  _T_379 = _T_377 | _T_263; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_6 = _T_379 | _T_236; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_6; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_6; // @[ct_ifu_ras.scala 306:39]
  wire  _T_369 = top_entry_rtu_updt & rtu_entry_copy_6; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_92 = _T_208 | ras_entry_filled_6; // @[ct_ifu_ras.scala 312:45]
  wire  _T_386 = _T_369 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_7 = gated_clk_cell_13_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_7; // @[ct_ifu_ras.scala 286:35]
  wire  _T_398 = rtu_fifo_ptr_pre == 4'hc; // @[ct_ifu_ras.scala 320:44]
  wire  _T_400 = _T_398 | _T_371; // @[ct_ifu_ras.scala 320:59]
  wire  _T_402 = _T_400 | _T_344; // @[ct_ifu_ras.scala 321:40]
  wire  _T_404 = _T_402 | _T_317; // @[ct_ifu_ras.scala 322:40]
  wire  _T_406 = _T_404 | _T_290; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_7 = _T_406 | _T_263; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_7; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_7; // @[ct_ifu_ras.scala 306:39]
  wire  _T_396 = top_entry_rtu_updt & rtu_entry_copy_7; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_100 = _T_208 | ras_entry_filled_7; // @[ct_ifu_ras.scala 312:45]
  wire  _T_413 = _T_396 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_8 = gated_clk_cell_14_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_8; // @[ct_ifu_ras.scala 286:35]
  wire  _T_425 = rtu_fifo_ptr_pre == 4'hd; // @[ct_ifu_ras.scala 320:44]
  wire  _T_427 = _T_425 | _T_398; // @[ct_ifu_ras.scala 320:59]
  wire  _T_429 = _T_427 | _T_371; // @[ct_ifu_ras.scala 321:40]
  wire  _T_431 = _T_429 | _T_344; // @[ct_ifu_ras.scala 322:40]
  wire  _T_433 = _T_431 | _T_317; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_8 = _T_433 | _T_290; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_8; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_8; // @[ct_ifu_ras.scala 306:39]
  wire  _T_423 = top_entry_rtu_updt & rtu_entry_copy_8; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_108 = _T_208 | ras_entry_filled_8; // @[ct_ifu_ras.scala 312:45]
  wire  _T_440 = _T_423 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_9 = gated_clk_cell_15_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_9; // @[ct_ifu_ras.scala 286:35]
  wire  _T_452 = rtu_fifo_ptr_pre == 4'he; // @[ct_ifu_ras.scala 320:44]
  wire  _T_454 = _T_452 | _T_425; // @[ct_ifu_ras.scala 320:59]
  wire  _T_456 = _T_454 | _T_398; // @[ct_ifu_ras.scala 321:40]
  wire  _T_458 = _T_456 | _T_371; // @[ct_ifu_ras.scala 322:40]
  wire  _T_460 = _T_458 | _T_344; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_9 = _T_460 | _T_317; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_9; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_9; // @[ct_ifu_ras.scala 306:39]
  wire  _T_450 = top_entry_rtu_updt & rtu_entry_copy_9; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_116 = _T_208 | ras_entry_filled_9; // @[ct_ifu_ras.scala 312:45]
  wire  _T_467 = _T_450 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_10 = gated_clk_cell_16_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_10; // @[ct_ifu_ras.scala 286:35]
  wire  _T_479 = rtu_fifo_ptr_pre == 4'hf; // @[ct_ifu_ras.scala 320:44]
  wire  _T_481 = _T_479 | _T_452; // @[ct_ifu_ras.scala 320:59]
  wire  _T_483 = _T_481 | _T_425; // @[ct_ifu_ras.scala 321:40]
  wire  _T_485 = _T_483 | _T_398; // @[ct_ifu_ras.scala 322:40]
  wire  _T_487 = _T_485 | _T_371; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_10 = _T_487 | _T_344; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_10; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_10; // @[ct_ifu_ras.scala 306:39]
  wire  _T_477 = top_entry_rtu_updt & rtu_entry_copy_10; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_124 = _T_208 | ras_entry_filled_10; // @[ct_ifu_ras.scala 312:45]
  wire  _T_494 = _T_477 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  ras_entry_upd_clk_11 = gated_clk_cell_17_clk_out; // @[ct_ifu_ras.scala 58:31 ct_ifu_ras.scala 283:26]
  reg [38:0] ras_entry_pc_11; // @[ct_ifu_ras.scala 286:35]
  wire [4:0] _GEN_177 = {{1'd0}, rtu_fifo_ptr_pre}; // @[ct_ifu_ras.scala 320:44]
  wire  _T_506 = _GEN_177 == 5'h10; // @[ct_ifu_ras.scala 320:44]
  wire  _T_508 = _T_506 | _T_479; // @[ct_ifu_ras.scala 320:59]
  wire  _T_510 = _T_508 | _T_452; // @[ct_ifu_ras.scala 321:40]
  wire  _T_512 = _T_510 | _T_425; // @[ct_ifu_ras.scala 322:40]
  wire  _T_514 = _T_512 | _T_398; // @[ct_ifu_ras.scala 323:40]
  wire  rtu_entry_copy_11 = _T_514 | _T_371; // @[ct_ifu_ras.scala 324:40]
  reg [1:0] ras_entry_priv_mode_11; // @[ct_ifu_ras.scala 305:42]
  reg  ras_entry_filled_11; // @[ct_ifu_ras.scala 306:39]
  wire  _T_504 = top_entry_rtu_updt & rtu_entry_copy_11; // @[ct_ifu_ras.scala 309:31]
  wire  _GEN_132 = _T_208 | ras_entry_filled_11; // @[ct_ifu_ras.scala 312:45]
  wire  _T_521 = _T_504 | _T_223; // @[ct_ifu_ras.scala 327:94]
  wire  _T_526 = top_ptr[3:0] < 4'hc; // @[ct_ifu_ras.scala 334:26]
  wire [3:0] _T_529 = top_ptr[3:0] - 4'h1; // @[ct_ifu_ras.scala 335:44]
  wire [38:0] _GEN_136 = 4'h1 == _T_529 ? ras_entry_pc_1 : ras_entry_pc_0; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_137 = 4'h2 == _T_529 ? ras_entry_pc_2 : _GEN_136; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_138 = 4'h3 == _T_529 ? ras_entry_pc_3 : _GEN_137; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_139 = 4'h4 == _T_529 ? ras_entry_pc_4 : _GEN_138; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_140 = 4'h5 == _T_529 ? ras_entry_pc_5 : _GEN_139; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_141 = 4'h6 == _T_529 ? ras_entry_pc_6 : _GEN_140; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_142 = 4'h7 == _T_529 ? ras_entry_pc_7 : _GEN_141; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_143 = 4'h8 == _T_529 ? ras_entry_pc_8 : _GEN_142; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_144 = 4'h9 == _T_529 ? ras_entry_pc_9 : _GEN_143; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_145 = 4'ha == _T_529 ? ras_entry_pc_10 : _GEN_144; // @[ct_ifu_ras.scala 335:16]
  wire [38:0] _GEN_146 = 4'hb == _T_529 ? ras_entry_pc_11 : _GEN_145; // @[ct_ifu_ras.scala 335:16]
  wire  _GEN_148 = 4'h1 == _T_529 ? ras_entry_filled_1 : ras_entry_filled_0; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_149 = 4'h2 == _T_529 ? ras_entry_filled_2 : _GEN_148; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_150 = 4'h3 == _T_529 ? ras_entry_filled_3 : _GEN_149; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_151 = 4'h4 == _T_529 ? ras_entry_filled_4 : _GEN_150; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_152 = 4'h5 == _T_529 ? ras_entry_filled_5 : _GEN_151; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_153 = 4'h6 == _T_529 ? ras_entry_filled_6 : _GEN_152; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_154 = 4'h7 == _T_529 ? ras_entry_filled_7 : _GEN_153; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_155 = 4'h8 == _T_529 ? ras_entry_filled_8 : _GEN_154; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_156 = 4'h9 == _T_529 ? ras_entry_filled_9 : _GEN_155; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_157 = 4'ha == _T_529 ? ras_entry_filled_10 : _GEN_156; // @[ct_ifu_ras.scala 336:16]
  wire  _GEN_158 = 4'hb == _T_529 ? ras_entry_filled_11 : _GEN_157; // @[ct_ifu_ras.scala 336:16]
  wire [1:0] _GEN_160 = 4'h1 == _T_529 ? ras_entry_priv_mode_1 : ras_entry_priv_mode_0; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_161 = 4'h2 == _T_529 ? ras_entry_priv_mode_2 : _GEN_160; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_162 = 4'h3 == _T_529 ? ras_entry_priv_mode_3 : _GEN_161; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_163 = 4'h4 == _T_529 ? ras_entry_priv_mode_4 : _GEN_162; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_164 = 4'h5 == _T_529 ? ras_entry_priv_mode_5 : _GEN_163; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_165 = 4'h6 == _T_529 ? ras_entry_priv_mode_6 : _GEN_164; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_166 = 4'h7 == _T_529 ? ras_entry_priv_mode_7 : _GEN_165; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_167 = 4'h8 == _T_529 ? ras_entry_priv_mode_8 : _GEN_166; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_168 = 4'h9 == _T_529 ? ras_entry_priv_mode_9 : _GEN_167; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_169 = 4'ha == _T_529 ? ras_entry_priv_mode_10 : _GEN_168; // @[ct_ifu_ras.scala 337:19]
  wire [1:0] _GEN_170 = 4'hb == _T_529 ? ras_entry_priv_mode_11 : _GEN_169; // @[ct_ifu_ras.scala 337:19]
  wire [38:0] _GEN_171 = _T_526 ? _GEN_146 : ras_entry_pc_0; // @[ct_ifu_ras.scala 334:32]
  wire  _GEN_172 = _T_526 ? _GEN_158 : ras_entry_filled_0; // @[ct_ifu_ras.scala 334:32]
  wire [1:0] _GEN_173 = _T_526 ? _GEN_170 : ras_entry_priv_mode_0; // @[ct_ifu_ras.scala 334:32]
  wire [38:0] ras_pc_out = _T_35 ? ras_entry_pc_11 : _GEN_171; // @[ct_ifu_ras.scala 330:30]
  wire  ras_filled = _T_35 ? ras_entry_filled_11 : _GEN_172; // @[ct_ifu_ras.scala 330:30]
  wire [1:0] ras_priv_mode = _T_35 ? ras_entry_priv_mode_11 : _GEN_173; // @[ct_ifu_ras.scala 330:30]
  wire  _T_537 = _T_32 & ras_filled; // @[ct_ifu_ras.scala 344:39]
  wire  _T_538 = cp0_yy_priv_mode == ras_priv_mode; // @[ct_ifu_ras.scala 344:77]
  wire  _T_539 = _T_537 & _T_538; // @[ct_ifu_ras.scala 344:53]
  wire  _T_540 = _T_539 | ibctrl_ras_pcall_vld; // @[ct_ifu_ras.scala 345:5]
  gated_clk_cell m_rtu_ptr_upd_clk ( // @[ct_ifu_ras.scala 117:33]
    .clk_in(m_rtu_ptr_upd_clk_clk_in),
    .global_en(m_rtu_ptr_upd_clk_global_en),
    .module_en(m_rtu_ptr_upd_clk_module_en),
    .local_en(m_rtu_ptr_upd_clk_local_en),
    .external_en(m_rtu_ptr_upd_clk_external_en),
    .pad_yy_icg_scan_en(m_rtu_ptr_upd_clk_pad_yy_icg_scan_en),
    .clk_out(m_rtu_ptr_upd_clk_clk_out)
  );
  gated_clk_cell m_top_ptr_upd_clk ( // @[ct_ifu_ras.scala 159:33]
    .clk_in(m_top_ptr_upd_clk_clk_in),
    .global_en(m_top_ptr_upd_clk_global_en),
    .module_en(m_top_ptr_upd_clk_module_en),
    .local_en(m_top_ptr_upd_clk_local_en),
    .external_en(m_top_ptr_upd_clk_external_en),
    .pad_yy_icg_scan_en(m_top_ptr_upd_clk_pad_yy_icg_scan_en),
    .clk_out(m_top_ptr_upd_clk_clk_out)
  );
  gated_clk_cell m_status_ptr_upd_clk ( // @[ct_ifu_ras.scala 206:36]
    .clk_in(m_status_ptr_upd_clk_clk_in),
    .global_en(m_status_ptr_upd_clk_global_en),
    .module_en(m_status_ptr_upd_clk_module_en),
    .local_en(m_status_ptr_upd_clk_local_en),
    .external_en(m_status_ptr_upd_clk_external_en),
    .pad_yy_icg_scan_en(m_status_ptr_upd_clk_pad_yy_icg_scan_en),
    .clk_out(m_status_ptr_upd_clk_clk_out)
  );
  gated_clk_cell gated_clk_cell ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  gated_clk_cell gated_clk_cell_2 ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_2_clk_in),
    .global_en(gated_clk_cell_2_global_en),
    .module_en(gated_clk_cell_2_module_en),
    .local_en(gated_clk_cell_2_local_en),
    .external_en(gated_clk_cell_2_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_2_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_2_clk_out)
  );
  gated_clk_cell gated_clk_cell_3 ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_3_clk_in),
    .global_en(gated_clk_cell_3_global_en),
    .module_en(gated_clk_cell_3_module_en),
    .local_en(gated_clk_cell_3_local_en),
    .external_en(gated_clk_cell_3_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_3_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_3_clk_out)
  );
  gated_clk_cell gated_clk_cell_4 ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_4_clk_in),
    .global_en(gated_clk_cell_4_global_en),
    .module_en(gated_clk_cell_4_module_en),
    .local_en(gated_clk_cell_4_local_en),
    .external_en(gated_clk_cell_4_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_4_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_4_clk_out)
  );
  gated_clk_cell gated_clk_cell_5 ( // @[ct_ifu_ras.scala 222:49]
    .clk_in(gated_clk_cell_5_clk_in),
    .global_en(gated_clk_cell_5_global_en),
    .module_en(gated_clk_cell_5_module_en),
    .local_en(gated_clk_cell_5_local_en),
    .external_en(gated_clk_cell_5_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_5_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_5_clk_out)
  );
  gated_clk_cell m_rtu_fifo_ptr_upd_clk ( // @[ct_ifu_ras.scala 266:38]
    .clk_in(m_rtu_fifo_ptr_upd_clk_clk_in),
    .global_en(m_rtu_fifo_ptr_upd_clk_global_en),
    .module_en(m_rtu_fifo_ptr_upd_clk_module_en),
    .local_en(m_rtu_fifo_ptr_upd_clk_local_en),
    .external_en(m_rtu_fifo_ptr_upd_clk_external_en),
    .pad_yy_icg_scan_en(m_rtu_fifo_ptr_upd_clk_pad_yy_icg_scan_en),
    .clk_out(m_rtu_fifo_ptr_upd_clk_clk_out)
  );
  gated_clk_cell gated_clk_cell_6 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_6_clk_in),
    .global_en(gated_clk_cell_6_global_en),
    .module_en(gated_clk_cell_6_module_en),
    .local_en(gated_clk_cell_6_local_en),
    .external_en(gated_clk_cell_6_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_6_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_6_clk_out)
  );
  gated_clk_cell gated_clk_cell_7 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_7_clk_in),
    .global_en(gated_clk_cell_7_global_en),
    .module_en(gated_clk_cell_7_module_en),
    .local_en(gated_clk_cell_7_local_en),
    .external_en(gated_clk_cell_7_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_7_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_7_clk_out)
  );
  gated_clk_cell gated_clk_cell_8 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_8_clk_in),
    .global_en(gated_clk_cell_8_global_en),
    .module_en(gated_clk_cell_8_module_en),
    .local_en(gated_clk_cell_8_local_en),
    .external_en(gated_clk_cell_8_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_8_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_8_clk_out)
  );
  gated_clk_cell gated_clk_cell_9 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_9_clk_in),
    .global_en(gated_clk_cell_9_global_en),
    .module_en(gated_clk_cell_9_module_en),
    .local_en(gated_clk_cell_9_local_en),
    .external_en(gated_clk_cell_9_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_9_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_9_clk_out)
  );
  gated_clk_cell gated_clk_cell_10 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_10_clk_in),
    .global_en(gated_clk_cell_10_global_en),
    .module_en(gated_clk_cell_10_module_en),
    .local_en(gated_clk_cell_10_local_en),
    .external_en(gated_clk_cell_10_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_10_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_10_clk_out)
  );
  gated_clk_cell gated_clk_cell_11 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_11_clk_in),
    .global_en(gated_clk_cell_11_global_en),
    .module_en(gated_clk_cell_11_module_en),
    .local_en(gated_clk_cell_11_local_en),
    .external_en(gated_clk_cell_11_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_11_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_11_clk_out)
  );
  gated_clk_cell gated_clk_cell_12 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_12_clk_in),
    .global_en(gated_clk_cell_12_global_en),
    .module_en(gated_clk_cell_12_module_en),
    .local_en(gated_clk_cell_12_local_en),
    .external_en(gated_clk_cell_12_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_12_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_12_clk_out)
  );
  gated_clk_cell gated_clk_cell_13 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_13_clk_in),
    .global_en(gated_clk_cell_13_global_en),
    .module_en(gated_clk_cell_13_module_en),
    .local_en(gated_clk_cell_13_local_en),
    .external_en(gated_clk_cell_13_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_13_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_13_clk_out)
  );
  gated_clk_cell gated_clk_cell_14 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_14_clk_in),
    .global_en(gated_clk_cell_14_global_en),
    .module_en(gated_clk_cell_14_module_en),
    .local_en(gated_clk_cell_14_local_en),
    .external_en(gated_clk_cell_14_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_14_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_14_clk_out)
  );
  gated_clk_cell gated_clk_cell_15 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_15_clk_in),
    .global_en(gated_clk_cell_15_global_en),
    .module_en(gated_clk_cell_15_module_en),
    .local_en(gated_clk_cell_15_local_en),
    .external_en(gated_clk_cell_15_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_15_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_15_clk_out)
  );
  gated_clk_cell gated_clk_cell_16 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_16_clk_in),
    .global_en(gated_clk_cell_16_global_en),
    .module_en(gated_clk_cell_16_module_en),
    .local_en(gated_clk_cell_16_local_en),
    .external_en(gated_clk_cell_16_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_16_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_16_clk_out)
  );
  gated_clk_cell gated_clk_cell_17 ( // @[ct_ifu_ras.scala 275:50]
    .clk_in(gated_clk_cell_17_clk_in),
    .global_en(gated_clk_cell_17_global_en),
    .module_en(gated_clk_cell_17_module_en),
    .local_en(gated_clk_cell_17_local_en),
    .external_en(gated_clk_cell_17_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_17_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_17_clk_out)
  );
  assign ras_ipdp_data_vld = _T_540 & cp0_ifu_ras_en; // @[ct_ifu_ras.scala 344:24]
  assign ras_ipdp_pc = ibctrl_ras_inst_pcall ? ibdp_ras_push_pc : ras_pc_out; // @[ct_ifu_ras.scala 346:18]
  assign ras_l0_btb_pc = _T_35 ? ras_entry_pc_11 : _GEN_171; // @[ct_ifu_ras.scala 349:20]
  assign ras_l0_btb_push_pc = ibdp_ras_push_pc; // @[ct_ifu_ras.scala 348:25]
  assign ras_l0_btb_ras_push = ibctrl_ras_pcall_vld & cp0_ifu_ras_en; // @[ct_ifu_ras.scala 347:26]
  assign m_rtu_ptr_upd_clk_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 118:31]
  assign m_rtu_ptr_upd_clk_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 121:34]
  assign m_rtu_ptr_upd_clk_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 123:34]
  assign m_rtu_ptr_upd_clk_local_en = cp0_ifu_ras_en & _T_22; // @[ct_ifu_ras.scala 122:33]
  assign m_rtu_ptr_upd_clk_external_en = 1'h0; // @[ct_ifu_ras.scala 120:36]
  assign m_rtu_ptr_upd_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 124:43]
  assign m_top_ptr_upd_clk_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 160:31]
  assign m_top_ptr_upd_clk_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 163:34]
  assign m_top_ptr_upd_clk_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 165:34]
  assign m_top_ptr_upd_clk_local_en = cp0_ifu_ras_en & _T_46; // @[ct_ifu_ras.scala 164:33]
  assign m_top_ptr_upd_clk_external_en = 1'h0; // @[ct_ifu_ras.scala 162:36]
  assign m_top_ptr_upd_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 166:43]
  assign m_status_ptr_upd_clk_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 207:34]
  assign m_status_ptr_upd_clk_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 209:37]
  assign m_status_ptr_upd_clk_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 211:37]
  assign m_status_ptr_upd_clk_local_en = _T_87 | _T_58; // @[ct_ifu_ras.scala 210:36]
  assign m_status_ptr_upd_clk_external_en = 1'h0; // @[ct_ifu_ras.scala 208:39]
  assign m_status_ptr_upd_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 212:46]
  assign gated_clk_cell_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_local_en = _T_96 & rtu_entry_push_0; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign gated_clk_cell_1_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_1_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_1_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_1_local_en = _T_96 & rtu_entry_push_1; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_1_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign gated_clk_cell_2_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_2_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_2_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_2_local_en = _T_96 & rtu_entry_push_2; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_2_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_2_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign gated_clk_cell_3_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_3_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_3_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_3_local_en = _T_96 & rtu_entry_push_3; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_3_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_3_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign gated_clk_cell_4_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_4_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_4_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_4_local_en = _T_96 & rtu_entry_push_4; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_4_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_4_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign gated_clk_cell_5_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 224:38]
  assign gated_clk_cell_5_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 226:41]
  assign gated_clk_cell_5_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 228:41]
  assign gated_clk_cell_5_local_en = _T_96 & rtu_entry_push_5; // @[ct_ifu_ras.scala 227:40]
  assign gated_clk_cell_5_external_en = 1'h0; // @[ct_ifu_ras.scala 225:43]
  assign gated_clk_cell_5_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 229:50]
  assign m_rtu_fifo_ptr_upd_clk_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 267:36]
  assign m_rtu_fifo_ptr_upd_clk_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 269:39]
  assign m_rtu_fifo_ptr_upd_clk_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 271:39]
  assign m_rtu_fifo_ptr_upd_clk_local_en = cp0_ifu_ras_en & rtu_ifu_retire0_pcall; // @[ct_ifu_ras.scala 270:38]
  assign m_rtu_fifo_ptr_upd_clk_external_en = 1'h0; // @[ct_ifu_ras.scala 268:41]
  assign m_rtu_fifo_ptr_upd_clk_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 272:48]
  assign gated_clk_cell_6_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_6_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_6_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_6_local_en = cp0_ifu_ras_en & _T_224; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_6_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_6_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_7_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_7_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_7_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_7_local_en = cp0_ifu_ras_en & _T_251; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_7_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_7_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_8_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_8_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_8_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_8_local_en = cp0_ifu_ras_en & _T_278; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_8_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_8_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_9_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_9_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_9_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_9_local_en = cp0_ifu_ras_en & _T_305; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_9_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_9_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_10_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_10_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_10_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_10_local_en = cp0_ifu_ras_en & _T_332; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_10_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_10_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_11_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_11_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_11_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_11_local_en = cp0_ifu_ras_en & _T_359; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_11_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_11_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_12_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_12_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_12_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_12_local_en = cp0_ifu_ras_en & _T_386; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_12_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_12_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_13_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_13_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_13_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_13_local_en = cp0_ifu_ras_en & _T_413; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_13_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_13_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_14_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_14_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_14_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_14_local_en = cp0_ifu_ras_en & _T_440; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_14_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_14_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_15_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_15_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_15_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_15_local_en = cp0_ifu_ras_en & _T_467; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_15_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_15_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_16_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_16_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_16_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_16_local_en = cp0_ifu_ras_en & _T_494; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_16_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_16_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
  assign gated_clk_cell_17_clk_in = forever_cpuclk; // @[ct_ifu_ras.scala 277:38]
  assign gated_clk_cell_17_global_en = cp0_yy_clk_en; // @[ct_ifu_ras.scala 279:41]
  assign gated_clk_cell_17_module_en = cp0_ifu_icg_en; // @[ct_ifu_ras.scala 281:41]
  assign gated_clk_cell_17_local_en = cp0_ifu_ras_en & _T_521; // @[ct_ifu_ras.scala 280:40]
  assign gated_clk_cell_17_external_en = 1'h0; // @[ct_ifu_ras.scala 278:43]
  assign gated_clk_cell_17_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_ras.scala 282:50]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rtu_ptr = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  status_ptr = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  top_ptr = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  rtu_entry_pc_0 = _RAND_3[38:0];
  _RAND_4 = {1{`RANDOM}};
  rtu_entry_filled_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rtu_entry_priv_mode_0 = _RAND_5[1:0];
  _RAND_6 = {2{`RANDOM}};
  rtu_entry_pc_1 = _RAND_6[38:0];
  _RAND_7 = {1{`RANDOM}};
  rtu_entry_filled_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  rtu_entry_priv_mode_1 = _RAND_8[1:0];
  _RAND_9 = {2{`RANDOM}};
  rtu_entry_pc_2 = _RAND_9[38:0];
  _RAND_10 = {1{`RANDOM}};
  rtu_entry_filled_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  rtu_entry_priv_mode_2 = _RAND_11[1:0];
  _RAND_12 = {2{`RANDOM}};
  rtu_entry_pc_3 = _RAND_12[38:0];
  _RAND_13 = {1{`RANDOM}};
  rtu_entry_filled_3 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  rtu_entry_priv_mode_3 = _RAND_14[1:0];
  _RAND_15 = {2{`RANDOM}};
  rtu_entry_pc_4 = _RAND_15[38:0];
  _RAND_16 = {1{`RANDOM}};
  rtu_entry_filled_4 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  rtu_entry_priv_mode_4 = _RAND_17[1:0];
  _RAND_18 = {2{`RANDOM}};
  rtu_entry_pc_5 = _RAND_18[38:0];
  _RAND_19 = {1{`RANDOM}};
  rtu_entry_filled_5 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  rtu_entry_priv_mode_5 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  rtu_fifo_ptr = _RAND_21[3:0];
  _RAND_22 = {2{`RANDOM}};
  ras_entry_pc_0 = _RAND_22[38:0];
  _RAND_23 = {1{`RANDOM}};
  ras_entry_priv_mode_0 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  ras_entry_filled_0 = _RAND_24[0:0];
  _RAND_25 = {2{`RANDOM}};
  ras_entry_pc_1 = _RAND_25[38:0];
  _RAND_26 = {1{`RANDOM}};
  ras_entry_priv_mode_1 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  ras_entry_filled_1 = _RAND_27[0:0];
  _RAND_28 = {2{`RANDOM}};
  ras_entry_pc_2 = _RAND_28[38:0];
  _RAND_29 = {1{`RANDOM}};
  ras_entry_priv_mode_2 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  ras_entry_filled_2 = _RAND_30[0:0];
  _RAND_31 = {2{`RANDOM}};
  ras_entry_pc_3 = _RAND_31[38:0];
  _RAND_32 = {1{`RANDOM}};
  ras_entry_priv_mode_3 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  ras_entry_filled_3 = _RAND_33[0:0];
  _RAND_34 = {2{`RANDOM}};
  ras_entry_pc_4 = _RAND_34[38:0];
  _RAND_35 = {1{`RANDOM}};
  ras_entry_priv_mode_4 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  ras_entry_filled_4 = _RAND_36[0:0];
  _RAND_37 = {2{`RANDOM}};
  ras_entry_pc_5 = _RAND_37[38:0];
  _RAND_38 = {1{`RANDOM}};
  ras_entry_priv_mode_5 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  ras_entry_filled_5 = _RAND_39[0:0];
  _RAND_40 = {2{`RANDOM}};
  ras_entry_pc_6 = _RAND_40[38:0];
  _RAND_41 = {1{`RANDOM}};
  ras_entry_priv_mode_6 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  ras_entry_filled_6 = _RAND_42[0:0];
  _RAND_43 = {2{`RANDOM}};
  ras_entry_pc_7 = _RAND_43[38:0];
  _RAND_44 = {1{`RANDOM}};
  ras_entry_priv_mode_7 = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  ras_entry_filled_7 = _RAND_45[0:0];
  _RAND_46 = {2{`RANDOM}};
  ras_entry_pc_8 = _RAND_46[38:0];
  _RAND_47 = {1{`RANDOM}};
  ras_entry_priv_mode_8 = _RAND_47[1:0];
  _RAND_48 = {1{`RANDOM}};
  ras_entry_filled_8 = _RAND_48[0:0];
  _RAND_49 = {2{`RANDOM}};
  ras_entry_pc_9 = _RAND_49[38:0];
  _RAND_50 = {1{`RANDOM}};
  ras_entry_priv_mode_9 = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  ras_entry_filled_9 = _RAND_51[0:0];
  _RAND_52 = {2{`RANDOM}};
  ras_entry_pc_10 = _RAND_52[38:0];
  _RAND_53 = {1{`RANDOM}};
  ras_entry_priv_mode_10 = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  ras_entry_filled_10 = _RAND_54[0:0];
  _RAND_55 = {2{`RANDOM}};
  ras_entry_pc_11 = _RAND_55[38:0];
  _RAND_56 = {1{`RANDOM}};
  ras_entry_priv_mode_11 = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  ras_entry_filled_11 = _RAND_57[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_19) begin
    rtu_ptr = 5'h0;
  end
  if (_T_19) begin
    status_ptr = 5'h0;
  end
  if (_T_19) begin
    top_ptr = 5'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_0 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_0 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_0 = 2'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_1 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_1 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_1 = 2'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_2 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_2 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_2 = 2'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_3 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_3 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_3 = 2'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_4 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_4 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_4 = 2'h0;
  end
  if (_T_19) begin
    rtu_entry_pc_5 = 39'h0;
  end
  if (_T_19) begin
    rtu_entry_filled_5 = 1'h0;
  end
  if (_T_19) begin
    rtu_entry_priv_mode_5 = 2'h0;
  end
  if (_T_19) begin
    rtu_fifo_ptr = 4'h0;
  end
  if (_T_19) begin
    ras_entry_pc_0 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_0 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_0 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_1 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_1 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_1 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_2 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_2 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_2 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_3 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_3 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_3 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_4 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_4 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_4 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_5 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_5 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_5 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_6 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_6 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_6 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_7 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_7 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_7 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_8 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_8 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_8 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_9 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_9 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_9 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_10 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_10 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_10 = 1'h0;
  end
  if (_T_19) begin
    ras_entry_pc_11 = 39'h0;
  end
  if (_T_19) begin
    ras_entry_priv_mode_11 = 2'h0;
  end
  if (_T_19) begin
    ras_entry_filled_11 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge rtu_ptr_upd_clk or posedge _T_19) begin
    if (_T_19) begin
      rtu_ptr <= 5'h0;
    end else if (cp0_ifu_ras_en) begin
      if (!(_T)) begin
        if (rtu_ifu_retire0_pcall) begin
          if (_T_2) begin
            rtu_ptr <= _T_5;
          end else begin
            rtu_ptr <= _T_7;
          end
        end else if (_T_9) begin
          if (_T_11) begin
            rtu_ptr <= _T_14;
          end else begin
            rtu_ptr <= _T_16;
          end
        end
      end
    end
  end
  always @(posedge status_ptr_upd_clk or posedge _T_19) begin
    if (_T_19) begin
      status_ptr <= 5'h0;
    end else if (_T_58) begin
      if (_T_61) begin
        status_ptr <= 5'h0;
      end else begin
        status_ptr <= _T_64;
      end
    end else if (!(_T_67)) begin
      if (_T_66) begin
        status_ptr <= {{1'd0}, status_ptr_pre};
      end else if (_T_71) begin
        if (_T_73) begin
          status_ptr <= 5'h0;
        end else begin
          status_ptr <= _T_75;
        end
      end
    end
  end
  always @(posedge top_ptr_upd_clk or posedge _T_19) begin
    if (_T_19) begin
      top_ptr <= 5'h0;
    end else if (cp0_ifu_ras_en) begin
      if (top_entry_rtu_updt) begin
        if (_T) begin
          top_ptr <= rtu_ptr;
        end else if (rtu_ifu_retire0_pcall) begin
          if (_T_2) begin
            top_ptr <= _T_5;
          end else begin
            top_ptr <= _T_7;
          end
        end else if (_T_9) begin
          if (_T_11) begin
            top_ptr <= _T_14;
          end else begin
            top_ptr <= _T_16;
          end
        end else begin
          top_ptr <= rtu_ptr;
        end
      end else if (!(_T_24)) begin
        if (ibctrl_ras_pcall_vld) begin
          if (_T_26) begin
            top_ptr <= _T_29;
          end else begin
            top_ptr <= _T_31;
          end
        end else if (_T_33) begin
          if (_T_35) begin
            top_ptr <= _T_38;
          end else begin
            top_ptr <= _T_40;
          end
        end
      end
    end
  end
  always @(posedge rtu_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_0 <= 39'h0;
    end else if (_T_97) begin
      rtu_entry_pc_0 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_0 <= 1'h0;
    end else begin
      rtu_entry_filled_0 <= _T_97 | rtu_entry_filled_0;
    end
  end
  always @(posedge rtu_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_0 <= 2'h0;
    end else if (_T_97) begin
      rtu_entry_priv_mode_0 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_1 <= 39'h0;
    end else if (_T_114) begin
      rtu_entry_pc_1 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_1 <= 1'h0;
    end else begin
      rtu_entry_filled_1 <= _T_114 | rtu_entry_filled_1;
    end
  end
  always @(posedge rtu_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_1 <= 2'h0;
    end else if (_T_114) begin
      rtu_entry_priv_mode_1 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_2 <= 39'h0;
    end else if (_T_131) begin
      rtu_entry_pc_2 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_2 <= 1'h0;
    end else begin
      rtu_entry_filled_2 <= _T_131 | rtu_entry_filled_2;
    end
  end
  always @(posedge rtu_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_2 <= 2'h0;
    end else if (_T_131) begin
      rtu_entry_priv_mode_2 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_3 <= 39'h0;
    end else if (_T_148) begin
      rtu_entry_pc_3 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_3 <= 1'h0;
    end else begin
      rtu_entry_filled_3 <= _T_148 | rtu_entry_filled_3;
    end
  end
  always @(posedge rtu_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_3 <= 2'h0;
    end else if (_T_148) begin
      rtu_entry_priv_mode_3 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_4 <= 39'h0;
    end else if (_T_165) begin
      rtu_entry_pc_4 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_4 <= 1'h0;
    end else begin
      rtu_entry_filled_4 <= _T_165 | rtu_entry_filled_4;
    end
  end
  always @(posedge rtu_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_4 <= 2'h0;
    end else if (_T_165) begin
      rtu_entry_priv_mode_4 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_pc_5 <= 39'h0;
    end else if (_T_182) begin
      rtu_entry_pc_5 <= rtu_ifu_retire0_inc_pc;
    end
  end
  always @(posedge rtu_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_filled_5 <= 1'h0;
    end else begin
      rtu_entry_filled_5 <= _T_182 | rtu_entry_filled_5;
    end
  end
  always @(posedge rtu_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      rtu_entry_priv_mode_5 <= 2'h0;
    end else if (_T_182) begin
      rtu_entry_priv_mode_5 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge rtu_fifo_ptr_upd_clk or posedge _T_19) begin
    if (_T_19) begin
      rtu_fifo_ptr <= 4'h0;
    end else if (_T_96) begin
      rtu_fifo_ptr <= rtu_fifo_ptr_pre;
    end
  end
  always @(posedge ras_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_0 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_0) begin
        if (_T_98) begin
          ras_entry_pc_0 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_0 <= rtu_entry_pc_0;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_0 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_0 <= 2'h0;
    end else if (_T_207) begin
      ras_entry_priv_mode_0 <= rtu_entry_priv_mode_0;
    end else if (_T_208) begin
      ras_entry_priv_mode_0 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_0 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_0 <= 1'h0;
    end else if (_T_207) begin
      ras_entry_filled_0 <= rtu_entry_filled_0;
    end else begin
      ras_entry_filled_0 <= _GEN_44;
    end
  end
  always @(posedge ras_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_1 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_1) begin
        if (_T_115) begin
          ras_entry_pc_1 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_1 <= rtu_entry_pc_1;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_1 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_1 <= 2'h0;
    end else if (_T_234) begin
      ras_entry_priv_mode_1 <= rtu_entry_priv_mode_1;
    end else if (_T_208) begin
      ras_entry_priv_mode_1 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_1 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_1 <= 1'h0;
    end else if (_T_234) begin
      ras_entry_filled_1 <= rtu_entry_filled_1;
    end else begin
      ras_entry_filled_1 <= _GEN_52;
    end
  end
  always @(posedge ras_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_2 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_2) begin
        if (_T_132) begin
          ras_entry_pc_2 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_2 <= rtu_entry_pc_2;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_2 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_2 <= 2'h0;
    end else if (_T_261) begin
      ras_entry_priv_mode_2 <= rtu_entry_priv_mode_2;
    end else if (_T_208) begin
      ras_entry_priv_mode_2 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_2 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_2 <= 1'h0;
    end else if (_T_261) begin
      ras_entry_filled_2 <= rtu_entry_filled_2;
    end else begin
      ras_entry_filled_2 <= _GEN_60;
    end
  end
  always @(posedge ras_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_3 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_3) begin
        if (_T_149) begin
          ras_entry_pc_3 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_3 <= rtu_entry_pc_3;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_3 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_3 <= 2'h0;
    end else if (_T_288) begin
      ras_entry_priv_mode_3 <= rtu_entry_priv_mode_3;
    end else if (_T_208) begin
      ras_entry_priv_mode_3 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_3 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_3 <= 1'h0;
    end else if (_T_288) begin
      ras_entry_filled_3 <= rtu_entry_filled_3;
    end else begin
      ras_entry_filled_3 <= _GEN_68;
    end
  end
  always @(posedge ras_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_4 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_4) begin
        if (_T_166) begin
          ras_entry_pc_4 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_4 <= rtu_entry_pc_4;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_4 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_4 <= 2'h0;
    end else if (_T_315) begin
      ras_entry_priv_mode_4 <= rtu_entry_priv_mode_4;
    end else if (_T_208) begin
      ras_entry_priv_mode_4 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_4 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_4 <= 1'h0;
    end else if (_T_315) begin
      ras_entry_filled_4 <= rtu_entry_filled_4;
    end else begin
      ras_entry_filled_4 <= _GEN_76;
    end
  end
  always @(posedge ras_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_5 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_5) begin
        if (_T_183) begin
          ras_entry_pc_5 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_5 <= rtu_entry_pc_5;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_5 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_5 <= 2'h0;
    end else if (_T_342) begin
      ras_entry_priv_mode_5 <= rtu_entry_priv_mode_5;
    end else if (_T_208) begin
      ras_entry_priv_mode_5 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_5 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_5 <= 1'h0;
    end else if (_T_342) begin
      ras_entry_filled_5 <= rtu_entry_filled_5;
    end else begin
      ras_entry_filled_5 <= _GEN_84;
    end
  end
  always @(posedge ras_entry_upd_clk_6 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_6 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_6) begin
        if (_T_98) begin
          ras_entry_pc_6 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_6 <= rtu_entry_pc_0;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_6 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_6 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_6 <= 2'h0;
    end else if (_T_369) begin
      ras_entry_priv_mode_6 <= rtu_entry_priv_mode_0;
    end else if (_T_208) begin
      ras_entry_priv_mode_6 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_6 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_6 <= 1'h0;
    end else if (_T_369) begin
      ras_entry_filled_6 <= rtu_entry_filled_0;
    end else begin
      ras_entry_filled_6 <= _GEN_92;
    end
  end
  always @(posedge ras_entry_upd_clk_7 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_7 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_7) begin
        if (_T_115) begin
          ras_entry_pc_7 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_7 <= rtu_entry_pc_1;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_7 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_7 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_7 <= 2'h0;
    end else if (_T_396) begin
      ras_entry_priv_mode_7 <= rtu_entry_priv_mode_1;
    end else if (_T_208) begin
      ras_entry_priv_mode_7 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_7 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_7 <= 1'h0;
    end else if (_T_396) begin
      ras_entry_filled_7 <= rtu_entry_filled_1;
    end else begin
      ras_entry_filled_7 <= _GEN_100;
    end
  end
  always @(posedge ras_entry_upd_clk_8 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_8 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_8) begin
        if (_T_132) begin
          ras_entry_pc_8 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_8 <= rtu_entry_pc_2;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_8 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_8 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_8 <= 2'h0;
    end else if (_T_423) begin
      ras_entry_priv_mode_8 <= rtu_entry_priv_mode_2;
    end else if (_T_208) begin
      ras_entry_priv_mode_8 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_8 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_8 <= 1'h0;
    end else if (_T_423) begin
      ras_entry_filled_8 <= rtu_entry_filled_2;
    end else begin
      ras_entry_filled_8 <= _GEN_108;
    end
  end
  always @(posedge ras_entry_upd_clk_9 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_9 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_9) begin
        if (_T_149) begin
          ras_entry_pc_9 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_9 <= rtu_entry_pc_3;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_9 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_9 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_9 <= 2'h0;
    end else if (_T_450) begin
      ras_entry_priv_mode_9 <= rtu_entry_priv_mode_3;
    end else if (_T_208) begin
      ras_entry_priv_mode_9 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_9 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_9 <= 1'h0;
    end else if (_T_450) begin
      ras_entry_filled_9 <= rtu_entry_filled_3;
    end else begin
      ras_entry_filled_9 <= _GEN_116;
    end
  end
  always @(posedge ras_entry_upd_clk_10 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_10 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_10) begin
        if (_T_166) begin
          ras_entry_pc_10 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_10 <= rtu_entry_pc_4;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_10 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_10 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_10 <= 2'h0;
    end else if (_T_477) begin
      ras_entry_priv_mode_10 <= rtu_entry_priv_mode_4;
    end else if (_T_208) begin
      ras_entry_priv_mode_10 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_10 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_10 <= 1'h0;
    end else if (_T_477) begin
      ras_entry_filled_10 <= rtu_entry_filled_4;
    end else begin
      ras_entry_filled_10 <= _GEN_124;
    end
  end
  always @(posedge ras_entry_upd_clk_11 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_pc_11 <= 39'h0;
    end else if (top_entry_rtu_updt) begin
      if (rtu_entry_copy_11) begin
        if (_T_183) begin
          ras_entry_pc_11 <= rtu_ifu_retire0_inc_pc;
        end else begin
          ras_entry_pc_11 <= rtu_entry_pc_5;
        end
      end
    end else if (ibctrl_ras_pcall_vld) begin
      if (_T_35) begin
        ras_entry_pc_11 <= ibdp_ras_push_pc;
      end
    end
  end
  always @(posedge ras_entry_upd_clk_11 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_priv_mode_11 <= 2'h0;
    end else if (_T_504) begin
      ras_entry_priv_mode_11 <= rtu_entry_priv_mode_5;
    end else if (_T_208) begin
      ras_entry_priv_mode_11 <= cp0_yy_priv_mode;
    end
  end
  always @(posedge ras_entry_upd_clk_11 or posedge _T_19) begin
    if (_T_19) begin
      ras_entry_filled_11 <= 1'h0;
    end else if (_T_504) begin
      ras_entry_filled_11 <= rtu_entry_filled_5;
    end else begin
      ras_entry_filled_11 <= _GEN_132;
    end
  end
endmodule
