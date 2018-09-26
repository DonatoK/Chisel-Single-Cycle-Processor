module ALU( // @[:@3.2]
  input  [5:0]  io_ALU_Control, // @[:@6.4]
  input  [31:0] io_operand_A, // @[:@6.4]
  input  [31:0] io_operand_B, // @[:@6.4]
  output        io_zero, // @[:@6.4]
  output        io_branch, // @[:@6.4]
  output [31:0] io_ALU_Result // @[:@6.4]
);
  wire [4:0] shift_amount; // @[ALU.scala 19:34:@8.4]
  wire [1:0] _T_19; // @[ALU.scala 22:32:@11.4]
  wire  _T_21; // @[ALU.scala 22:38:@12.4]
  wire  _T_23; // @[ALU.scala 22:66:@13.4]
  wire  _T_26; // @[ALU.scala 25:24:@16.4]
  wire [32:0] _T_27; // @[ALU.scala 26:35:@18.6]
  wire [31:0] _T_28; // @[ALU.scala 26:35:@19.6]
  wire  _T_30; // @[ALU.scala 27:31:@23.6]
  wire [32:0] _T_31; // @[ALU.scala 28:35:@25.8]
  wire [32:0] _T_32; // @[ALU.scala 28:35:@26.8]
  wire [31:0] _T_33; // @[ALU.scala 28:35:@27.8]
  wire  _T_35; // @[ALU.scala 29:31:@31.8]
  wire [31:0] _T_36; // @[ALU.scala 30:35:@33.10]
  wire  _T_38; // @[ALU.scala 31:31:@37.10]
  wire [31:0] _T_39; // @[ALU.scala 32:35:@39.12]
  wire  _T_41; // @[ALU.scala 33:31:@43.12]
  wire [31:0] _T_42; // @[ALU.scala 34:35:@45.14]
  wire  _T_44; // @[ALU.scala 35:31:@49.14]
  wire  _T_45; // @[ALU.scala 36:35:@51.16]
  wire  _T_47; // @[ALU.scala 37:31:@55.16]
  wire  _T_50; // @[ALU.scala 39:31:@61.18]
  wire [62:0] _GEN_17; // @[ALU.scala 40:35:@63.20]
  wire [62:0] _T_51; // @[ALU.scala 40:35:@63.20]
  wire  _T_53; // @[ALU.scala 41:31:@67.20]
  wire [31:0] _T_54; // @[ALU.scala 42:34:@69.22]
  wire  _T_56; // @[ALU.scala 43:31:@73.22]
  wire  _T_59; // @[ALU.scala 45:31:@79.24]
  wire [32:0] _T_61; // @[ALU.scala 46:35:@81.26]
  wire [31:0] _T_62; // @[ALU.scala 46:35:@82.26]
  wire  _T_64; // @[ALU.scala 47:31:@86.26]
  wire  _T_65; // @[ALU.scala 48:35:@88.28]
  wire  _T_67; // @[ALU.scala 49:31:@92.28]
  wire  _T_68; // @[ALU.scala 50:35:@94.30]
  wire  _T_70; // @[ALU.scala 51:31:@98.30]
  wire  _T_73; // @[ALU.scala 53:31:@104.32]
  wire  _T_74; // @[ALU.scala 54:34:@106.34]
  wire  _T_76; // @[ALU.scala 55:31:@110.34]
  wire  _T_79; // @[ALU.scala 57:31:@116.36]
  wire  _GEN_0; // @[ALU.scala 57:43:@117.36]
  wire  _GEN_1; // @[ALU.scala 55:43:@111.34]
  wire  _GEN_2; // @[ALU.scala 53:43:@105.32]
  wire  _GEN_3; // @[ALU.scala 51:43:@99.30]
  wire  _GEN_4; // @[ALU.scala 49:43:@93.28]
  wire  _GEN_5; // @[ALU.scala 47:43:@87.26]
  wire [31:0] _GEN_6; // @[ALU.scala 45:43:@80.24]
  wire [31:0] _GEN_7; // @[ALU.scala 43:43:@74.22]
  wire [31:0] _GEN_8; // @[ALU.scala 41:43:@68.20]
  wire [62:0] _GEN_9; // @[ALU.scala 39:43:@62.18]
  wire [62:0] _GEN_10; // @[ALU.scala 37:43:@56.16]
  wire [62:0] _GEN_11; // @[ALU.scala 35:44:@50.14]
  wire [62:0] _GEN_12; // @[ALU.scala 33:44:@44.12]
  wire [62:0] _GEN_13; // @[ALU.scala 31:44:@38.10]
  wire [62:0] _GEN_14; // @[ALU.scala 29:44:@32.8]
  wire [62:0] _GEN_15; // @[ALU.scala 27:44:@24.6]
  wire [62:0] _GEN_16; // @[ALU.scala 25:37:@17.4]
  assign shift_amount = io_operand_B[4:0]; // @[ALU.scala 19:34:@8.4]
  assign _T_19 = io_ALU_Control[4:3]; // @[ALU.scala 22:32:@11.4]
  assign _T_21 = _T_19 == 2'h2; // @[ALU.scala 22:38:@12.4]
  assign _T_23 = io_ALU_Result == 32'h1; // @[ALU.scala 22:66:@13.4]
  assign _T_26 = io_ALU_Control == 6'h0; // @[ALU.scala 25:24:@16.4]
  assign _T_27 = io_operand_A + io_operand_B; // @[ALU.scala 26:35:@18.6]
  assign _T_28 = _T_27[31:0]; // @[ALU.scala 26:35:@19.6]
  assign _T_30 = io_ALU_Control == 6'h8; // @[ALU.scala 27:31:@23.6]
  assign _T_31 = io_operand_A - io_operand_B; // @[ALU.scala 28:35:@25.8]
  assign _T_32 = $unsigned(_T_31); // @[ALU.scala 28:35:@26.8]
  assign _T_33 = _T_32[31:0]; // @[ALU.scala 28:35:@27.8]
  assign _T_35 = io_ALU_Control == 6'h4; // @[ALU.scala 29:31:@31.8]
  assign _T_36 = io_operand_A ^ io_operand_B; // @[ALU.scala 30:35:@33.10]
  assign _T_38 = io_ALU_Control == 6'h6; // @[ALU.scala 31:31:@37.10]
  assign _T_39 = io_operand_A | io_operand_B; // @[ALU.scala 32:35:@39.12]
  assign _T_41 = io_ALU_Control == 6'h7; // @[ALU.scala 33:31:@43.12]
  assign _T_42 = io_operand_A & io_operand_B; // @[ALU.scala 34:35:@45.14]
  assign _T_44 = io_ALU_Control == 6'h2; // @[ALU.scala 35:31:@49.14]
  assign _T_45 = io_operand_A < io_operand_B; // @[ALU.scala 36:35:@51.16]
  assign _T_47 = io_ALU_Control == 6'h3; // @[ALU.scala 37:31:@55.16]
  assign _T_50 = io_ALU_Control == 6'h1; // @[ALU.scala 39:31:@61.18]
  assign _GEN_17 = {{31'd0}, io_operand_A}; // @[ALU.scala 40:35:@63.20]
  assign _T_51 = _GEN_17 << shift_amount; // @[ALU.scala 40:35:@63.20]
  assign _T_53 = io_ALU_Control == 6'h5; // @[ALU.scala 41:31:@67.20]
  assign _T_54 = io_operand_A >> shift_amount; // @[ALU.scala 42:34:@69.22]
  assign _T_56 = io_ALU_Control == 6'hd; // @[ALU.scala 43:31:@73.22]
  assign _T_59 = io_ALU_Control == 6'h1f; // @[ALU.scala 45:31:@79.24]
  assign _T_61 = io_operand_A + 32'h4; // @[ALU.scala 46:35:@81.26]
  assign _T_62 = _T_61[31:0]; // @[ALU.scala 46:35:@82.26]
  assign _T_64 = io_ALU_Control == 6'h10; // @[ALU.scala 47:31:@86.26]
  assign _T_65 = io_operand_A == io_operand_B; // @[ALU.scala 48:35:@88.28]
  assign _T_67 = io_ALU_Control == 6'h11; // @[ALU.scala 49:31:@92.28]
  assign _T_68 = io_operand_A != io_operand_B; // @[ALU.scala 50:35:@94.30]
  assign _T_70 = io_ALU_Control == 6'h14; // @[ALU.scala 51:31:@98.30]
  assign _T_73 = io_ALU_Control == 6'h15; // @[ALU.scala 53:31:@104.32]
  assign _T_74 = io_operand_A >= io_operand_B; // @[ALU.scala 54:34:@106.34]
  assign _T_76 = io_ALU_Control == 6'h16; // @[ALU.scala 55:31:@110.34]
  assign _T_79 = io_ALU_Control == 6'h17; // @[ALU.scala 57:31:@116.36]
  assign _GEN_0 = _T_79 ? _T_74 : 1'h0; // @[ALU.scala 57:43:@117.36]
  assign _GEN_1 = _T_76 ? _T_45 : _GEN_0; // @[ALU.scala 55:43:@111.34]
  assign _GEN_2 = _T_73 ? _T_74 : _GEN_1; // @[ALU.scala 53:43:@105.32]
  assign _GEN_3 = _T_70 ? _T_45 : _GEN_2; // @[ALU.scala 51:43:@99.30]
  assign _GEN_4 = _T_67 ? _T_68 : _GEN_3; // @[ALU.scala 49:43:@93.28]
  assign _GEN_5 = _T_64 ? _T_65 : _GEN_4; // @[ALU.scala 47:43:@87.26]
  assign _GEN_6 = _T_59 ? _T_62 : {{31'd0}, _GEN_5}; // @[ALU.scala 45:43:@80.24]
  assign _GEN_7 = _T_56 ? _T_54 : _GEN_6; // @[ALU.scala 43:43:@74.22]
  assign _GEN_8 = _T_53 ? _T_54 : _GEN_7; // @[ALU.scala 41:43:@68.20]
  assign _GEN_9 = _T_50 ? _T_51 : {{31'd0}, _GEN_8}; // @[ALU.scala 39:43:@62.18]
  assign _GEN_10 = _T_47 ? {{62'd0}, _T_45} : _GEN_9; // @[ALU.scala 37:43:@56.16]
  assign _GEN_11 = _T_44 ? {{62'd0}, _T_45} : _GEN_10; // @[ALU.scala 35:44:@50.14]
  assign _GEN_12 = _T_41 ? {{31'd0}, _T_42} : _GEN_11; // @[ALU.scala 33:44:@44.12]
  assign _GEN_13 = _T_38 ? {{31'd0}, _T_39} : _GEN_12; // @[ALU.scala 31:44:@38.10]
  assign _GEN_14 = _T_35 ? {{31'd0}, _T_36} : _GEN_13; // @[ALU.scala 29:44:@32.8]
  assign _GEN_15 = _T_30 ? {{31'd0}, _T_33} : _GEN_14; // @[ALU.scala 27:44:@24.6]
  assign _GEN_16 = _T_26 ? {{31'd0}, _T_28} : _GEN_15; // @[ALU.scala 25:37:@17.4]
  assign io_zero = io_ALU_Result == 32'h0; // @[ALU.scala 21:13:@10.4]
  assign io_branch = _T_21 & _T_23; // @[ALU.scala 22:13:@15.4]
  assign io_ALU_Result = _GEN_16[31:0]; // @[ALU.scala 26:19:@20.6 ALU.scala 28:19:@28.8 ALU.scala 30:19:@34.10 ALU.scala 32:19:@40.12 ALU.scala 34:19:@46.14 ALU.scala 36:19:@52.16 ALU.scala 38:19:@58.18 ALU.scala 40:19:@64.20 ALU.scala 42:18:@70.22 ALU.scala 44:18:@76.24 ALU.scala 46:19:@83.26 ALU.scala 48:19:@89.28 ALU.scala 50:19:@95.30 ALU.scala 52:19:@101.32 ALU.scala 54:18:@107.34 ALU.scala 56:19:@113.36 ALU.scala 58:19:@119.38 ALU.scala 60:20:@122.38]
endmodule
module execute( // @[:@125.2]
  input         clock, // @[:@126.4]
  input         reset, // @[:@127.4]
  input         io_clock, // @[:@128.4]
  input         io_reset, // @[:@128.4]
  input  [2:0]  io_ALU_Operation, // @[:@128.4]
  input  [2:0]  io_funct3, // @[:@128.4]
  input  [6:0]  io_funct7, // @[:@128.4]
  input  [19:0] io_PC, // @[:@128.4]
  input  [1:0]  io_ALU_ASrc, // @[:@128.4]
  input         io_ALU_BSrc, // @[:@128.4]
  input         io_branch_op, // @[:@128.4]
  input  [31:0] io_regRead1, // @[:@128.4]
  input  [31:0] io_regRead2, // @[:@128.4]
  input  [31:0] io_extend, // @[:@128.4]
  output [31:0] io_ALU_Result, // @[:@128.4]
  output        io_zero, // @[:@128.4]
  output        io_branch, // @[:@128.4]
  output [19:0] io_JALR_target // @[:@128.4]
);
  wire [5:0] ALU0_io_ALU_Control; // @[execute.scala 82:19:@233.4]
  wire [31:0] ALU0_io_operand_A; // @[execute.scala 82:19:@233.4]
  wire [31:0] ALU0_io_operand_B; // @[execute.scala 82:19:@233.4]
  wire  ALU0_io_zero; // @[execute.scala 82:19:@233.4]
  wire  ALU0_io_branch; // @[execute.scala 82:19:@233.4]
  wire [31:0] ALU0_io_ALU_Result; // @[execute.scala 82:19:@233.4]
  wire  _T_42; // @[execute.scala 38:27:@134.4]
  wire  _T_45; // @[execute.scala 40:34:@139.6]
  wire [5:0] _T_46; // @[Cat.scala 30:58:@141.8]
  wire  _T_48; // @[execute.scala 43:34:@145.8]
  wire  _T_50; // @[execute.scala 43:71:@146.8]
  wire  _T_51; // @[execute.scala 43:58:@147.8]
  wire  _T_56; // @[execute.scala 45:71:@154.10]
  wire  _T_57; // @[execute.scala 45:58:@155.10]
  wire [5:0] _T_59; // @[Cat.scala 30:58:@157.12]
  wire  _T_64; // @[execute.scala 50:34:@167.14]
  wire  _T_67; // @[execute.scala 50:58:@169.14]
  wire  _T_69; // @[execute.scala 50:110:@170.14]
  wire  _T_70; // @[execute.scala 50:98:@171.14]
  wire [5:0] _T_72; // @[Cat.scala 30:58:@173.16]
  wire  _T_77; // @[execute.scala 52:58:@179.16]
  wire  _T_80; // @[execute.scala 52:98:@181.16]
  wire  _T_87; // @[execute.scala 54:59:@189.18]
  wire [5:0] _GEN_0; // @[execute.scala 56:56:@196.20]
  wire [5:0] _GEN_1; // @[execute.scala 54:96:@190.18]
  wire [5:0] _GEN_2; // @[execute.scala 52:133:@182.16]
  wire [5:0] _GEN_3; // @[execute.scala 50:133:@172.14]
  wire [5:0] _GEN_4; // @[execute.scala 47:56:@162.12]
  wire [5:0] _GEN_5; // @[execute.scala 45:99:@156.10]
  wire [5:0] _GEN_6; // @[execute.scala 43:99:@148.8]
  wire [5:0] _GEN_7; // @[execute.scala 40:57:@140.6]
  wire  _T_96; // @[execute.scala 62:21:@203.4]
  wire  _T_98; // @[execute.scala 64:28:@208.6]
  wire [20:0] _T_100; // @[execute.scala 65:24:@210.8]
  wire [19:0] _T_101; // @[execute.scala 65:24:@211.8]
  wire [31:0] _GEN_9; // @[execute.scala 64:50:@209.6]
  wire [1:0] _GEN_13; // @[execute.scala 70:21:@217.4]
  wire  _T_103; // @[execute.scala 70:21:@217.4]
  wire  ALU_branch; // @[execute.scala 34:25:@131.4 execute.scala 88:19:@240.4]
  wire [32:0] _T_109; // @[execute.scala 94:33:@242.4]
  wire [31:0] _T_110; // @[execute.scala 94:33:@243.4]
  wire [31:0] _T_112; // @[execute.scala 94:46:@244.4]
  ALU ALU0 ( // @[execute.scala 82:19:@233.4]
    .io_ALU_Control(ALU0_io_ALU_Control),
    .io_operand_A(ALU0_io_operand_A),
    .io_operand_B(ALU0_io_operand_B),
    .io_zero(ALU0_io_zero),
    .io_branch(ALU0_io_branch),
    .io_ALU_Result(ALU0_io_ALU_Result)
  );
  assign _T_42 = io_ALU_Operation == 3'h3; // @[execute.scala 38:27:@134.4]
  assign _T_45 = io_ALU_Operation == 3'h2; // @[execute.scala 40:34:@139.6]
  assign _T_46 = {io_ALU_Operation,io_funct3}; // @[Cat.scala 30:58:@141.8]
  assign _T_48 = io_ALU_Operation == 3'h0; // @[execute.scala 43:34:@145.8]
  assign _T_50 = io_funct7 == 7'h0; // @[execute.scala 43:71:@146.8]
  assign _T_51 = _T_48 & _T_50; // @[execute.scala 43:58:@147.8]
  assign _T_56 = io_funct7 == 7'h20; // @[execute.scala 45:71:@154.10]
  assign _T_57 = _T_48 & _T_56; // @[execute.scala 45:58:@155.10]
  assign _T_59 = {3'h1,io_funct3}; // @[Cat.scala 30:58:@157.12]
  assign _T_64 = io_ALU_Operation == 3'h1; // @[execute.scala 50:34:@167.14]
  assign _T_67 = _T_64 & _T_50; // @[execute.scala 50:58:@169.14]
  assign _T_69 = io_funct3 == 3'h5; // @[execute.scala 50:110:@170.14]
  assign _T_70 = _T_67 & _T_69; // @[execute.scala 50:98:@171.14]
  assign _T_72 = {3'h0,io_funct3}; // @[Cat.scala 30:58:@173.16]
  assign _T_77 = _T_64 & _T_56; // @[execute.scala 52:58:@179.16]
  assign _T_80 = _T_77 & _T_69; // @[execute.scala 52:98:@181.16]
  assign _T_87 = _T_64 & _T_69; // @[execute.scala 54:59:@189.18]
  assign _GEN_0 = _T_64 ? _T_72 : 6'h0; // @[execute.scala 56:56:@196.20]
  assign _GEN_1 = _T_87 ? _T_72 : _GEN_0; // @[execute.scala 54:96:@190.18]
  assign _GEN_2 = _T_80 ? _T_59 : _GEN_1; // @[execute.scala 52:133:@182.16]
  assign _GEN_3 = _T_70 ? _T_72 : _GEN_2; // @[execute.scala 50:133:@172.14]
  assign _GEN_4 = _T_48 ? _T_46 : _GEN_3; // @[execute.scala 47:56:@162.12]
  assign _GEN_5 = _T_57 ? _T_59 : _GEN_4; // @[execute.scala 45:99:@156.10]
  assign _GEN_6 = _T_51 ? _T_46 : _GEN_5; // @[execute.scala 43:99:@148.8]
  assign _GEN_7 = _T_45 ? _T_46 : _GEN_6; // @[execute.scala 40:57:@140.6]
  assign _T_96 = io_ALU_ASrc == 2'h1; // @[execute.scala 62:21:@203.4]
  assign _T_98 = io_ALU_ASrc == 2'h2; // @[execute.scala 64:28:@208.6]
  assign _T_100 = io_PC + 20'h4; // @[execute.scala 65:24:@210.8]
  assign _T_101 = _T_100[19:0]; // @[execute.scala 65:24:@211.8]
  assign _GEN_9 = _T_98 ? {{12'd0}, _T_101} : io_regRead1; // @[execute.scala 64:50:@209.6]
  assign _GEN_13 = {{1'd0}, io_ALU_BSrc}; // @[execute.scala 70:21:@217.4]
  assign _T_103 = _GEN_13 == 2'h1; // @[execute.scala 70:21:@217.4]
  assign ALU_branch = ALU0_io_branch; // @[execute.scala 34:25:@131.4 execute.scala 88:19:@240.4]
  assign _T_109 = io_regRead1 + io_extend; // @[execute.scala 94:33:@242.4]
  assign _T_110 = _T_109[31:0]; // @[execute.scala 94:33:@243.4]
  assign _T_112 = _T_110 & 32'hfffffffe; // @[execute.scala 94:46:@244.4]
  assign io_ALU_Result = ALU0_io_ALU_Result; // @[execute.scala 89:19:@241.4]
  assign io_zero = ALU0_io_zero; // @[execute.scala 87:19:@239.4]
  assign io_branch = ALU_branch & io_branch_op; // @[execute.scala 77:15:@228.6 execute.scala 79:15:@231.6]
  assign io_JALR_target = _T_112[19:0]; // @[execute.scala 94:16:@245.4]
  assign ALU0_io_ALU_Control = _T_42 ? 6'h1f : _GEN_7; // @[execute.scala 83:25:@236.4]
  assign ALU0_io_operand_A = _T_96 ? {{12'd0}, io_PC} : _GEN_9; // @[execute.scala 84:25:@237.4]
  assign ALU0_io_operand_B = _T_103 ? io_extend : io_regRead2; // @[execute.scala 85:25:@238.4]
endmodule
