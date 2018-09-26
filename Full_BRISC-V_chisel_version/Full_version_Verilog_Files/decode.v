module register_file( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input         io_wEn, // @[:@6.4]
  input  [31:0] io_write_data, // @[:@6.4]
  input  [4:0]  io_read_sel1, // @[:@6.4]
  input  [4:0]  io_read_sel2, // @[:@6.4]
  input  [4:0]  io_write_sel, // @[:@6.4]
  output [31:0] io_read_data1, // @[:@6.4]
  output [31:0] io_read_data2 // @[:@6.4]
);
  reg [31:0] register_file_block_0; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] register_file_block_1; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_1;
  reg [31:0] register_file_block_2; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_2;
  reg [31:0] register_file_block_3; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_3;
  reg [31:0] register_file_block_4; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_4;
  reg [31:0] register_file_block_5; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_5;
  reg [31:0] register_file_block_6; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_6;
  reg [31:0] register_file_block_7; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_7;
  reg [31:0] register_file_block_8; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_8;
  reg [31:0] register_file_block_9; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_9;
  reg [31:0] register_file_block_10; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_10;
  reg [31:0] register_file_block_11; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_11;
  reg [31:0] register_file_block_12; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_12;
  reg [31:0] register_file_block_13; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_13;
  reg [31:0] register_file_block_14; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_14;
  reg [31:0] register_file_block_15; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_15;
  reg [31:0] register_file_block_16; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_16;
  reg [31:0] register_file_block_17; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_17;
  reg [31:0] register_file_block_18; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_18;
  reg [31:0] register_file_block_19; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_19;
  reg [31:0] register_file_block_20; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_20;
  reg [31:0] register_file_block_21; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_21;
  reg [31:0] register_file_block_22; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_22;
  reg [31:0] register_file_block_23; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_23;
  reg [31:0] register_file_block_24; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_24;
  reg [31:0] register_file_block_25; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_25;
  reg [31:0] register_file_block_26; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_26;
  reg [31:0] register_file_block_27; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_27;
  reg [31:0] register_file_block_28; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_28;
  reg [31:0] register_file_block_29; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_29;
  reg [31:0] register_file_block_30; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_30;
  reg [31:0] register_file_block_31; // @[regFile.scala 23:32:@8.4]
  reg [31:0] _RAND_31;
  wire  _T_60; // @[regFile.scala 25:15:@9.4]
  wire  _T_67; // @[regFile.scala 29:43:@18.8]
  wire  _T_68; // @[regFile.scala 29:26:@19.8]
  wire [31:0] _GEN_0; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_1; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_2; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_3; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_4; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_5; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_6; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_7; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_8; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_9; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_10; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_11; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_12; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_13; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_14; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_15; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_16; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_17; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_18; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_19; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_20; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_21; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_22; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_23; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_24; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_25; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_26; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_27; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_28; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_29; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_30; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_31; // @[regFile.scala 30:43:@21.10]
  wire [31:0] _GEN_32; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_33; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_34; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_35; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_36; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_37; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_38; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_39; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_40; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_41; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_42; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_43; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_44; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_45; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_46; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_47; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_48; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_49; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_50; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_51; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_52; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_53; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_54; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_55; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_56; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_57; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_58; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_59; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_60; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_61; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_62; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_63; // @[regFile.scala 29:53:@20.8]
  wire [31:0] _GEN_64; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_65; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_66; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_67; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_68; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_69; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_70; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_71; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_72; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_73; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_74; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_75; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_76; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_77; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_78; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_79; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_80; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_81; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_82; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_83; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_84; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_85; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_86; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_87; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_88; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_89; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_90; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_91; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_92; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_93; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_94; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_95; // @[regFile.scala 26:23:@13.6]
  wire [31:0] _GEN_129; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_130; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_131; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_132; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_133; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_134; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_135; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_136; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_137; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_138; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_139; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_140; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_141; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_142; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_143; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_144; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_145; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_146; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_147; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_148; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_149; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_150; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_151; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_152; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_153; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_154; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_155; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_156; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_157; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_158; // @[regFile.scala 38:17:@28.4]
  wire [31:0] _GEN_161; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_162; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_163; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_164; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_165; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_166; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_167; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_168; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_169; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_170; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_171; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_172; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_173; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_174; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_175; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_176; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_177; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_178; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_179; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_180; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_181; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_182; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_183; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_184; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_185; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_186; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_187; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_188; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_189; // @[regFile.scala 39:17:@29.4]
  wire [31:0] _GEN_190; // @[regFile.scala 39:17:@29.4]
  assign _T_60 = $unsigned(clock); // @[regFile.scala 25:15:@9.4]
  assign _T_67 = io_write_sel != 5'h0; // @[regFile.scala 29:43:@18.8]
  assign _T_68 = io_wEn & _T_67; // @[regFile.scala 29:26:@19.8]
  assign _GEN_0 = 5'h0 == io_write_sel ? io_write_data : register_file_block_0; // @[regFile.scala 30:43:@21.10]
  assign _GEN_1 = 5'h1 == io_write_sel ? io_write_data : register_file_block_1; // @[regFile.scala 30:43:@21.10]
  assign _GEN_2 = 5'h2 == io_write_sel ? io_write_data : register_file_block_2; // @[regFile.scala 30:43:@21.10]
  assign _GEN_3 = 5'h3 == io_write_sel ? io_write_data : register_file_block_3; // @[regFile.scala 30:43:@21.10]
  assign _GEN_4 = 5'h4 == io_write_sel ? io_write_data : register_file_block_4; // @[regFile.scala 30:43:@21.10]
  assign _GEN_5 = 5'h5 == io_write_sel ? io_write_data : register_file_block_5; // @[regFile.scala 30:43:@21.10]
  assign _GEN_6 = 5'h6 == io_write_sel ? io_write_data : register_file_block_6; // @[regFile.scala 30:43:@21.10]
  assign _GEN_7 = 5'h7 == io_write_sel ? io_write_data : register_file_block_7; // @[regFile.scala 30:43:@21.10]
  assign _GEN_8 = 5'h8 == io_write_sel ? io_write_data : register_file_block_8; // @[regFile.scala 30:43:@21.10]
  assign _GEN_9 = 5'h9 == io_write_sel ? io_write_data : register_file_block_9; // @[regFile.scala 30:43:@21.10]
  assign _GEN_10 = 5'ha == io_write_sel ? io_write_data : register_file_block_10; // @[regFile.scala 30:43:@21.10]
  assign _GEN_11 = 5'hb == io_write_sel ? io_write_data : register_file_block_11; // @[regFile.scala 30:43:@21.10]
  assign _GEN_12 = 5'hc == io_write_sel ? io_write_data : register_file_block_12; // @[regFile.scala 30:43:@21.10]
  assign _GEN_13 = 5'hd == io_write_sel ? io_write_data : register_file_block_13; // @[regFile.scala 30:43:@21.10]
  assign _GEN_14 = 5'he == io_write_sel ? io_write_data : register_file_block_14; // @[regFile.scala 30:43:@21.10]
  assign _GEN_15 = 5'hf == io_write_sel ? io_write_data : register_file_block_15; // @[regFile.scala 30:43:@21.10]
  assign _GEN_16 = 5'h10 == io_write_sel ? io_write_data : register_file_block_16; // @[regFile.scala 30:43:@21.10]
  assign _GEN_17 = 5'h11 == io_write_sel ? io_write_data : register_file_block_17; // @[regFile.scala 30:43:@21.10]
  assign _GEN_18 = 5'h12 == io_write_sel ? io_write_data : register_file_block_18; // @[regFile.scala 30:43:@21.10]
  assign _GEN_19 = 5'h13 == io_write_sel ? io_write_data : register_file_block_19; // @[regFile.scala 30:43:@21.10]
  assign _GEN_20 = 5'h14 == io_write_sel ? io_write_data : register_file_block_20; // @[regFile.scala 30:43:@21.10]
  assign _GEN_21 = 5'h15 == io_write_sel ? io_write_data : register_file_block_21; // @[regFile.scala 30:43:@21.10]
  assign _GEN_22 = 5'h16 == io_write_sel ? io_write_data : register_file_block_22; // @[regFile.scala 30:43:@21.10]
  assign _GEN_23 = 5'h17 == io_write_sel ? io_write_data : register_file_block_23; // @[regFile.scala 30:43:@21.10]
  assign _GEN_24 = 5'h18 == io_write_sel ? io_write_data : register_file_block_24; // @[regFile.scala 30:43:@21.10]
  assign _GEN_25 = 5'h19 == io_write_sel ? io_write_data : register_file_block_25; // @[regFile.scala 30:43:@21.10]
  assign _GEN_26 = 5'h1a == io_write_sel ? io_write_data : register_file_block_26; // @[regFile.scala 30:43:@21.10]
  assign _GEN_27 = 5'h1b == io_write_sel ? io_write_data : register_file_block_27; // @[regFile.scala 30:43:@21.10]
  assign _GEN_28 = 5'h1c == io_write_sel ? io_write_data : register_file_block_28; // @[regFile.scala 30:43:@21.10]
  assign _GEN_29 = 5'h1d == io_write_sel ? io_write_data : register_file_block_29; // @[regFile.scala 30:43:@21.10]
  assign _GEN_30 = 5'h1e == io_write_sel ? io_write_data : register_file_block_30; // @[regFile.scala 30:43:@21.10]
  assign _GEN_31 = 5'h1f == io_write_sel ? io_write_data : register_file_block_31; // @[regFile.scala 30:43:@21.10]
  assign _GEN_32 = _T_68 ? _GEN_0 : 32'h0; // @[regFile.scala 29:53:@20.8]
  assign _GEN_33 = _T_68 ? _GEN_1 : register_file_block_1; // @[regFile.scala 29:53:@20.8]
  assign _GEN_34 = _T_68 ? _GEN_2 : register_file_block_2; // @[regFile.scala 29:53:@20.8]
  assign _GEN_35 = _T_68 ? _GEN_3 : register_file_block_3; // @[regFile.scala 29:53:@20.8]
  assign _GEN_36 = _T_68 ? _GEN_4 : register_file_block_4; // @[regFile.scala 29:53:@20.8]
  assign _GEN_37 = _T_68 ? _GEN_5 : register_file_block_5; // @[regFile.scala 29:53:@20.8]
  assign _GEN_38 = _T_68 ? _GEN_6 : register_file_block_6; // @[regFile.scala 29:53:@20.8]
  assign _GEN_39 = _T_68 ? _GEN_7 : register_file_block_7; // @[regFile.scala 29:53:@20.8]
  assign _GEN_40 = _T_68 ? _GEN_8 : register_file_block_8; // @[regFile.scala 29:53:@20.8]
  assign _GEN_41 = _T_68 ? _GEN_9 : register_file_block_9; // @[regFile.scala 29:53:@20.8]
  assign _GEN_42 = _T_68 ? _GEN_10 : register_file_block_10; // @[regFile.scala 29:53:@20.8]
  assign _GEN_43 = _T_68 ? _GEN_11 : register_file_block_11; // @[regFile.scala 29:53:@20.8]
  assign _GEN_44 = _T_68 ? _GEN_12 : register_file_block_12; // @[regFile.scala 29:53:@20.8]
  assign _GEN_45 = _T_68 ? _GEN_13 : register_file_block_13; // @[regFile.scala 29:53:@20.8]
  assign _GEN_46 = _T_68 ? _GEN_14 : register_file_block_14; // @[regFile.scala 29:53:@20.8]
  assign _GEN_47 = _T_68 ? _GEN_15 : register_file_block_15; // @[regFile.scala 29:53:@20.8]
  assign _GEN_48 = _T_68 ? _GEN_16 : register_file_block_16; // @[regFile.scala 29:53:@20.8]
  assign _GEN_49 = _T_68 ? _GEN_17 : register_file_block_17; // @[regFile.scala 29:53:@20.8]
  assign _GEN_50 = _T_68 ? _GEN_18 : register_file_block_18; // @[regFile.scala 29:53:@20.8]
  assign _GEN_51 = _T_68 ? _GEN_19 : register_file_block_19; // @[regFile.scala 29:53:@20.8]
  assign _GEN_52 = _T_68 ? _GEN_20 : register_file_block_20; // @[regFile.scala 29:53:@20.8]
  assign _GEN_53 = _T_68 ? _GEN_21 : register_file_block_21; // @[regFile.scala 29:53:@20.8]
  assign _GEN_54 = _T_68 ? _GEN_22 : register_file_block_22; // @[regFile.scala 29:53:@20.8]
  assign _GEN_55 = _T_68 ? _GEN_23 : register_file_block_23; // @[regFile.scala 29:53:@20.8]
  assign _GEN_56 = _T_68 ? _GEN_24 : register_file_block_24; // @[regFile.scala 29:53:@20.8]
  assign _GEN_57 = _T_68 ? _GEN_25 : register_file_block_25; // @[regFile.scala 29:53:@20.8]
  assign _GEN_58 = _T_68 ? _GEN_26 : register_file_block_26; // @[regFile.scala 29:53:@20.8]
  assign _GEN_59 = _T_68 ? _GEN_27 : register_file_block_27; // @[regFile.scala 29:53:@20.8]
  assign _GEN_60 = _T_68 ? _GEN_28 : register_file_block_28; // @[regFile.scala 29:53:@20.8]
  assign _GEN_61 = _T_68 ? _GEN_29 : register_file_block_29; // @[regFile.scala 29:53:@20.8]
  assign _GEN_62 = _T_68 ? _GEN_30 : register_file_block_30; // @[regFile.scala 29:53:@20.8]
  assign _GEN_63 = _T_68 ? _GEN_31 : register_file_block_31; // @[regFile.scala 29:53:@20.8]
  assign _GEN_64 = reset ? 32'h0 : _GEN_32; // @[regFile.scala 26:23:@13.6]
  assign _GEN_65 = reset ? register_file_block_1 : _GEN_33; // @[regFile.scala 26:23:@13.6]
  assign _GEN_66 = reset ? register_file_block_2 : _GEN_34; // @[regFile.scala 26:23:@13.6]
  assign _GEN_67 = reset ? register_file_block_3 : _GEN_35; // @[regFile.scala 26:23:@13.6]
  assign _GEN_68 = reset ? register_file_block_4 : _GEN_36; // @[regFile.scala 26:23:@13.6]
  assign _GEN_69 = reset ? register_file_block_5 : _GEN_37; // @[regFile.scala 26:23:@13.6]
  assign _GEN_70 = reset ? register_file_block_6 : _GEN_38; // @[regFile.scala 26:23:@13.6]
  assign _GEN_71 = reset ? register_file_block_7 : _GEN_39; // @[regFile.scala 26:23:@13.6]
  assign _GEN_72 = reset ? register_file_block_8 : _GEN_40; // @[regFile.scala 26:23:@13.6]
  assign _GEN_73 = reset ? register_file_block_9 : _GEN_41; // @[regFile.scala 26:23:@13.6]
  assign _GEN_74 = reset ? register_file_block_10 : _GEN_42; // @[regFile.scala 26:23:@13.6]
  assign _GEN_75 = reset ? register_file_block_11 : _GEN_43; // @[regFile.scala 26:23:@13.6]
  assign _GEN_76 = reset ? register_file_block_12 : _GEN_44; // @[regFile.scala 26:23:@13.6]
  assign _GEN_77 = reset ? register_file_block_13 : _GEN_45; // @[regFile.scala 26:23:@13.6]
  assign _GEN_78 = reset ? register_file_block_14 : _GEN_46; // @[regFile.scala 26:23:@13.6]
  assign _GEN_79 = reset ? register_file_block_15 : _GEN_47; // @[regFile.scala 26:23:@13.6]
  assign _GEN_80 = reset ? register_file_block_16 : _GEN_48; // @[regFile.scala 26:23:@13.6]
  assign _GEN_81 = reset ? register_file_block_17 : _GEN_49; // @[regFile.scala 26:23:@13.6]
  assign _GEN_82 = reset ? register_file_block_18 : _GEN_50; // @[regFile.scala 26:23:@13.6]
  assign _GEN_83 = reset ? register_file_block_19 : _GEN_51; // @[regFile.scala 26:23:@13.6]
  assign _GEN_84 = reset ? register_file_block_20 : _GEN_52; // @[regFile.scala 26:23:@13.6]
  assign _GEN_85 = reset ? register_file_block_21 : _GEN_53; // @[regFile.scala 26:23:@13.6]
  assign _GEN_86 = reset ? register_file_block_22 : _GEN_54; // @[regFile.scala 26:23:@13.6]
  assign _GEN_87 = reset ? register_file_block_23 : _GEN_55; // @[regFile.scala 26:23:@13.6]
  assign _GEN_88 = reset ? register_file_block_24 : _GEN_56; // @[regFile.scala 26:23:@13.6]
  assign _GEN_89 = reset ? register_file_block_25 : _GEN_57; // @[regFile.scala 26:23:@13.6]
  assign _GEN_90 = reset ? register_file_block_26 : _GEN_58; // @[regFile.scala 26:23:@13.6]
  assign _GEN_91 = reset ? register_file_block_27 : _GEN_59; // @[regFile.scala 26:23:@13.6]
  assign _GEN_92 = reset ? register_file_block_28 : _GEN_60; // @[regFile.scala 26:23:@13.6]
  assign _GEN_93 = reset ? register_file_block_29 : _GEN_61; // @[regFile.scala 26:23:@13.6]
  assign _GEN_94 = reset ? register_file_block_30 : _GEN_62; // @[regFile.scala 26:23:@13.6]
  assign _GEN_95 = reset ? register_file_block_31 : _GEN_63; // @[regFile.scala 26:23:@13.6]
  assign _GEN_129 = 5'h1 == io_read_sel1 ? register_file_block_1 : register_file_block_0; // @[regFile.scala 38:17:@28.4]
  assign _GEN_130 = 5'h2 == io_read_sel1 ? register_file_block_2 : _GEN_129; // @[regFile.scala 38:17:@28.4]
  assign _GEN_131 = 5'h3 == io_read_sel1 ? register_file_block_3 : _GEN_130; // @[regFile.scala 38:17:@28.4]
  assign _GEN_132 = 5'h4 == io_read_sel1 ? register_file_block_4 : _GEN_131; // @[regFile.scala 38:17:@28.4]
  assign _GEN_133 = 5'h5 == io_read_sel1 ? register_file_block_5 : _GEN_132; // @[regFile.scala 38:17:@28.4]
  assign _GEN_134 = 5'h6 == io_read_sel1 ? register_file_block_6 : _GEN_133; // @[regFile.scala 38:17:@28.4]
  assign _GEN_135 = 5'h7 == io_read_sel1 ? register_file_block_7 : _GEN_134; // @[regFile.scala 38:17:@28.4]
  assign _GEN_136 = 5'h8 == io_read_sel1 ? register_file_block_8 : _GEN_135; // @[regFile.scala 38:17:@28.4]
  assign _GEN_137 = 5'h9 == io_read_sel1 ? register_file_block_9 : _GEN_136; // @[regFile.scala 38:17:@28.4]
  assign _GEN_138 = 5'ha == io_read_sel1 ? register_file_block_10 : _GEN_137; // @[regFile.scala 38:17:@28.4]
  assign _GEN_139 = 5'hb == io_read_sel1 ? register_file_block_11 : _GEN_138; // @[regFile.scala 38:17:@28.4]
  assign _GEN_140 = 5'hc == io_read_sel1 ? register_file_block_12 : _GEN_139; // @[regFile.scala 38:17:@28.4]
  assign _GEN_141 = 5'hd == io_read_sel1 ? register_file_block_13 : _GEN_140; // @[regFile.scala 38:17:@28.4]
  assign _GEN_142 = 5'he == io_read_sel1 ? register_file_block_14 : _GEN_141; // @[regFile.scala 38:17:@28.4]
  assign _GEN_143 = 5'hf == io_read_sel1 ? register_file_block_15 : _GEN_142; // @[regFile.scala 38:17:@28.4]
  assign _GEN_144 = 5'h10 == io_read_sel1 ? register_file_block_16 : _GEN_143; // @[regFile.scala 38:17:@28.4]
  assign _GEN_145 = 5'h11 == io_read_sel1 ? register_file_block_17 : _GEN_144; // @[regFile.scala 38:17:@28.4]
  assign _GEN_146 = 5'h12 == io_read_sel1 ? register_file_block_18 : _GEN_145; // @[regFile.scala 38:17:@28.4]
  assign _GEN_147 = 5'h13 == io_read_sel1 ? register_file_block_19 : _GEN_146; // @[regFile.scala 38:17:@28.4]
  assign _GEN_148 = 5'h14 == io_read_sel1 ? register_file_block_20 : _GEN_147; // @[regFile.scala 38:17:@28.4]
  assign _GEN_149 = 5'h15 == io_read_sel1 ? register_file_block_21 : _GEN_148; // @[regFile.scala 38:17:@28.4]
  assign _GEN_150 = 5'h16 == io_read_sel1 ? register_file_block_22 : _GEN_149; // @[regFile.scala 38:17:@28.4]
  assign _GEN_151 = 5'h17 == io_read_sel1 ? register_file_block_23 : _GEN_150; // @[regFile.scala 38:17:@28.4]
  assign _GEN_152 = 5'h18 == io_read_sel1 ? register_file_block_24 : _GEN_151; // @[regFile.scala 38:17:@28.4]
  assign _GEN_153 = 5'h19 == io_read_sel1 ? register_file_block_25 : _GEN_152; // @[regFile.scala 38:17:@28.4]
  assign _GEN_154 = 5'h1a == io_read_sel1 ? register_file_block_26 : _GEN_153; // @[regFile.scala 38:17:@28.4]
  assign _GEN_155 = 5'h1b == io_read_sel1 ? register_file_block_27 : _GEN_154; // @[regFile.scala 38:17:@28.4]
  assign _GEN_156 = 5'h1c == io_read_sel1 ? register_file_block_28 : _GEN_155; // @[regFile.scala 38:17:@28.4]
  assign _GEN_157 = 5'h1d == io_read_sel1 ? register_file_block_29 : _GEN_156; // @[regFile.scala 38:17:@28.4]
  assign _GEN_158 = 5'h1e == io_read_sel1 ? register_file_block_30 : _GEN_157; // @[regFile.scala 38:17:@28.4]
  assign _GEN_161 = 5'h1 == io_read_sel2 ? register_file_block_1 : register_file_block_0; // @[regFile.scala 39:17:@29.4]
  assign _GEN_162 = 5'h2 == io_read_sel2 ? register_file_block_2 : _GEN_161; // @[regFile.scala 39:17:@29.4]
  assign _GEN_163 = 5'h3 == io_read_sel2 ? register_file_block_3 : _GEN_162; // @[regFile.scala 39:17:@29.4]
  assign _GEN_164 = 5'h4 == io_read_sel2 ? register_file_block_4 : _GEN_163; // @[regFile.scala 39:17:@29.4]
  assign _GEN_165 = 5'h5 == io_read_sel2 ? register_file_block_5 : _GEN_164; // @[regFile.scala 39:17:@29.4]
  assign _GEN_166 = 5'h6 == io_read_sel2 ? register_file_block_6 : _GEN_165; // @[regFile.scala 39:17:@29.4]
  assign _GEN_167 = 5'h7 == io_read_sel2 ? register_file_block_7 : _GEN_166; // @[regFile.scala 39:17:@29.4]
  assign _GEN_168 = 5'h8 == io_read_sel2 ? register_file_block_8 : _GEN_167; // @[regFile.scala 39:17:@29.4]
  assign _GEN_169 = 5'h9 == io_read_sel2 ? register_file_block_9 : _GEN_168; // @[regFile.scala 39:17:@29.4]
  assign _GEN_170 = 5'ha == io_read_sel2 ? register_file_block_10 : _GEN_169; // @[regFile.scala 39:17:@29.4]
  assign _GEN_171 = 5'hb == io_read_sel2 ? register_file_block_11 : _GEN_170; // @[regFile.scala 39:17:@29.4]
  assign _GEN_172 = 5'hc == io_read_sel2 ? register_file_block_12 : _GEN_171; // @[regFile.scala 39:17:@29.4]
  assign _GEN_173 = 5'hd == io_read_sel2 ? register_file_block_13 : _GEN_172; // @[regFile.scala 39:17:@29.4]
  assign _GEN_174 = 5'he == io_read_sel2 ? register_file_block_14 : _GEN_173; // @[regFile.scala 39:17:@29.4]
  assign _GEN_175 = 5'hf == io_read_sel2 ? register_file_block_15 : _GEN_174; // @[regFile.scala 39:17:@29.4]
  assign _GEN_176 = 5'h10 == io_read_sel2 ? register_file_block_16 : _GEN_175; // @[regFile.scala 39:17:@29.4]
  assign _GEN_177 = 5'h11 == io_read_sel2 ? register_file_block_17 : _GEN_176; // @[regFile.scala 39:17:@29.4]
  assign _GEN_178 = 5'h12 == io_read_sel2 ? register_file_block_18 : _GEN_177; // @[regFile.scala 39:17:@29.4]
  assign _GEN_179 = 5'h13 == io_read_sel2 ? register_file_block_19 : _GEN_178; // @[regFile.scala 39:17:@29.4]
  assign _GEN_180 = 5'h14 == io_read_sel2 ? register_file_block_20 : _GEN_179; // @[regFile.scala 39:17:@29.4]
  assign _GEN_181 = 5'h15 == io_read_sel2 ? register_file_block_21 : _GEN_180; // @[regFile.scala 39:17:@29.4]
  assign _GEN_182 = 5'h16 == io_read_sel2 ? register_file_block_22 : _GEN_181; // @[regFile.scala 39:17:@29.4]
  assign _GEN_183 = 5'h17 == io_read_sel2 ? register_file_block_23 : _GEN_182; // @[regFile.scala 39:17:@29.4]
  assign _GEN_184 = 5'h18 == io_read_sel2 ? register_file_block_24 : _GEN_183; // @[regFile.scala 39:17:@29.4]
  assign _GEN_185 = 5'h19 == io_read_sel2 ? register_file_block_25 : _GEN_184; // @[regFile.scala 39:17:@29.4]
  assign _GEN_186 = 5'h1a == io_read_sel2 ? register_file_block_26 : _GEN_185; // @[regFile.scala 39:17:@29.4]
  assign _GEN_187 = 5'h1b == io_read_sel2 ? register_file_block_27 : _GEN_186; // @[regFile.scala 39:17:@29.4]
  assign _GEN_188 = 5'h1c == io_read_sel2 ? register_file_block_28 : _GEN_187; // @[regFile.scala 39:17:@29.4]
  assign _GEN_189 = 5'h1d == io_read_sel2 ? register_file_block_29 : _GEN_188; // @[regFile.scala 39:17:@29.4]
  assign _GEN_190 = 5'h1e == io_read_sel2 ? register_file_block_30 : _GEN_189; // @[regFile.scala 39:17:@29.4]
  assign io_read_data1 = 5'h1f == io_read_sel1 ? register_file_block_31 : _GEN_158; // @[regFile.scala 38:17:@28.4]
  assign io_read_data2 = 5'h1f == io_read_sel2 ? register_file_block_31 : _GEN_190; // @[regFile.scala 39:17:@29.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  register_file_block_0 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  register_file_block_1 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  register_file_block_2 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  register_file_block_3 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  register_file_block_4 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  register_file_block_5 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  register_file_block_6 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  register_file_block_7 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  register_file_block_8 = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  register_file_block_9 = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  register_file_block_10 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  register_file_block_11 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  register_file_block_12 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  register_file_block_13 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  register_file_block_14 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  register_file_block_15 = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  register_file_block_16 = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  register_file_block_17 = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  register_file_block_18 = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  register_file_block_19 = _RAND_19[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  register_file_block_20 = _RAND_20[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  register_file_block_21 = _RAND_21[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  register_file_block_22 = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  register_file_block_23 = _RAND_23[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  register_file_block_24 = _RAND_24[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  register_file_block_25 = _RAND_25[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  register_file_block_26 = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  register_file_block_27 = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  register_file_block_28 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  register_file_block_29 = _RAND_29[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  register_file_block_30 = _RAND_30[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  register_file_block_31 = _RAND_31[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_60) begin
      if (reset) begin
        register_file_block_0 <= 32'h0;
      end else begin
        if (_T_68) begin
          if (5'h0 == io_write_sel) begin
            register_file_block_0 <= io_write_data;
          end
        end else begin
          register_file_block_0 <= 32'h0;
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1 == io_write_sel) begin
            register_file_block_1 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h2 == io_write_sel) begin
            register_file_block_2 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h3 == io_write_sel) begin
            register_file_block_3 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h4 == io_write_sel) begin
            register_file_block_4 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h5 == io_write_sel) begin
            register_file_block_5 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h6 == io_write_sel) begin
            register_file_block_6 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h7 == io_write_sel) begin
            register_file_block_7 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h8 == io_write_sel) begin
            register_file_block_8 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h9 == io_write_sel) begin
            register_file_block_9 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'ha == io_write_sel) begin
            register_file_block_10 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'hb == io_write_sel) begin
            register_file_block_11 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'hc == io_write_sel) begin
            register_file_block_12 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'hd == io_write_sel) begin
            register_file_block_13 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'he == io_write_sel) begin
            register_file_block_14 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'hf == io_write_sel) begin
            register_file_block_15 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h10 == io_write_sel) begin
            register_file_block_16 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h11 == io_write_sel) begin
            register_file_block_17 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h12 == io_write_sel) begin
            register_file_block_18 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h13 == io_write_sel) begin
            register_file_block_19 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h14 == io_write_sel) begin
            register_file_block_20 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h15 == io_write_sel) begin
            register_file_block_21 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h16 == io_write_sel) begin
            register_file_block_22 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h17 == io_write_sel) begin
            register_file_block_23 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h18 == io_write_sel) begin
            register_file_block_24 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h19 == io_write_sel) begin
            register_file_block_25 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1a == io_write_sel) begin
            register_file_block_26 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1b == io_write_sel) begin
            register_file_block_27 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1c == io_write_sel) begin
            register_file_block_28 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1d == io_write_sel) begin
            register_file_block_29 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1e == io_write_sel) begin
            register_file_block_30 <= io_write_data;
          end
        end
      end
    end
    if (_T_60) begin
      if (!(reset)) begin
        if (_T_68) begin
          if (5'h1f == io_write_sel) begin
            register_file_block_31 <= io_write_data;
          end
        end
      end
    end
  end
endmodule
module decode( // @[:@31.2]
  input         clock, // @[:@32.4]
  input         reset, // @[:@33.4]
  input         io_clock, // @[:@34.4]
  input         io_reset, // @[:@34.4]
  input  [19:0] io_PC, // @[:@34.4]
  input  [31:0] io_instruction, // @[:@34.4]
  input  [1:0]  io_extend_sel, // @[:@34.4]
  input         io_write, // @[:@34.4]
  input  [4:0]  io_write_reg, // @[:@34.4]
  input  [31:0] io_write_data, // @[:@34.4]
  output [31:0] io_rs1_data, // @[:@34.4]
  output [31:0] io_rs2_data, // @[:@34.4]
  output [4:0]  io_rd, // @[:@34.4]
  output [6:0]  io_opcode, // @[:@34.4]
  output [6:0]  io_funct7, // @[:@34.4]
  output [2:0]  io_funct3, // @[:@34.4]
  output [31:0] io_extend_imm, // @[:@34.4]
  output [19:0] io_branch_target, // @[:@34.4]
  output [19:0] io_JAL_target // @[:@34.4]
);
  wire  registerfile0_clock; // @[decode.scala 70:29:@99.4]
  wire  registerfile0_reset; // @[decode.scala 70:29:@99.4]
  wire  registerfile0_io_wEn; // @[decode.scala 70:29:@99.4]
  wire [31:0] registerfile0_io_write_data; // @[decode.scala 70:29:@99.4]
  wire [4:0] registerfile0_io_read_sel1; // @[decode.scala 70:29:@99.4]
  wire [4:0] registerfile0_io_read_sel2; // @[decode.scala 70:29:@99.4]
  wire [4:0] registerfile0_io_write_sel; // @[decode.scala 70:29:@99.4]
  wire [31:0] registerfile0_io_read_data1; // @[decode.scala 70:29:@99.4]
  wire [31:0] registerfile0_io_read_data2; // @[decode.scala 70:29:@99.4]
  wire [11:0] i_imm; // @[decode.scala 39:34:@38.4]
  wire [6:0] s_imm_msb; // @[decode.scala 40:34:@39.4]
  wire [4:0] s_imm_lsb; // @[decode.scala 41:34:@40.4]
  wire [19:0] u_imm; // @[decode.scala 42:34:@41.4]
  wire  _T_39; // @[decode.scala 44:38:@43.4]
  wire [7:0] _T_40; // @[decode.scala 44:58:@44.4]
  wire  _T_41; // @[decode.scala 44:81:@45.4]
  wire [10:0] _T_42; // @[decode.scala 44:101:@46.4]
  wire [11:0] _T_43; // @[Cat.scala 30:58:@47.4]
  wire [8:0] _T_44; // @[Cat.scala 30:58:@48.4]
  wire [20:0] uj_imm_32; // @[Cat.scala 30:58:@49.4]
  wire [11:0] s_imm_orig; // @[Cat.scala 30:58:@50.4]
  wire  _T_45; // @[decode.scala 47:34:@51.4]
  wire  _T_46; // @[decode.scala 47:47:@52.4]
  wire [5:0] _T_47; // @[decode.scala 47:60:@53.4]
  wire [3:0] _T_48; // @[decode.scala 47:75:@54.4]
  wire [4:0] _T_50; // @[Cat.scala 30:58:@55.4]
  wire [1:0] _T_51; // @[Cat.scala 30:58:@56.4]
  wire [7:0] _T_52; // @[Cat.scala 30:58:@57.4]
  wire [12:0] sb_imm_orig; // @[Cat.scala 30:58:@58.4]
  wire  _T_53; // @[decode.scala 48:45:@59.4]
  wire [18:0] _T_57; // @[Bitwise.scala 72:12:@61.4]
  wire [31:0] sb_imm_32; // @[Cat.scala 30:58:@62.4]
  wire [31:0] u_imm_32; // @[Cat.scala 30:58:@63.4]
  wire  _T_59; // @[decode.scala 50:44:@64.4]
  wire [19:0] _T_63; // @[Bitwise.scala 72:12:@66.4]
  wire [31:0] i_imm_32; // @[Cat.scala 30:58:@68.4]
  wire  _T_65; // @[decode.scala 51:44:@69.4]
  wire [19:0] _T_69; // @[Bitwise.scala 72:12:@71.4]
  wire [31:0] s_imm_32; // @[Cat.scala 30:58:@72.4]
  wire  _T_71; // @[decode.scala 55:22:@73.4]
  wire  _T_73; // @[decode.scala 57:30:@78.6]
  wire [31:0] _GEN_0; // @[decode.scala 57:52:@79.6]
  wire [20:0] _GEN_2; // @[decode.scala 66:33:@93.4]
  wire [21:0] _T_78; // @[decode.scala 66:33:@93.4]
  wire [20:0] _T_79; // @[decode.scala 66:33:@94.4]
  wire [31:0] _GEN_3; // @[decode.scala 67:29:@96.4]
  wire [32:0] _T_80; // @[decode.scala 67:29:@96.4]
  wire [31:0] _T_81; // @[decode.scala 67:29:@97.4]
  register_file registerfile0 ( // @[decode.scala 70:29:@99.4]
    .clock(registerfile0_clock),
    .reset(registerfile0_reset),
    .io_wEn(registerfile0_io_wEn),
    .io_write_data(registerfile0_io_write_data),
    .io_read_sel1(registerfile0_io_read_sel1),
    .io_read_sel2(registerfile0_io_read_sel2),
    .io_write_sel(registerfile0_io_write_sel),
    .io_read_data1(registerfile0_io_read_data1),
    .io_read_data2(registerfile0_io_read_data2)
  );
  assign i_imm = io_instruction[31:20]; // @[decode.scala 39:34:@38.4]
  assign s_imm_msb = io_instruction[31:25]; // @[decode.scala 40:34:@39.4]
  assign s_imm_lsb = io_instruction[11:7]; // @[decode.scala 41:34:@40.4]
  assign u_imm = io_instruction[31:12]; // @[decode.scala 42:34:@41.4]
  assign _T_39 = io_instruction[31]; // @[decode.scala 44:38:@43.4]
  assign _T_40 = io_instruction[19:12]; // @[decode.scala 44:58:@44.4]
  assign _T_41 = io_instruction[20]; // @[decode.scala 44:81:@45.4]
  assign _T_42 = io_instruction[31:21]; // @[decode.scala 44:101:@46.4]
  assign _T_43 = {_T_41,_T_42}; // @[Cat.scala 30:58:@47.4]
  assign _T_44 = {_T_39,_T_40}; // @[Cat.scala 30:58:@48.4]
  assign uj_imm_32 = {_T_44,_T_43}; // @[Cat.scala 30:58:@49.4]
  assign s_imm_orig = {s_imm_msb,s_imm_lsb}; // @[Cat.scala 30:58:@50.4]
  assign _T_45 = s_imm_msb[6]; // @[decode.scala 47:34:@51.4]
  assign _T_46 = s_imm_lsb[0]; // @[decode.scala 47:47:@52.4]
  assign _T_47 = s_imm_msb[5:0]; // @[decode.scala 47:60:@53.4]
  assign _T_48 = s_imm_lsb[4:1]; // @[decode.scala 47:75:@54.4]
  assign _T_50 = {_T_48,1'h0}; // @[Cat.scala 30:58:@55.4]
  assign _T_51 = {_T_45,_T_46}; // @[Cat.scala 30:58:@56.4]
  assign _T_52 = {_T_51,_T_47}; // @[Cat.scala 30:58:@57.4]
  assign sb_imm_orig = {_T_52,_T_50}; // @[Cat.scala 30:58:@58.4]
  assign _T_53 = sb_imm_orig[12]; // @[decode.scala 48:45:@59.4]
  assign _T_57 = _T_53 ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12:@61.4]
  assign sb_imm_32 = {_T_57,sb_imm_orig}; // @[Cat.scala 30:58:@62.4]
  assign u_imm_32 = {u_imm,12'h0}; // @[Cat.scala 30:58:@63.4]
  assign _T_59 = i_imm[11]; // @[decode.scala 50:44:@64.4]
  assign _T_63 = _T_59 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12:@66.4]
  assign i_imm_32 = {_T_63,i_imm}; // @[Cat.scala 30:58:@68.4]
  assign _T_65 = s_imm_orig[11]; // @[decode.scala 51:44:@69.4]
  assign _T_69 = _T_65 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12:@71.4]
  assign s_imm_32 = {_T_69,s_imm_orig}; // @[Cat.scala 30:58:@72.4]
  assign _T_71 = io_extend_sel == 2'h1; // @[decode.scala 55:22:@73.4]
  assign _T_73 = io_extend_sel == 2'h2; // @[decode.scala 57:30:@78.6]
  assign _GEN_0 = _T_73 ? u_imm_32 : i_imm_32; // @[decode.scala 57:52:@79.6]
  assign _GEN_2 = {{1'd0}, io_PC}; // @[decode.scala 66:33:@93.4]
  assign _T_78 = uj_imm_32 + _GEN_2; // @[decode.scala 66:33:@93.4]
  assign _T_79 = _T_78[20:0]; // @[decode.scala 66:33:@94.4]
  assign _GEN_3 = {{12'd0}, io_PC}; // @[decode.scala 67:29:@96.4]
  assign _T_80 = _GEN_3 + sb_imm_32; // @[decode.scala 67:29:@96.4]
  assign _T_81 = _T_80[31:0]; // @[decode.scala 67:29:@97.4]
  assign io_rs1_data = registerfile0_io_read_data1; // @[decode.scala 79:17:@109.4]
  assign io_rs2_data = registerfile0_io_read_data2; // @[decode.scala 80:17:@110.4]
  assign io_rd = io_instruction[11:7]; // @[decode.scala 65:13:@92.4]
  assign io_opcode = io_instruction[6:0]; // @[decode.scala 62:13:@86.4]
  assign io_funct7 = io_instruction[31:25]; // @[decode.scala 63:13:@88.4]
  assign io_funct3 = io_instruction[14:12]; // @[decode.scala 64:13:@90.4]
  assign io_extend_imm = _T_71 ? s_imm_32 : _GEN_0; // @[decode.scala 56:19:@75.6 decode.scala 58:20:@80.8 decode.scala 60:20:@83.8]
  assign io_branch_target = _T_81[19:0]; // @[decode.scala 67:20:@98.4]
  assign io_JAL_target = _T_79[19:0]; // @[decode.scala 66:20:@95.4]
  assign registerfile0_clock = clock; // @[:@100.4]
  assign registerfile0_reset = reset; // @[:@101.4]
  assign registerfile0_io_wEn = io_write; // @[decode.scala 73:33:@104.4]
  assign registerfile0_io_write_data = io_write_data; // @[decode.scala 74:33:@105.4]
  assign registerfile0_io_read_sel1 = io_instruction[19:15]; // @[decode.scala 75:33:@106.4]
  assign registerfile0_io_read_sel2 = io_instruction[24:20]; // @[decode.scala 76:33:@107.4]
  assign registerfile0_io_write_sel = io_write_data[4:0]; // @[decode.scala 77:33:@108.4]
endmodule
