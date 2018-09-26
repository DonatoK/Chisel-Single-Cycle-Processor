module bsram( // @[:@3.2]
  input         clock, // @[:@4.4]
  input  [19:0] io_readAddress, // @[:@6.4]
  input         io_readEnable, // @[:@6.4]
  input  [19:0] io_writeAddress, // @[:@6.4]
  input  [31:0] io_writeData, // @[:@6.4]
  output [31:0] io_readData // @[:@6.4]
);
  reg [31:0] mem [0:1023]; // @[bsram.scala 25:22:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] mem__T_31_data; // @[bsram.scala 25:22:@8.4]
  wire [9:0] mem__T_31_addr; // @[bsram.scala 25:22:@8.4]
  wire [31:0] mem__T_24_data; // @[bsram.scala 25:22:@8.4]
  wire [9:0] mem__T_24_addr; // @[bsram.scala 25:22:@8.4]
  wire  mem__T_24_mask; // @[bsram.scala 25:22:@8.4]
  wire  mem__T_24_en; // @[bsram.scala 25:22:@8.4]
  wire  _T_25; // @[bsram.scala 28:55:@12.4]
  wire [9:0] _T_30; // @[bsram.scala 28:24:@18.6]
  reg [9:0] mem__T_31_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign mem__T_31_addr = mem__T_31_addr_pipe_0;
  assign mem__T_31_data = mem[mem__T_31_addr]; // @[bsram.scala 25:22:@8.4]
  assign mem__T_24_data = io_writeData;
  assign mem__T_24_addr = io_writeAddress[9:0];
  assign mem__T_24_mask = 1'h1;
  assign mem__T_24_en = 1'h1;
  assign _T_25 = io_readEnable; // @[bsram.scala 28:55:@12.4]
  assign _T_30 = io_readAddress[9:0]; // @[bsram.scala 28:24:@18.6]
  assign io_readData = mem__T_31_data; // @[bsram.scala 28:13:@21.4]
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
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  mem__T_31_addr_pipe_0 = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_24_en & mem__T_24_mask) begin
      mem[mem__T_24_addr] <= mem__T_24_data; // @[bsram.scala 25:22:@8.4]
    end
    if (_T_25) begin
      mem__T_31_addr_pipe_0 <= _T_30;
    end
  end
endmodule
module mem_interface( // @[:@23.2]
  input         clock, // @[:@24.4]
  input         io_read, // @[:@26.4]
  input  [19:0] io_address, // @[:@26.4]
  input  [31:0] io_in_data, // @[:@26.4]
  output [19:0] io_out_address, // @[:@26.4]
  output [31:0] io_out_data // @[:@26.4]
);
  wire  bsram0_clock; // @[mem_interface.scala 25:21:@28.4]
  wire [19:0] bsram0_io_readAddress; // @[mem_interface.scala 25:21:@28.4]
  wire  bsram0_io_readEnable; // @[mem_interface.scala 25:21:@28.4]
  wire [19:0] bsram0_io_writeAddress; // @[mem_interface.scala 25:21:@28.4]
  wire [31:0] bsram0_io_writeData; // @[mem_interface.scala 25:21:@28.4]
  wire [31:0] bsram0_io_readData; // @[mem_interface.scala 25:21:@28.4]
  bsram bsram0 ( // @[mem_interface.scala 25:21:@28.4]
    .clock(bsram0_clock),
    .io_readAddress(bsram0_io_readAddress),
    .io_readEnable(bsram0_io_readEnable),
    .io_writeAddress(bsram0_io_writeAddress),
    .io_writeData(bsram0_io_writeData),
    .io_readData(bsram0_io_readData)
  );
  assign io_out_address = io_read ? io_address : 20'h0; // @[mem_interface.scala 38:20:@41.6 mem_interface.scala 40:20:@44.6]
  assign io_out_data = bsram0_io_readData; // @[mem_interface.scala 34:25:@38.4]
  assign bsram0_clock = clock; // @[:@29.4]
  assign bsram0_io_readAddress = io_address; // @[mem_interface.scala 28:25:@33.4]
  assign bsram0_io_readEnable = io_read; // @[mem_interface.scala 29:25:@34.4]
  assign bsram0_io_writeAddress = io_address; // @[mem_interface.scala 31:25:@36.4]
  assign bsram0_io_writeData = io_in_data; // @[mem_interface.scala 32:25:@37.4]
endmodule
module fetch( // @[:@58.2]
  input         clock, // @[:@59.4]
  input         reset, // @[:@60.4]
  input         io_start, // @[:@61.4]
  input  [1:0]  io_PC_select, // @[:@61.4]
  input  [19:0] io_JAL_target, // @[:@61.4]
  input  [19:0] io_JALR_target, // @[:@61.4]
  input         io_branch, // @[:@61.4]
  input  [19:0] io_branch_target, // @[:@61.4]
  output [31:0] io_instruction, // @[:@61.4]
  output [19:0] io_inst_PC // @[:@61.4]
);
  wire  mem_interface0_clock; // @[fetch.scala 41:29:@70.4]
  wire  mem_interface0_io_read; // @[fetch.scala 41:29:@70.4]
  wire [19:0] mem_interface0_io_address; // @[fetch.scala 41:29:@70.4]
  wire [31:0] mem_interface0_io_in_data; // @[fetch.scala 41:29:@70.4]
  wire [19:0] mem_interface0_io_out_address; // @[fetch.scala 41:29:@70.4]
  wire [31:0] mem_interface0_io_out_data; // @[fetch.scala 41:29:@70.4]
  reg  fetch; // @[fetch.scala 33:23:@64.4]
  reg [31:0] _RAND_0;
  reg [31:0] PC_reg; // @[fetch.scala 34:23:@65.4]
  reg [31:0] _RAND_1;
  wire [31:0] _GEN_0; // @[fetch.scala 59:21:@84.4]
  wire  _T_53; // @[fetch.scala 76:24:@106.8]
  wire  _T_55; // @[fetch.scala 78:31:@111.10]
  wire  _T_57; // @[fetch.scala 80:31:@116.12]
  wire  _T_59; // @[fetch.scala 80:53:@118.12]
  wire [19:0] PC; // @[fetch.scala 38:22:@69.4 fetch.scala 60:8:@85.6 fetch.scala 62:8:@88.6]
  wire [20:0] _T_63; // @[fetch.scala 88:17:@130.4]
  wire [19:0] PC_plus4; // @[fetch.scala 88:17:@131.4]
  wire [19:0] _GEN_1; // @[fetch.scala 80:73:@119.12]
  wire [19:0] _GEN_2; // @[fetch.scala 78:53:@112.10]
  wire [19:0] _GEN_3; // @[fetch.scala 76:46:@107.8]
  wire [19:0] _GEN_5; // @[fetch.scala 69:32:@98.6]
  wire  _GEN_7; // @[fetch.scala 65:23:@91.4]
  wire [19:0] _GEN_8; // @[fetch.scala 65:23:@91.4]
  wire [31:0] out_addr; // @[fetch.scala 35:22:@66.4 fetch.scala 51:18:@81.4]
  wire [33:0] _GEN_10; // @[fetch.scala 86:26:@126.4]
  wire [33:0] _T_60; // @[fetch.scala 86:26:@126.4]
  wire [17:0] _T_61; // @[fetch.scala 87:29:@128.4]
  wire [31:0] instruction_address; // @[fetch.scala 36:34:@67.4 fetch.scala 87:23:@129.4]
  mem_interface mem_interface0 ( // @[fetch.scala 41:29:@70.4]
    .clock(mem_interface0_clock),
    .io_read(mem_interface0_io_read),
    .io_address(mem_interface0_io_address),
    .io_in_data(mem_interface0_io_in_data),
    .io_out_address(mem_interface0_io_out_address),
    .io_out_data(mem_interface0_io_out_data)
  );
  assign _GEN_0 = reset ? 32'h0 : PC_reg; // @[fetch.scala 59:21:@84.4]
  assign _T_53 = io_PC_select == 2'h2; // @[fetch.scala 76:24:@106.8]
  assign _T_55 = io_PC_select == 2'h3; // @[fetch.scala 78:31:@111.10]
  assign _T_57 = io_PC_select == 2'h1; // @[fetch.scala 80:31:@116.12]
  assign _T_59 = _T_57 & io_branch; // @[fetch.scala 80:53:@118.12]
  assign PC = _GEN_0[19:0]; // @[fetch.scala 38:22:@69.4 fetch.scala 60:8:@85.6 fetch.scala 62:8:@88.6]
  assign _T_63 = PC + 20'h4; // @[fetch.scala 88:17:@130.4]
  assign PC_plus4 = _T_63[19:0]; // @[fetch.scala 88:17:@131.4]
  assign _GEN_1 = _T_59 ? io_branch_target : PC_plus4; // @[fetch.scala 80:73:@119.12]
  assign _GEN_2 = _T_55 ? io_JALR_target : _GEN_1; // @[fetch.scala 78:53:@112.10]
  assign _GEN_3 = _T_53 ? io_JAL_target : _GEN_2; // @[fetch.scala 76:46:@107.8]
  assign _GEN_5 = io_start ? 20'h0 : _GEN_3; // @[fetch.scala 69:32:@98.6]
  assign _GEN_7 = reset ? 1'h0 : io_start; // @[fetch.scala 65:23:@91.4]
  assign _GEN_8 = reset ? 20'h0 : _GEN_5; // @[fetch.scala 65:23:@91.4]
  assign out_addr = {{12'd0}, mem_interface0_io_out_address}; // @[fetch.scala 35:22:@66.4 fetch.scala 51:18:@81.4]
  assign _GEN_10 = {{2'd0}, out_addr}; // @[fetch.scala 86:26:@126.4]
  assign _T_60 = _GEN_10 << 2; // @[fetch.scala 86:26:@126.4]
  assign _T_61 = PC[19:2]; // @[fetch.scala 87:29:@128.4]
  assign instruction_address = {{14'd0}, _T_61}; // @[fetch.scala 36:34:@67.4 fetch.scala 87:23:@129.4]
  assign io_instruction = mem_interface0_io_out_data; // @[fetch.scala 52:18:@82.4]
  assign io_inst_PC = _T_60[19:0]; // @[fetch.scala 86:14:@127.4]
  assign mem_interface0_clock = clock; // @[:@71.4]
  assign mem_interface0_io_read = fetch; // @[fetch.scala 44:33:@75.4]
  assign mem_interface0_io_address = instruction_address[19:0]; // @[fetch.scala 46:33:@77.4]
  assign mem_interface0_io_in_data = 32'h0; // @[fetch.scala 47:33:@78.4]
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
  fetch = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  PC_reg = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      fetch <= 1'h0;
    end else begin
      if (reset) begin
        fetch <= 1'h0;
      end else begin
        fetch <= io_start;
      end
    end
    if (reset) begin
      PC_reg <= 32'h0;
    end else begin
      PC_reg <= {{12'd0}, _GEN_8};
    end
  end
endmodule
module register_file( // @[:@134.2]
  input         clock, // @[:@135.4]
  input         reset, // @[:@136.4]
  input         io_wEn, // @[:@137.4]
  input  [31:0] io_write_data, // @[:@137.4]
  input  [4:0]  io_read_sel1, // @[:@137.4]
  input  [4:0]  io_read_sel2, // @[:@137.4]
  input  [4:0]  io_write_sel, // @[:@137.4]
  output [31:0] io_read_data1, // @[:@137.4]
  output [31:0] io_read_data2 // @[:@137.4]
);
  reg [31:0] register_file_block_0; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_0;
  reg [31:0] register_file_block_1; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_1;
  reg [31:0] register_file_block_2; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_2;
  reg [31:0] register_file_block_3; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_3;
  reg [31:0] register_file_block_4; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_4;
  reg [31:0] register_file_block_5; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_5;
  reg [31:0] register_file_block_6; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_6;
  reg [31:0] register_file_block_7; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_7;
  reg [31:0] register_file_block_8; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_8;
  reg [31:0] register_file_block_9; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_9;
  reg [31:0] register_file_block_10; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_10;
  reg [31:0] register_file_block_11; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_11;
  reg [31:0] register_file_block_12; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_12;
  reg [31:0] register_file_block_13; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_13;
  reg [31:0] register_file_block_14; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_14;
  reg [31:0] register_file_block_15; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_15;
  reg [31:0] register_file_block_16; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_16;
  reg [31:0] register_file_block_17; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_17;
  reg [31:0] register_file_block_18; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_18;
  reg [31:0] register_file_block_19; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_19;
  reg [31:0] register_file_block_20; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_20;
  reg [31:0] register_file_block_21; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_21;
  reg [31:0] register_file_block_22; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_22;
  reg [31:0] register_file_block_23; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_23;
  reg [31:0] register_file_block_24; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_24;
  reg [31:0] register_file_block_25; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_25;
  reg [31:0] register_file_block_26; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_26;
  reg [31:0] register_file_block_27; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_27;
  reg [31:0] register_file_block_28; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_28;
  reg [31:0] register_file_block_29; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_29;
  reg [31:0] register_file_block_30; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_30;
  reg [31:0] register_file_block_31; // @[regFile.scala 23:32:@139.4]
  reg [31:0] _RAND_31;
  wire  _T_60; // @[regFile.scala 25:15:@140.4]
  wire  _T_67; // @[regFile.scala 29:43:@149.8]
  wire  _T_68; // @[regFile.scala 29:26:@150.8]
  wire [31:0] _GEN_0; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_1; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_2; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_3; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_4; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_5; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_6; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_7; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_8; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_9; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_10; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_11; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_12; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_13; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_14; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_15; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_16; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_17; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_18; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_19; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_20; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_21; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_22; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_23; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_24; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_25; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_26; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_27; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_28; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_29; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_30; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_31; // @[regFile.scala 30:43:@152.10]
  wire [31:0] _GEN_32; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_33; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_34; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_35; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_36; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_37; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_38; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_39; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_40; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_41; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_42; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_43; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_44; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_45; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_46; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_47; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_48; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_49; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_50; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_51; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_52; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_53; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_54; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_55; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_56; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_57; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_58; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_59; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_60; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_61; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_62; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_63; // @[regFile.scala 29:53:@151.8]
  wire [31:0] _GEN_64; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_65; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_66; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_67; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_68; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_69; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_70; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_71; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_72; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_73; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_74; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_75; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_76; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_77; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_78; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_79; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_80; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_81; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_82; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_83; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_84; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_85; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_86; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_87; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_88; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_89; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_90; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_91; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_92; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_93; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_94; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_95; // @[regFile.scala 26:23:@144.6]
  wire [31:0] _GEN_129; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_130; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_131; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_132; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_133; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_134; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_135; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_136; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_137; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_138; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_139; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_140; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_141; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_142; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_143; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_144; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_145; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_146; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_147; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_148; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_149; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_150; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_151; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_152; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_153; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_154; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_155; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_156; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_157; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_158; // @[regFile.scala 38:17:@159.4]
  wire [31:0] _GEN_161; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_162; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_163; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_164; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_165; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_166; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_167; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_168; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_169; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_170; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_171; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_172; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_173; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_174; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_175; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_176; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_177; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_178; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_179; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_180; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_181; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_182; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_183; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_184; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_185; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_186; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_187; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_188; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_189; // @[regFile.scala 39:17:@160.4]
  wire [31:0] _GEN_190; // @[regFile.scala 39:17:@160.4]
  assign _T_60 = $unsigned(clock); // @[regFile.scala 25:15:@140.4]
  assign _T_67 = io_write_sel != 5'h0; // @[regFile.scala 29:43:@149.8]
  assign _T_68 = io_wEn & _T_67; // @[regFile.scala 29:26:@150.8]
  assign _GEN_0 = 5'h0 == io_write_sel ? io_write_data : register_file_block_0; // @[regFile.scala 30:43:@152.10]
  assign _GEN_1 = 5'h1 == io_write_sel ? io_write_data : register_file_block_1; // @[regFile.scala 30:43:@152.10]
  assign _GEN_2 = 5'h2 == io_write_sel ? io_write_data : register_file_block_2; // @[regFile.scala 30:43:@152.10]
  assign _GEN_3 = 5'h3 == io_write_sel ? io_write_data : register_file_block_3; // @[regFile.scala 30:43:@152.10]
  assign _GEN_4 = 5'h4 == io_write_sel ? io_write_data : register_file_block_4; // @[regFile.scala 30:43:@152.10]
  assign _GEN_5 = 5'h5 == io_write_sel ? io_write_data : register_file_block_5; // @[regFile.scala 30:43:@152.10]
  assign _GEN_6 = 5'h6 == io_write_sel ? io_write_data : register_file_block_6; // @[regFile.scala 30:43:@152.10]
  assign _GEN_7 = 5'h7 == io_write_sel ? io_write_data : register_file_block_7; // @[regFile.scala 30:43:@152.10]
  assign _GEN_8 = 5'h8 == io_write_sel ? io_write_data : register_file_block_8; // @[regFile.scala 30:43:@152.10]
  assign _GEN_9 = 5'h9 == io_write_sel ? io_write_data : register_file_block_9; // @[regFile.scala 30:43:@152.10]
  assign _GEN_10 = 5'ha == io_write_sel ? io_write_data : register_file_block_10; // @[regFile.scala 30:43:@152.10]
  assign _GEN_11 = 5'hb == io_write_sel ? io_write_data : register_file_block_11; // @[regFile.scala 30:43:@152.10]
  assign _GEN_12 = 5'hc == io_write_sel ? io_write_data : register_file_block_12; // @[regFile.scala 30:43:@152.10]
  assign _GEN_13 = 5'hd == io_write_sel ? io_write_data : register_file_block_13; // @[regFile.scala 30:43:@152.10]
  assign _GEN_14 = 5'he == io_write_sel ? io_write_data : register_file_block_14; // @[regFile.scala 30:43:@152.10]
  assign _GEN_15 = 5'hf == io_write_sel ? io_write_data : register_file_block_15; // @[regFile.scala 30:43:@152.10]
  assign _GEN_16 = 5'h10 == io_write_sel ? io_write_data : register_file_block_16; // @[regFile.scala 30:43:@152.10]
  assign _GEN_17 = 5'h11 == io_write_sel ? io_write_data : register_file_block_17; // @[regFile.scala 30:43:@152.10]
  assign _GEN_18 = 5'h12 == io_write_sel ? io_write_data : register_file_block_18; // @[regFile.scala 30:43:@152.10]
  assign _GEN_19 = 5'h13 == io_write_sel ? io_write_data : register_file_block_19; // @[regFile.scala 30:43:@152.10]
  assign _GEN_20 = 5'h14 == io_write_sel ? io_write_data : register_file_block_20; // @[regFile.scala 30:43:@152.10]
  assign _GEN_21 = 5'h15 == io_write_sel ? io_write_data : register_file_block_21; // @[regFile.scala 30:43:@152.10]
  assign _GEN_22 = 5'h16 == io_write_sel ? io_write_data : register_file_block_22; // @[regFile.scala 30:43:@152.10]
  assign _GEN_23 = 5'h17 == io_write_sel ? io_write_data : register_file_block_23; // @[regFile.scala 30:43:@152.10]
  assign _GEN_24 = 5'h18 == io_write_sel ? io_write_data : register_file_block_24; // @[regFile.scala 30:43:@152.10]
  assign _GEN_25 = 5'h19 == io_write_sel ? io_write_data : register_file_block_25; // @[regFile.scala 30:43:@152.10]
  assign _GEN_26 = 5'h1a == io_write_sel ? io_write_data : register_file_block_26; // @[regFile.scala 30:43:@152.10]
  assign _GEN_27 = 5'h1b == io_write_sel ? io_write_data : register_file_block_27; // @[regFile.scala 30:43:@152.10]
  assign _GEN_28 = 5'h1c == io_write_sel ? io_write_data : register_file_block_28; // @[regFile.scala 30:43:@152.10]
  assign _GEN_29 = 5'h1d == io_write_sel ? io_write_data : register_file_block_29; // @[regFile.scala 30:43:@152.10]
  assign _GEN_30 = 5'h1e == io_write_sel ? io_write_data : register_file_block_30; // @[regFile.scala 30:43:@152.10]
  assign _GEN_31 = 5'h1f == io_write_sel ? io_write_data : register_file_block_31; // @[regFile.scala 30:43:@152.10]
  assign _GEN_32 = _T_68 ? _GEN_0 : 32'h0; // @[regFile.scala 29:53:@151.8]
  assign _GEN_33 = _T_68 ? _GEN_1 : register_file_block_1; // @[regFile.scala 29:53:@151.8]
  assign _GEN_34 = _T_68 ? _GEN_2 : register_file_block_2; // @[regFile.scala 29:53:@151.8]
  assign _GEN_35 = _T_68 ? _GEN_3 : register_file_block_3; // @[regFile.scala 29:53:@151.8]
  assign _GEN_36 = _T_68 ? _GEN_4 : register_file_block_4; // @[regFile.scala 29:53:@151.8]
  assign _GEN_37 = _T_68 ? _GEN_5 : register_file_block_5; // @[regFile.scala 29:53:@151.8]
  assign _GEN_38 = _T_68 ? _GEN_6 : register_file_block_6; // @[regFile.scala 29:53:@151.8]
  assign _GEN_39 = _T_68 ? _GEN_7 : register_file_block_7; // @[regFile.scala 29:53:@151.8]
  assign _GEN_40 = _T_68 ? _GEN_8 : register_file_block_8; // @[regFile.scala 29:53:@151.8]
  assign _GEN_41 = _T_68 ? _GEN_9 : register_file_block_9; // @[regFile.scala 29:53:@151.8]
  assign _GEN_42 = _T_68 ? _GEN_10 : register_file_block_10; // @[regFile.scala 29:53:@151.8]
  assign _GEN_43 = _T_68 ? _GEN_11 : register_file_block_11; // @[regFile.scala 29:53:@151.8]
  assign _GEN_44 = _T_68 ? _GEN_12 : register_file_block_12; // @[regFile.scala 29:53:@151.8]
  assign _GEN_45 = _T_68 ? _GEN_13 : register_file_block_13; // @[regFile.scala 29:53:@151.8]
  assign _GEN_46 = _T_68 ? _GEN_14 : register_file_block_14; // @[regFile.scala 29:53:@151.8]
  assign _GEN_47 = _T_68 ? _GEN_15 : register_file_block_15; // @[regFile.scala 29:53:@151.8]
  assign _GEN_48 = _T_68 ? _GEN_16 : register_file_block_16; // @[regFile.scala 29:53:@151.8]
  assign _GEN_49 = _T_68 ? _GEN_17 : register_file_block_17; // @[regFile.scala 29:53:@151.8]
  assign _GEN_50 = _T_68 ? _GEN_18 : register_file_block_18; // @[regFile.scala 29:53:@151.8]
  assign _GEN_51 = _T_68 ? _GEN_19 : register_file_block_19; // @[regFile.scala 29:53:@151.8]
  assign _GEN_52 = _T_68 ? _GEN_20 : register_file_block_20; // @[regFile.scala 29:53:@151.8]
  assign _GEN_53 = _T_68 ? _GEN_21 : register_file_block_21; // @[regFile.scala 29:53:@151.8]
  assign _GEN_54 = _T_68 ? _GEN_22 : register_file_block_22; // @[regFile.scala 29:53:@151.8]
  assign _GEN_55 = _T_68 ? _GEN_23 : register_file_block_23; // @[regFile.scala 29:53:@151.8]
  assign _GEN_56 = _T_68 ? _GEN_24 : register_file_block_24; // @[regFile.scala 29:53:@151.8]
  assign _GEN_57 = _T_68 ? _GEN_25 : register_file_block_25; // @[regFile.scala 29:53:@151.8]
  assign _GEN_58 = _T_68 ? _GEN_26 : register_file_block_26; // @[regFile.scala 29:53:@151.8]
  assign _GEN_59 = _T_68 ? _GEN_27 : register_file_block_27; // @[regFile.scala 29:53:@151.8]
  assign _GEN_60 = _T_68 ? _GEN_28 : register_file_block_28; // @[regFile.scala 29:53:@151.8]
  assign _GEN_61 = _T_68 ? _GEN_29 : register_file_block_29; // @[regFile.scala 29:53:@151.8]
  assign _GEN_62 = _T_68 ? _GEN_30 : register_file_block_30; // @[regFile.scala 29:53:@151.8]
  assign _GEN_63 = _T_68 ? _GEN_31 : register_file_block_31; // @[regFile.scala 29:53:@151.8]
  assign _GEN_64 = reset ? 32'h0 : _GEN_32; // @[regFile.scala 26:23:@144.6]
  assign _GEN_65 = reset ? register_file_block_1 : _GEN_33; // @[regFile.scala 26:23:@144.6]
  assign _GEN_66 = reset ? register_file_block_2 : _GEN_34; // @[regFile.scala 26:23:@144.6]
  assign _GEN_67 = reset ? register_file_block_3 : _GEN_35; // @[regFile.scala 26:23:@144.6]
  assign _GEN_68 = reset ? register_file_block_4 : _GEN_36; // @[regFile.scala 26:23:@144.6]
  assign _GEN_69 = reset ? register_file_block_5 : _GEN_37; // @[regFile.scala 26:23:@144.6]
  assign _GEN_70 = reset ? register_file_block_6 : _GEN_38; // @[regFile.scala 26:23:@144.6]
  assign _GEN_71 = reset ? register_file_block_7 : _GEN_39; // @[regFile.scala 26:23:@144.6]
  assign _GEN_72 = reset ? register_file_block_8 : _GEN_40; // @[regFile.scala 26:23:@144.6]
  assign _GEN_73 = reset ? register_file_block_9 : _GEN_41; // @[regFile.scala 26:23:@144.6]
  assign _GEN_74 = reset ? register_file_block_10 : _GEN_42; // @[regFile.scala 26:23:@144.6]
  assign _GEN_75 = reset ? register_file_block_11 : _GEN_43; // @[regFile.scala 26:23:@144.6]
  assign _GEN_76 = reset ? register_file_block_12 : _GEN_44; // @[regFile.scala 26:23:@144.6]
  assign _GEN_77 = reset ? register_file_block_13 : _GEN_45; // @[regFile.scala 26:23:@144.6]
  assign _GEN_78 = reset ? register_file_block_14 : _GEN_46; // @[regFile.scala 26:23:@144.6]
  assign _GEN_79 = reset ? register_file_block_15 : _GEN_47; // @[regFile.scala 26:23:@144.6]
  assign _GEN_80 = reset ? register_file_block_16 : _GEN_48; // @[regFile.scala 26:23:@144.6]
  assign _GEN_81 = reset ? register_file_block_17 : _GEN_49; // @[regFile.scala 26:23:@144.6]
  assign _GEN_82 = reset ? register_file_block_18 : _GEN_50; // @[regFile.scala 26:23:@144.6]
  assign _GEN_83 = reset ? register_file_block_19 : _GEN_51; // @[regFile.scala 26:23:@144.6]
  assign _GEN_84 = reset ? register_file_block_20 : _GEN_52; // @[regFile.scala 26:23:@144.6]
  assign _GEN_85 = reset ? register_file_block_21 : _GEN_53; // @[regFile.scala 26:23:@144.6]
  assign _GEN_86 = reset ? register_file_block_22 : _GEN_54; // @[regFile.scala 26:23:@144.6]
  assign _GEN_87 = reset ? register_file_block_23 : _GEN_55; // @[regFile.scala 26:23:@144.6]
  assign _GEN_88 = reset ? register_file_block_24 : _GEN_56; // @[regFile.scala 26:23:@144.6]
  assign _GEN_89 = reset ? register_file_block_25 : _GEN_57; // @[regFile.scala 26:23:@144.6]
  assign _GEN_90 = reset ? register_file_block_26 : _GEN_58; // @[regFile.scala 26:23:@144.6]
  assign _GEN_91 = reset ? register_file_block_27 : _GEN_59; // @[regFile.scala 26:23:@144.6]
  assign _GEN_92 = reset ? register_file_block_28 : _GEN_60; // @[regFile.scala 26:23:@144.6]
  assign _GEN_93 = reset ? register_file_block_29 : _GEN_61; // @[regFile.scala 26:23:@144.6]
  assign _GEN_94 = reset ? register_file_block_30 : _GEN_62; // @[regFile.scala 26:23:@144.6]
  assign _GEN_95 = reset ? register_file_block_31 : _GEN_63; // @[regFile.scala 26:23:@144.6]
  assign _GEN_129 = 5'h1 == io_read_sel1 ? register_file_block_1 : register_file_block_0; // @[regFile.scala 38:17:@159.4]
  assign _GEN_130 = 5'h2 == io_read_sel1 ? register_file_block_2 : _GEN_129; // @[regFile.scala 38:17:@159.4]
  assign _GEN_131 = 5'h3 == io_read_sel1 ? register_file_block_3 : _GEN_130; // @[regFile.scala 38:17:@159.4]
  assign _GEN_132 = 5'h4 == io_read_sel1 ? register_file_block_4 : _GEN_131; // @[regFile.scala 38:17:@159.4]
  assign _GEN_133 = 5'h5 == io_read_sel1 ? register_file_block_5 : _GEN_132; // @[regFile.scala 38:17:@159.4]
  assign _GEN_134 = 5'h6 == io_read_sel1 ? register_file_block_6 : _GEN_133; // @[regFile.scala 38:17:@159.4]
  assign _GEN_135 = 5'h7 == io_read_sel1 ? register_file_block_7 : _GEN_134; // @[regFile.scala 38:17:@159.4]
  assign _GEN_136 = 5'h8 == io_read_sel1 ? register_file_block_8 : _GEN_135; // @[regFile.scala 38:17:@159.4]
  assign _GEN_137 = 5'h9 == io_read_sel1 ? register_file_block_9 : _GEN_136; // @[regFile.scala 38:17:@159.4]
  assign _GEN_138 = 5'ha == io_read_sel1 ? register_file_block_10 : _GEN_137; // @[regFile.scala 38:17:@159.4]
  assign _GEN_139 = 5'hb == io_read_sel1 ? register_file_block_11 : _GEN_138; // @[regFile.scala 38:17:@159.4]
  assign _GEN_140 = 5'hc == io_read_sel1 ? register_file_block_12 : _GEN_139; // @[regFile.scala 38:17:@159.4]
  assign _GEN_141 = 5'hd == io_read_sel1 ? register_file_block_13 : _GEN_140; // @[regFile.scala 38:17:@159.4]
  assign _GEN_142 = 5'he == io_read_sel1 ? register_file_block_14 : _GEN_141; // @[regFile.scala 38:17:@159.4]
  assign _GEN_143 = 5'hf == io_read_sel1 ? register_file_block_15 : _GEN_142; // @[regFile.scala 38:17:@159.4]
  assign _GEN_144 = 5'h10 == io_read_sel1 ? register_file_block_16 : _GEN_143; // @[regFile.scala 38:17:@159.4]
  assign _GEN_145 = 5'h11 == io_read_sel1 ? register_file_block_17 : _GEN_144; // @[regFile.scala 38:17:@159.4]
  assign _GEN_146 = 5'h12 == io_read_sel1 ? register_file_block_18 : _GEN_145; // @[regFile.scala 38:17:@159.4]
  assign _GEN_147 = 5'h13 == io_read_sel1 ? register_file_block_19 : _GEN_146; // @[regFile.scala 38:17:@159.4]
  assign _GEN_148 = 5'h14 == io_read_sel1 ? register_file_block_20 : _GEN_147; // @[regFile.scala 38:17:@159.4]
  assign _GEN_149 = 5'h15 == io_read_sel1 ? register_file_block_21 : _GEN_148; // @[regFile.scala 38:17:@159.4]
  assign _GEN_150 = 5'h16 == io_read_sel1 ? register_file_block_22 : _GEN_149; // @[regFile.scala 38:17:@159.4]
  assign _GEN_151 = 5'h17 == io_read_sel1 ? register_file_block_23 : _GEN_150; // @[regFile.scala 38:17:@159.4]
  assign _GEN_152 = 5'h18 == io_read_sel1 ? register_file_block_24 : _GEN_151; // @[regFile.scala 38:17:@159.4]
  assign _GEN_153 = 5'h19 == io_read_sel1 ? register_file_block_25 : _GEN_152; // @[regFile.scala 38:17:@159.4]
  assign _GEN_154 = 5'h1a == io_read_sel1 ? register_file_block_26 : _GEN_153; // @[regFile.scala 38:17:@159.4]
  assign _GEN_155 = 5'h1b == io_read_sel1 ? register_file_block_27 : _GEN_154; // @[regFile.scala 38:17:@159.4]
  assign _GEN_156 = 5'h1c == io_read_sel1 ? register_file_block_28 : _GEN_155; // @[regFile.scala 38:17:@159.4]
  assign _GEN_157 = 5'h1d == io_read_sel1 ? register_file_block_29 : _GEN_156; // @[regFile.scala 38:17:@159.4]
  assign _GEN_158 = 5'h1e == io_read_sel1 ? register_file_block_30 : _GEN_157; // @[regFile.scala 38:17:@159.4]
  assign _GEN_161 = 5'h1 == io_read_sel2 ? register_file_block_1 : register_file_block_0; // @[regFile.scala 39:17:@160.4]
  assign _GEN_162 = 5'h2 == io_read_sel2 ? register_file_block_2 : _GEN_161; // @[regFile.scala 39:17:@160.4]
  assign _GEN_163 = 5'h3 == io_read_sel2 ? register_file_block_3 : _GEN_162; // @[regFile.scala 39:17:@160.4]
  assign _GEN_164 = 5'h4 == io_read_sel2 ? register_file_block_4 : _GEN_163; // @[regFile.scala 39:17:@160.4]
  assign _GEN_165 = 5'h5 == io_read_sel2 ? register_file_block_5 : _GEN_164; // @[regFile.scala 39:17:@160.4]
  assign _GEN_166 = 5'h6 == io_read_sel2 ? register_file_block_6 : _GEN_165; // @[regFile.scala 39:17:@160.4]
  assign _GEN_167 = 5'h7 == io_read_sel2 ? register_file_block_7 : _GEN_166; // @[regFile.scala 39:17:@160.4]
  assign _GEN_168 = 5'h8 == io_read_sel2 ? register_file_block_8 : _GEN_167; // @[regFile.scala 39:17:@160.4]
  assign _GEN_169 = 5'h9 == io_read_sel2 ? register_file_block_9 : _GEN_168; // @[regFile.scala 39:17:@160.4]
  assign _GEN_170 = 5'ha == io_read_sel2 ? register_file_block_10 : _GEN_169; // @[regFile.scala 39:17:@160.4]
  assign _GEN_171 = 5'hb == io_read_sel2 ? register_file_block_11 : _GEN_170; // @[regFile.scala 39:17:@160.4]
  assign _GEN_172 = 5'hc == io_read_sel2 ? register_file_block_12 : _GEN_171; // @[regFile.scala 39:17:@160.4]
  assign _GEN_173 = 5'hd == io_read_sel2 ? register_file_block_13 : _GEN_172; // @[regFile.scala 39:17:@160.4]
  assign _GEN_174 = 5'he == io_read_sel2 ? register_file_block_14 : _GEN_173; // @[regFile.scala 39:17:@160.4]
  assign _GEN_175 = 5'hf == io_read_sel2 ? register_file_block_15 : _GEN_174; // @[regFile.scala 39:17:@160.4]
  assign _GEN_176 = 5'h10 == io_read_sel2 ? register_file_block_16 : _GEN_175; // @[regFile.scala 39:17:@160.4]
  assign _GEN_177 = 5'h11 == io_read_sel2 ? register_file_block_17 : _GEN_176; // @[regFile.scala 39:17:@160.4]
  assign _GEN_178 = 5'h12 == io_read_sel2 ? register_file_block_18 : _GEN_177; // @[regFile.scala 39:17:@160.4]
  assign _GEN_179 = 5'h13 == io_read_sel2 ? register_file_block_19 : _GEN_178; // @[regFile.scala 39:17:@160.4]
  assign _GEN_180 = 5'h14 == io_read_sel2 ? register_file_block_20 : _GEN_179; // @[regFile.scala 39:17:@160.4]
  assign _GEN_181 = 5'h15 == io_read_sel2 ? register_file_block_21 : _GEN_180; // @[regFile.scala 39:17:@160.4]
  assign _GEN_182 = 5'h16 == io_read_sel2 ? register_file_block_22 : _GEN_181; // @[regFile.scala 39:17:@160.4]
  assign _GEN_183 = 5'h17 == io_read_sel2 ? register_file_block_23 : _GEN_182; // @[regFile.scala 39:17:@160.4]
  assign _GEN_184 = 5'h18 == io_read_sel2 ? register_file_block_24 : _GEN_183; // @[regFile.scala 39:17:@160.4]
  assign _GEN_185 = 5'h19 == io_read_sel2 ? register_file_block_25 : _GEN_184; // @[regFile.scala 39:17:@160.4]
  assign _GEN_186 = 5'h1a == io_read_sel2 ? register_file_block_26 : _GEN_185; // @[regFile.scala 39:17:@160.4]
  assign _GEN_187 = 5'h1b == io_read_sel2 ? register_file_block_27 : _GEN_186; // @[regFile.scala 39:17:@160.4]
  assign _GEN_188 = 5'h1c == io_read_sel2 ? register_file_block_28 : _GEN_187; // @[regFile.scala 39:17:@160.4]
  assign _GEN_189 = 5'h1d == io_read_sel2 ? register_file_block_29 : _GEN_188; // @[regFile.scala 39:17:@160.4]
  assign _GEN_190 = 5'h1e == io_read_sel2 ? register_file_block_30 : _GEN_189; // @[regFile.scala 39:17:@160.4]
  assign io_read_data1 = 5'h1f == io_read_sel1 ? register_file_block_31 : _GEN_158; // @[regFile.scala 38:17:@159.4]
  assign io_read_data2 = 5'h1f == io_read_sel2 ? register_file_block_31 : _GEN_190; // @[regFile.scala 39:17:@160.4]
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
module decode( // @[:@162.2]
  input         clock, // @[:@163.4]
  input         reset, // @[:@164.4]
  input  [19:0] io_PC, // @[:@165.4]
  input  [31:0] io_instruction, // @[:@165.4]
  input  [1:0]  io_extend_sel, // @[:@165.4]
  input         io_write, // @[:@165.4]
  input  [31:0] io_write_data, // @[:@165.4]
  output [31:0] io_rs1_data, // @[:@165.4]
  output [31:0] io_rs2_data, // @[:@165.4]
  output [6:0]  io_opcode, // @[:@165.4]
  output [6:0]  io_funct7, // @[:@165.4]
  output [2:0]  io_funct3, // @[:@165.4]
  output [31:0] io_extend_imm, // @[:@165.4]
  output [19:0] io_branch_target, // @[:@165.4]
  output [19:0] io_JAL_target // @[:@165.4]
);
  wire  registerfile0_clock; // @[decode.scala 70:29:@230.4]
  wire  registerfile0_reset; // @[decode.scala 70:29:@230.4]
  wire  registerfile0_io_wEn; // @[decode.scala 70:29:@230.4]
  wire [31:0] registerfile0_io_write_data; // @[decode.scala 70:29:@230.4]
  wire [4:0] registerfile0_io_read_sel1; // @[decode.scala 70:29:@230.4]
  wire [4:0] registerfile0_io_read_sel2; // @[decode.scala 70:29:@230.4]
  wire [4:0] registerfile0_io_write_sel; // @[decode.scala 70:29:@230.4]
  wire [31:0] registerfile0_io_read_data1; // @[decode.scala 70:29:@230.4]
  wire [31:0] registerfile0_io_read_data2; // @[decode.scala 70:29:@230.4]
  wire [11:0] i_imm; // @[decode.scala 39:34:@169.4]
  wire [6:0] s_imm_msb; // @[decode.scala 40:34:@170.4]
  wire [4:0] s_imm_lsb; // @[decode.scala 41:34:@171.4]
  wire [19:0] u_imm; // @[decode.scala 42:34:@172.4]
  wire  _T_39; // @[decode.scala 44:38:@174.4]
  wire [7:0] _T_40; // @[decode.scala 44:58:@175.4]
  wire  _T_41; // @[decode.scala 44:81:@176.4]
  wire [10:0] _T_42; // @[decode.scala 44:101:@177.4]
  wire [11:0] _T_43; // @[Cat.scala 30:58:@178.4]
  wire [8:0] _T_44; // @[Cat.scala 30:58:@179.4]
  wire [20:0] uj_imm_32; // @[Cat.scala 30:58:@180.4]
  wire [11:0] s_imm_orig; // @[Cat.scala 30:58:@181.4]
  wire  _T_45; // @[decode.scala 47:34:@182.4]
  wire  _T_46; // @[decode.scala 47:47:@183.4]
  wire [5:0] _T_47; // @[decode.scala 47:60:@184.4]
  wire [3:0] _T_48; // @[decode.scala 47:75:@185.4]
  wire [4:0] _T_50; // @[Cat.scala 30:58:@186.4]
  wire [1:0] _T_51; // @[Cat.scala 30:58:@187.4]
  wire [7:0] _T_52; // @[Cat.scala 30:58:@188.4]
  wire [12:0] sb_imm_orig; // @[Cat.scala 30:58:@189.4]
  wire  _T_53; // @[decode.scala 48:45:@190.4]
  wire [18:0] _T_57; // @[Bitwise.scala 72:12:@192.4]
  wire [31:0] sb_imm_32; // @[Cat.scala 30:58:@193.4]
  wire [31:0] u_imm_32; // @[Cat.scala 30:58:@194.4]
  wire  _T_59; // @[decode.scala 50:44:@195.4]
  wire [19:0] _T_63; // @[Bitwise.scala 72:12:@197.4]
  wire [31:0] i_imm_32; // @[Cat.scala 30:58:@199.4]
  wire  _T_65; // @[decode.scala 51:44:@200.4]
  wire [19:0] _T_69; // @[Bitwise.scala 72:12:@202.4]
  wire [31:0] s_imm_32; // @[Cat.scala 30:58:@203.4]
  wire  _T_71; // @[decode.scala 55:22:@204.4]
  wire  _T_73; // @[decode.scala 57:30:@209.6]
  wire [31:0] _GEN_0; // @[decode.scala 57:52:@210.6]
  wire [20:0] _GEN_2; // @[decode.scala 66:33:@224.4]
  wire [21:0] _T_78; // @[decode.scala 66:33:@224.4]
  wire [20:0] _T_79; // @[decode.scala 66:33:@225.4]
  wire [31:0] _GEN_3; // @[decode.scala 67:29:@227.4]
  wire [32:0] _T_80; // @[decode.scala 67:29:@227.4]
  wire [31:0] _T_81; // @[decode.scala 67:29:@228.4]
  register_file registerfile0 ( // @[decode.scala 70:29:@230.4]
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
  assign i_imm = io_instruction[31:20]; // @[decode.scala 39:34:@169.4]
  assign s_imm_msb = io_instruction[31:25]; // @[decode.scala 40:34:@170.4]
  assign s_imm_lsb = io_instruction[11:7]; // @[decode.scala 41:34:@171.4]
  assign u_imm = io_instruction[31:12]; // @[decode.scala 42:34:@172.4]
  assign _T_39 = io_instruction[31]; // @[decode.scala 44:38:@174.4]
  assign _T_40 = io_instruction[19:12]; // @[decode.scala 44:58:@175.4]
  assign _T_41 = io_instruction[20]; // @[decode.scala 44:81:@176.4]
  assign _T_42 = io_instruction[31:21]; // @[decode.scala 44:101:@177.4]
  assign _T_43 = {_T_41,_T_42}; // @[Cat.scala 30:58:@178.4]
  assign _T_44 = {_T_39,_T_40}; // @[Cat.scala 30:58:@179.4]
  assign uj_imm_32 = {_T_44,_T_43}; // @[Cat.scala 30:58:@180.4]
  assign s_imm_orig = {s_imm_msb,s_imm_lsb}; // @[Cat.scala 30:58:@181.4]
  assign _T_45 = s_imm_msb[6]; // @[decode.scala 47:34:@182.4]
  assign _T_46 = s_imm_lsb[0]; // @[decode.scala 47:47:@183.4]
  assign _T_47 = s_imm_msb[5:0]; // @[decode.scala 47:60:@184.4]
  assign _T_48 = s_imm_lsb[4:1]; // @[decode.scala 47:75:@185.4]
  assign _T_50 = {_T_48,1'h0}; // @[Cat.scala 30:58:@186.4]
  assign _T_51 = {_T_45,_T_46}; // @[Cat.scala 30:58:@187.4]
  assign _T_52 = {_T_51,_T_47}; // @[Cat.scala 30:58:@188.4]
  assign sb_imm_orig = {_T_52,_T_50}; // @[Cat.scala 30:58:@189.4]
  assign _T_53 = sb_imm_orig[12]; // @[decode.scala 48:45:@190.4]
  assign _T_57 = _T_53 ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12:@192.4]
  assign sb_imm_32 = {_T_57,sb_imm_orig}; // @[Cat.scala 30:58:@193.4]
  assign u_imm_32 = {u_imm,12'h0}; // @[Cat.scala 30:58:@194.4]
  assign _T_59 = i_imm[11]; // @[decode.scala 50:44:@195.4]
  assign _T_63 = _T_59 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12:@197.4]
  assign i_imm_32 = {_T_63,i_imm}; // @[Cat.scala 30:58:@199.4]
  assign _T_65 = s_imm_orig[11]; // @[decode.scala 51:44:@200.4]
  assign _T_69 = _T_65 ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12:@202.4]
  assign s_imm_32 = {_T_69,s_imm_orig}; // @[Cat.scala 30:58:@203.4]
  assign _T_71 = io_extend_sel == 2'h1; // @[decode.scala 55:22:@204.4]
  assign _T_73 = io_extend_sel == 2'h2; // @[decode.scala 57:30:@209.6]
  assign _GEN_0 = _T_73 ? u_imm_32 : i_imm_32; // @[decode.scala 57:52:@210.6]
  assign _GEN_2 = {{1'd0}, io_PC}; // @[decode.scala 66:33:@224.4]
  assign _T_78 = uj_imm_32 + _GEN_2; // @[decode.scala 66:33:@224.4]
  assign _T_79 = _T_78[20:0]; // @[decode.scala 66:33:@225.4]
  assign _GEN_3 = {{12'd0}, io_PC}; // @[decode.scala 67:29:@227.4]
  assign _T_80 = _GEN_3 + sb_imm_32; // @[decode.scala 67:29:@227.4]
  assign _T_81 = _T_80[31:0]; // @[decode.scala 67:29:@228.4]
  assign io_rs1_data = registerfile0_io_read_data1; // @[decode.scala 79:17:@240.4]
  assign io_rs2_data = registerfile0_io_read_data2; // @[decode.scala 80:17:@241.4]
  assign io_opcode = io_instruction[6:0]; // @[decode.scala 62:13:@217.4]
  assign io_funct7 = io_instruction[31:25]; // @[decode.scala 63:13:@219.4]
  assign io_funct3 = io_instruction[14:12]; // @[decode.scala 64:13:@221.4]
  assign io_extend_imm = _T_71 ? s_imm_32 : _GEN_0; // @[decode.scala 56:19:@206.6 decode.scala 58:20:@211.8 decode.scala 60:20:@214.8]
  assign io_branch_target = _T_81[19:0]; // @[decode.scala 67:20:@229.4]
  assign io_JAL_target = _T_79[19:0]; // @[decode.scala 66:20:@226.4]
  assign registerfile0_clock = clock; // @[:@231.4]
  assign registerfile0_reset = reset; // @[:@232.4]
  assign registerfile0_io_wEn = io_write; // @[decode.scala 73:33:@235.4]
  assign registerfile0_io_write_data = io_write_data; // @[decode.scala 74:33:@236.4]
  assign registerfile0_io_read_sel1 = io_instruction[19:15]; // @[decode.scala 75:33:@237.4]
  assign registerfile0_io_read_sel2 = io_instruction[24:20]; // @[decode.scala 76:33:@238.4]
  assign registerfile0_io_write_sel = io_write_data[4:0]; // @[decode.scala 77:33:@239.4]
endmodule
module control_unit( // @[:@243.2]
  input  [6:0] io_opcode, // @[:@246.4]
  output       io_branch_op, // @[:@246.4]
  output       io_memRead, // @[:@246.4]
  output [2:0] io_ALUOp, // @[:@246.4]
  output [1:0] io_next_PC_sel, // @[:@246.4]
  output [1:0] io_operand_A_sel, // @[:@246.4]
  output       io_operand_B_sel, // @[:@246.4]
  output [1:0] io_extend_sel, // @[:@246.4]
  output       io_regWrite // @[:@246.4]
);
  wire  _T_31; // @[control_unit.scala 43:20:@248.4]
  wire  _T_32; // @[control_unit.scala 43:46:@249.4]
  wire  _T_33; // @[control_unit.scala 43:32:@250.4]
  wire  _T_34; // @[control_unit.scala 43:72:@251.4]
  wire  _T_35; // @[control_unit.scala 43:58:@252.4]
  wire  _T_36; // @[control_unit.scala 44:23:@253.4]
  wire  _T_37; // @[control_unit.scala 44:9:@254.4]
  wire  _T_38; // @[control_unit.scala 44:47:@255.4]
  wire  _T_39; // @[control_unit.scala 44:33:@256.4]
  wire  _T_40; // @[control_unit.scala 44:70:@257.4]
  wire  _T_41; // @[control_unit.scala 44:56:@258.4]
  wire  _T_42; // @[control_unit.scala 45:23:@259.4]
  wire  _T_46; // @[control_unit.scala 51:19:@267.4]
  wire  _T_49; // @[control_unit.scala 57:19:@274.4]
  wire  _T_70; // @[control_unit.scala 85:38:@322.14]
  wire  _T_74; // @[control_unit.scala 87:38:@329.16]
  wire [2:0] _GEN_5; // @[control_unit.scala 87:61:@330.16]
  wire [2:0] _GEN_6; // @[control_unit.scala 85:61:@323.14]
  wire [2:0] _GEN_7; // @[control_unit.scala 83:37:@316.12]
  wire [2:0] _GEN_8; // @[control_unit.scala 81:35:@311.10]
  wire [2:0] _GEN_9; // @[control_unit.scala 79:36:@306.8]
  wire [2:0] _GEN_10; // @[control_unit.scala 77:37:@301.6]
  wire [1:0] _GEN_12; // @[control_unit.scala 97:61:@349.8]
  wire [1:0] _GEN_13; // @[control_unit.scala 95:34:@342.6]
  wire  _T_88; // @[control_unit.scala 103:33:@357.4]
  wire  _T_90; // @[control_unit.scala 103:57:@359.4]
  wire  _T_92; // @[control_unit.scala 104:31:@361.4]
  wire  _T_99; // @[control_unit.scala 111:33:@372.4]
  wire [1:0] _GEN_17; // @[control_unit.scala 113:38:@378.6]
  wire [1:0] _GEN_19; // @[control_unit.scala 125:36:@402.8]
  wire [1:0] _GEN_20; // @[control_unit.scala 123:36:@397.6]
  assign _T_31 = io_opcode == 7'h33; // @[control_unit.scala 43:20:@248.4]
  assign _T_32 = io_opcode == 7'h13; // @[control_unit.scala 43:46:@249.4]
  assign _T_33 = _T_31 | _T_32; // @[control_unit.scala 43:32:@250.4]
  assign _T_34 = io_opcode == 7'h3; // @[control_unit.scala 43:72:@251.4]
  assign _T_35 = _T_33 | _T_34; // @[control_unit.scala 43:58:@252.4]
  assign _T_36 = io_opcode == 7'h67; // @[control_unit.scala 44:23:@253.4]
  assign _T_37 = _T_35 | _T_36; // @[control_unit.scala 44:9:@254.4]
  assign _T_38 = io_opcode == 7'h6f; // @[control_unit.scala 44:47:@255.4]
  assign _T_39 = _T_37 | _T_38; // @[control_unit.scala 44:33:@256.4]
  assign _T_40 = io_opcode == 7'h17; // @[control_unit.scala 44:70:@257.4]
  assign _T_41 = _T_39 | _T_40; // @[control_unit.scala 44:56:@258.4]
  assign _T_42 = io_opcode == 7'h37; // @[control_unit.scala 45:23:@259.4]
  assign _T_46 = io_opcode == 7'h23; // @[control_unit.scala 51:19:@267.4]
  assign _T_49 = io_opcode == 7'h63; // @[control_unit.scala 57:19:@274.4]
  assign _T_70 = _T_36 | _T_38; // @[control_unit.scala 85:38:@322.14]
  assign _T_74 = _T_40 | _T_42; // @[control_unit.scala 87:38:@329.16]
  assign _GEN_5 = _T_74 ? 3'h6 : 3'h0; // @[control_unit.scala 87:61:@330.16]
  assign _GEN_6 = _T_70 ? 3'h3 : _GEN_5; // @[control_unit.scala 85:61:@323.14]
  assign _GEN_7 = _T_49 ? 3'h2 : _GEN_6; // @[control_unit.scala 83:37:@316.12]
  assign _GEN_8 = _T_34 ? 3'h4 : _GEN_7; // @[control_unit.scala 81:35:@311.10]
  assign _GEN_9 = _T_46 ? 3'h5 : _GEN_8; // @[control_unit.scala 79:36:@306.8]
  assign _GEN_10 = _T_32 ? 3'h1 : _GEN_9; // @[control_unit.scala 77:37:@301.6]
  assign _GEN_12 = _T_70 ? 2'h2 : 2'h0; // @[control_unit.scala 97:61:@349.8]
  assign _GEN_13 = _T_42 ? 2'h3 : _GEN_12; // @[control_unit.scala 95:34:@342.6]
  assign _T_88 = _T_32 | _T_46; // @[control_unit.scala 103:33:@357.4]
  assign _T_90 = _T_88 | _T_34; // @[control_unit.scala 103:57:@359.4]
  assign _T_92 = _T_90 | _T_40; // @[control_unit.scala 104:31:@361.4]
  assign _T_99 = _T_32 | _T_34; // @[control_unit.scala 111:33:@372.4]
  assign _GEN_17 = _T_46 ? 2'h1 : 2'h2; // @[control_unit.scala 113:38:@378.6]
  assign _GEN_19 = _T_36 ? 2'h3 : 2'h0; // @[control_unit.scala 125:36:@402.8]
  assign _GEN_20 = _T_38 ? 2'h2 : _GEN_19; // @[control_unit.scala 123:36:@397.6]
  assign io_branch_op = io_opcode == 7'h63; // @[control_unit.scala 58:18:@276.6 control_unit.scala 60:18:@279.6]
  assign io_memRead = io_opcode == 7'h3; // @[control_unit.scala 64:16:@283.6 control_unit.scala 66:16:@286.6]
  assign io_ALUOp = _T_31 ? 3'h0 : _GEN_10; // @[control_unit.scala 76:14:@297.6 control_unit.scala 78:14:@302.8 control_unit.scala 80:14:@307.10 control_unit.scala 82:14:@312.12 control_unit.scala 84:14:@317.14 control_unit.scala 86:14:@324.16 control_unit.scala 88:14:@331.18 control_unit.scala 90:14:@334.18]
  assign io_next_PC_sel = _T_49 ? 2'h1 : _GEN_20; // @[control_unit.scala 122:20:@393.6 control_unit.scala 124:20:@398.8 control_unit.scala 126:20:@403.10 control_unit.scala 128:21:@406.10]
  assign io_operand_A_sel = _T_40 ? 2'h1 : _GEN_13; // @[control_unit.scala 94:22:@338.6 control_unit.scala 96:22:@343.8 control_unit.scala 98:22:@350.10 control_unit.scala 100:22:@353.10]
  assign io_operand_B_sel = _T_92 | _T_42; // @[control_unit.scala 106:22:@365.6 control_unit.scala 108:22:@368.6]
  assign io_extend_sel = _T_99 ? 2'h0 : _GEN_17; // @[control_unit.scala 112:19:@374.6 control_unit.scala 114:19:@379.8 control_unit.scala 116:19:@386.10 control_unit.scala 118:19:@389.10]
  assign io_regWrite = _T_41 | _T_42; // @[control_unit.scala 46:18:@262.6 control_unit.scala 48:18:@265.6]
endmodule
module ALU( // @[:@409.2]
  input  [5:0]  io_ALU_Control, // @[:@412.4]
  input  [31:0] io_operand_A, // @[:@412.4]
  input  [31:0] io_operand_B, // @[:@412.4]
  output        io_branch, // @[:@412.4]
  output [31:0] io_ALU_Result // @[:@412.4]
);
  wire [4:0] shift_amount; // @[ALU.scala 19:34:@414.4]
  wire [1:0] _T_19; // @[ALU.scala 22:32:@417.4]
  wire  _T_21; // @[ALU.scala 22:38:@418.4]
  wire  _T_23; // @[ALU.scala 22:66:@419.4]
  wire  _T_26; // @[ALU.scala 25:24:@422.4]
  wire [32:0] _T_27; // @[ALU.scala 26:35:@424.6]
  wire [31:0] _T_28; // @[ALU.scala 26:35:@425.6]
  wire  _T_30; // @[ALU.scala 27:31:@429.6]
  wire [32:0] _T_31; // @[ALU.scala 28:35:@431.8]
  wire [32:0] _T_32; // @[ALU.scala 28:35:@432.8]
  wire [31:0] _T_33; // @[ALU.scala 28:35:@433.8]
  wire  _T_35; // @[ALU.scala 29:31:@437.8]
  wire [31:0] _T_36; // @[ALU.scala 30:35:@439.10]
  wire  _T_38; // @[ALU.scala 31:31:@443.10]
  wire [31:0] _T_39; // @[ALU.scala 32:35:@445.12]
  wire  _T_41; // @[ALU.scala 33:31:@449.12]
  wire [31:0] _T_42; // @[ALU.scala 34:35:@451.14]
  wire  _T_44; // @[ALU.scala 35:31:@455.14]
  wire  _T_45; // @[ALU.scala 36:35:@457.16]
  wire  _T_47; // @[ALU.scala 37:31:@461.16]
  wire  _T_50; // @[ALU.scala 39:31:@467.18]
  wire [62:0] _GEN_17; // @[ALU.scala 40:35:@469.20]
  wire [62:0] _T_51; // @[ALU.scala 40:35:@469.20]
  wire  _T_53; // @[ALU.scala 41:31:@473.20]
  wire [31:0] _T_54; // @[ALU.scala 42:34:@475.22]
  wire  _T_56; // @[ALU.scala 43:31:@479.22]
  wire  _T_59; // @[ALU.scala 45:31:@485.24]
  wire [32:0] _T_61; // @[ALU.scala 46:35:@487.26]
  wire [31:0] _T_62; // @[ALU.scala 46:35:@488.26]
  wire  _T_64; // @[ALU.scala 47:31:@492.26]
  wire  _T_65; // @[ALU.scala 48:35:@494.28]
  wire  _T_67; // @[ALU.scala 49:31:@498.28]
  wire  _T_68; // @[ALU.scala 50:35:@500.30]
  wire  _T_70; // @[ALU.scala 51:31:@504.30]
  wire  _T_73; // @[ALU.scala 53:31:@510.32]
  wire  _T_74; // @[ALU.scala 54:34:@512.34]
  wire  _T_76; // @[ALU.scala 55:31:@516.34]
  wire  _T_79; // @[ALU.scala 57:31:@522.36]
  wire  _GEN_0; // @[ALU.scala 57:43:@523.36]
  wire  _GEN_1; // @[ALU.scala 55:43:@517.34]
  wire  _GEN_2; // @[ALU.scala 53:43:@511.32]
  wire  _GEN_3; // @[ALU.scala 51:43:@505.30]
  wire  _GEN_4; // @[ALU.scala 49:43:@499.28]
  wire  _GEN_5; // @[ALU.scala 47:43:@493.26]
  wire [31:0] _GEN_6; // @[ALU.scala 45:43:@486.24]
  wire [31:0] _GEN_7; // @[ALU.scala 43:43:@480.22]
  wire [31:0] _GEN_8; // @[ALU.scala 41:43:@474.20]
  wire [62:0] _GEN_9; // @[ALU.scala 39:43:@468.18]
  wire [62:0] _GEN_10; // @[ALU.scala 37:43:@462.16]
  wire [62:0] _GEN_11; // @[ALU.scala 35:44:@456.14]
  wire [62:0] _GEN_12; // @[ALU.scala 33:44:@450.12]
  wire [62:0] _GEN_13; // @[ALU.scala 31:44:@444.10]
  wire [62:0] _GEN_14; // @[ALU.scala 29:44:@438.8]
  wire [62:0] _GEN_15; // @[ALU.scala 27:44:@430.6]
  wire [62:0] _GEN_16; // @[ALU.scala 25:37:@423.4]
  assign shift_amount = io_operand_B[4:0]; // @[ALU.scala 19:34:@414.4]
  assign _T_19 = io_ALU_Control[4:3]; // @[ALU.scala 22:32:@417.4]
  assign _T_21 = _T_19 == 2'h2; // @[ALU.scala 22:38:@418.4]
  assign _T_23 = io_ALU_Result == 32'h1; // @[ALU.scala 22:66:@419.4]
  assign _T_26 = io_ALU_Control == 6'h0; // @[ALU.scala 25:24:@422.4]
  assign _T_27 = io_operand_A + io_operand_B; // @[ALU.scala 26:35:@424.6]
  assign _T_28 = _T_27[31:0]; // @[ALU.scala 26:35:@425.6]
  assign _T_30 = io_ALU_Control == 6'h8; // @[ALU.scala 27:31:@429.6]
  assign _T_31 = io_operand_A - io_operand_B; // @[ALU.scala 28:35:@431.8]
  assign _T_32 = $unsigned(_T_31); // @[ALU.scala 28:35:@432.8]
  assign _T_33 = _T_32[31:0]; // @[ALU.scala 28:35:@433.8]
  assign _T_35 = io_ALU_Control == 6'h4; // @[ALU.scala 29:31:@437.8]
  assign _T_36 = io_operand_A ^ io_operand_B; // @[ALU.scala 30:35:@439.10]
  assign _T_38 = io_ALU_Control == 6'h6; // @[ALU.scala 31:31:@443.10]
  assign _T_39 = io_operand_A | io_operand_B; // @[ALU.scala 32:35:@445.12]
  assign _T_41 = io_ALU_Control == 6'h7; // @[ALU.scala 33:31:@449.12]
  assign _T_42 = io_operand_A & io_operand_B; // @[ALU.scala 34:35:@451.14]
  assign _T_44 = io_ALU_Control == 6'h2; // @[ALU.scala 35:31:@455.14]
  assign _T_45 = io_operand_A < io_operand_B; // @[ALU.scala 36:35:@457.16]
  assign _T_47 = io_ALU_Control == 6'h3; // @[ALU.scala 37:31:@461.16]
  assign _T_50 = io_ALU_Control == 6'h1; // @[ALU.scala 39:31:@467.18]
  assign _GEN_17 = {{31'd0}, io_operand_A}; // @[ALU.scala 40:35:@469.20]
  assign _T_51 = _GEN_17 << shift_amount; // @[ALU.scala 40:35:@469.20]
  assign _T_53 = io_ALU_Control == 6'h5; // @[ALU.scala 41:31:@473.20]
  assign _T_54 = io_operand_A >> shift_amount; // @[ALU.scala 42:34:@475.22]
  assign _T_56 = io_ALU_Control == 6'hd; // @[ALU.scala 43:31:@479.22]
  assign _T_59 = io_ALU_Control == 6'h1f; // @[ALU.scala 45:31:@485.24]
  assign _T_61 = io_operand_A + 32'h4; // @[ALU.scala 46:35:@487.26]
  assign _T_62 = _T_61[31:0]; // @[ALU.scala 46:35:@488.26]
  assign _T_64 = io_ALU_Control == 6'h10; // @[ALU.scala 47:31:@492.26]
  assign _T_65 = io_operand_A == io_operand_B; // @[ALU.scala 48:35:@494.28]
  assign _T_67 = io_ALU_Control == 6'h11; // @[ALU.scala 49:31:@498.28]
  assign _T_68 = io_operand_A != io_operand_B; // @[ALU.scala 50:35:@500.30]
  assign _T_70 = io_ALU_Control == 6'h14; // @[ALU.scala 51:31:@504.30]
  assign _T_73 = io_ALU_Control == 6'h15; // @[ALU.scala 53:31:@510.32]
  assign _T_74 = io_operand_A >= io_operand_B; // @[ALU.scala 54:34:@512.34]
  assign _T_76 = io_ALU_Control == 6'h16; // @[ALU.scala 55:31:@516.34]
  assign _T_79 = io_ALU_Control == 6'h17; // @[ALU.scala 57:31:@522.36]
  assign _GEN_0 = _T_79 ? _T_74 : 1'h0; // @[ALU.scala 57:43:@523.36]
  assign _GEN_1 = _T_76 ? _T_45 : _GEN_0; // @[ALU.scala 55:43:@517.34]
  assign _GEN_2 = _T_73 ? _T_74 : _GEN_1; // @[ALU.scala 53:43:@511.32]
  assign _GEN_3 = _T_70 ? _T_45 : _GEN_2; // @[ALU.scala 51:43:@505.30]
  assign _GEN_4 = _T_67 ? _T_68 : _GEN_3; // @[ALU.scala 49:43:@499.28]
  assign _GEN_5 = _T_64 ? _T_65 : _GEN_4; // @[ALU.scala 47:43:@493.26]
  assign _GEN_6 = _T_59 ? _T_62 : {{31'd0}, _GEN_5}; // @[ALU.scala 45:43:@486.24]
  assign _GEN_7 = _T_56 ? _T_54 : _GEN_6; // @[ALU.scala 43:43:@480.22]
  assign _GEN_8 = _T_53 ? _T_54 : _GEN_7; // @[ALU.scala 41:43:@474.20]
  assign _GEN_9 = _T_50 ? _T_51 : {{31'd0}, _GEN_8}; // @[ALU.scala 39:43:@468.18]
  assign _GEN_10 = _T_47 ? {{62'd0}, _T_45} : _GEN_9; // @[ALU.scala 37:43:@462.16]
  assign _GEN_11 = _T_44 ? {{62'd0}, _T_45} : _GEN_10; // @[ALU.scala 35:44:@456.14]
  assign _GEN_12 = _T_41 ? {{31'd0}, _T_42} : _GEN_11; // @[ALU.scala 33:44:@450.12]
  assign _GEN_13 = _T_38 ? {{31'd0}, _T_39} : _GEN_12; // @[ALU.scala 31:44:@444.10]
  assign _GEN_14 = _T_35 ? {{31'd0}, _T_36} : _GEN_13; // @[ALU.scala 29:44:@438.8]
  assign _GEN_15 = _T_30 ? {{31'd0}, _T_33} : _GEN_14; // @[ALU.scala 27:44:@430.6]
  assign _GEN_16 = _T_26 ? {{31'd0}, _T_28} : _GEN_15; // @[ALU.scala 25:37:@423.4]
  assign io_branch = _T_21 & _T_23; // @[ALU.scala 22:13:@421.4]
  assign io_ALU_Result = _GEN_16[31:0]; // @[ALU.scala 26:19:@426.6 ALU.scala 28:19:@434.8 ALU.scala 30:19:@440.10 ALU.scala 32:19:@446.12 ALU.scala 34:19:@452.14 ALU.scala 36:19:@458.16 ALU.scala 38:19:@464.18 ALU.scala 40:19:@470.20 ALU.scala 42:18:@476.22 ALU.scala 44:18:@482.24 ALU.scala 46:19:@489.26 ALU.scala 48:19:@495.28 ALU.scala 50:19:@501.30 ALU.scala 52:19:@507.32 ALU.scala 54:18:@513.34 ALU.scala 56:19:@519.36 ALU.scala 58:19:@525.38 ALU.scala 60:20:@528.38]
endmodule
module execute( // @[:@531.2]
  input  [2:0]  io_ALU_Operation, // @[:@534.4]
  input  [2:0]  io_funct3, // @[:@534.4]
  input  [6:0]  io_funct7, // @[:@534.4]
  input  [19:0] io_PC, // @[:@534.4]
  input  [1:0]  io_ALU_ASrc, // @[:@534.4]
  input         io_ALU_BSrc, // @[:@534.4]
  input         io_branch_op, // @[:@534.4]
  input  [31:0] io_regRead1, // @[:@534.4]
  input  [31:0] io_regRead2, // @[:@534.4]
  input  [31:0] io_extend, // @[:@534.4]
  output [31:0] io_ALU_Result, // @[:@534.4]
  output        io_branch, // @[:@534.4]
  output [19:0] io_JALR_target // @[:@534.4]
);
  wire [5:0] ALU0_io_ALU_Control; // @[execute.scala 82:19:@639.4]
  wire [31:0] ALU0_io_operand_A; // @[execute.scala 82:19:@639.4]
  wire [31:0] ALU0_io_operand_B; // @[execute.scala 82:19:@639.4]
  wire  ALU0_io_branch; // @[execute.scala 82:19:@639.4]
  wire [31:0] ALU0_io_ALU_Result; // @[execute.scala 82:19:@639.4]
  wire  _T_42; // @[execute.scala 38:27:@540.4]
  wire  _T_45; // @[execute.scala 40:34:@545.6]
  wire [5:0] _T_46; // @[Cat.scala 30:58:@547.8]
  wire  _T_48; // @[execute.scala 43:34:@551.8]
  wire  _T_50; // @[execute.scala 43:71:@552.8]
  wire  _T_51; // @[execute.scala 43:58:@553.8]
  wire  _T_56; // @[execute.scala 45:71:@560.10]
  wire  _T_57; // @[execute.scala 45:58:@561.10]
  wire [5:0] _T_59; // @[Cat.scala 30:58:@563.12]
  wire  _T_64; // @[execute.scala 50:34:@573.14]
  wire  _T_67; // @[execute.scala 50:58:@575.14]
  wire  _T_69; // @[execute.scala 50:110:@576.14]
  wire  _T_70; // @[execute.scala 50:98:@577.14]
  wire [5:0] _T_72; // @[Cat.scala 30:58:@579.16]
  wire  _T_77; // @[execute.scala 52:58:@585.16]
  wire  _T_80; // @[execute.scala 52:98:@587.16]
  wire  _T_87; // @[execute.scala 54:59:@595.18]
  wire [5:0] _GEN_0; // @[execute.scala 56:56:@602.20]
  wire [5:0] _GEN_1; // @[execute.scala 54:96:@596.18]
  wire [5:0] _GEN_2; // @[execute.scala 52:133:@588.16]
  wire [5:0] _GEN_3; // @[execute.scala 50:133:@578.14]
  wire [5:0] _GEN_4; // @[execute.scala 47:56:@568.12]
  wire [5:0] _GEN_5; // @[execute.scala 45:99:@562.10]
  wire [5:0] _GEN_6; // @[execute.scala 43:99:@554.8]
  wire [5:0] _GEN_7; // @[execute.scala 40:57:@546.6]
  wire  _T_96; // @[execute.scala 62:21:@609.4]
  wire  _T_98; // @[execute.scala 64:28:@614.6]
  wire [20:0] _T_100; // @[execute.scala 65:24:@616.8]
  wire [19:0] _T_101; // @[execute.scala 65:24:@617.8]
  wire [31:0] _GEN_9; // @[execute.scala 64:50:@615.6]
  wire [1:0] _GEN_13; // @[execute.scala 70:21:@623.4]
  wire  _T_103; // @[execute.scala 70:21:@623.4]
  wire  ALU_branch; // @[execute.scala 34:25:@537.4 execute.scala 88:19:@646.4]
  wire [32:0] _T_109; // @[execute.scala 94:33:@648.4]
  wire [31:0] _T_110; // @[execute.scala 94:33:@649.4]
  wire [31:0] _T_112; // @[execute.scala 94:46:@650.4]
  ALU ALU0 ( // @[execute.scala 82:19:@639.4]
    .io_ALU_Control(ALU0_io_ALU_Control),
    .io_operand_A(ALU0_io_operand_A),
    .io_operand_B(ALU0_io_operand_B),
    .io_branch(ALU0_io_branch),
    .io_ALU_Result(ALU0_io_ALU_Result)
  );
  assign _T_42 = io_ALU_Operation == 3'h3; // @[execute.scala 38:27:@540.4]
  assign _T_45 = io_ALU_Operation == 3'h2; // @[execute.scala 40:34:@545.6]
  assign _T_46 = {io_ALU_Operation,io_funct3}; // @[Cat.scala 30:58:@547.8]
  assign _T_48 = io_ALU_Operation == 3'h0; // @[execute.scala 43:34:@551.8]
  assign _T_50 = io_funct7 == 7'h0; // @[execute.scala 43:71:@552.8]
  assign _T_51 = _T_48 & _T_50; // @[execute.scala 43:58:@553.8]
  assign _T_56 = io_funct7 == 7'h20; // @[execute.scala 45:71:@560.10]
  assign _T_57 = _T_48 & _T_56; // @[execute.scala 45:58:@561.10]
  assign _T_59 = {3'h1,io_funct3}; // @[Cat.scala 30:58:@563.12]
  assign _T_64 = io_ALU_Operation == 3'h1; // @[execute.scala 50:34:@573.14]
  assign _T_67 = _T_64 & _T_50; // @[execute.scala 50:58:@575.14]
  assign _T_69 = io_funct3 == 3'h5; // @[execute.scala 50:110:@576.14]
  assign _T_70 = _T_67 & _T_69; // @[execute.scala 50:98:@577.14]
  assign _T_72 = {3'h0,io_funct3}; // @[Cat.scala 30:58:@579.16]
  assign _T_77 = _T_64 & _T_56; // @[execute.scala 52:58:@585.16]
  assign _T_80 = _T_77 & _T_69; // @[execute.scala 52:98:@587.16]
  assign _T_87 = _T_64 & _T_69; // @[execute.scala 54:59:@595.18]
  assign _GEN_0 = _T_64 ? _T_72 : 6'h0; // @[execute.scala 56:56:@602.20]
  assign _GEN_1 = _T_87 ? _T_72 : _GEN_0; // @[execute.scala 54:96:@596.18]
  assign _GEN_2 = _T_80 ? _T_59 : _GEN_1; // @[execute.scala 52:133:@588.16]
  assign _GEN_3 = _T_70 ? _T_72 : _GEN_2; // @[execute.scala 50:133:@578.14]
  assign _GEN_4 = _T_48 ? _T_46 : _GEN_3; // @[execute.scala 47:56:@568.12]
  assign _GEN_5 = _T_57 ? _T_59 : _GEN_4; // @[execute.scala 45:99:@562.10]
  assign _GEN_6 = _T_51 ? _T_46 : _GEN_5; // @[execute.scala 43:99:@554.8]
  assign _GEN_7 = _T_45 ? _T_46 : _GEN_6; // @[execute.scala 40:57:@546.6]
  assign _T_96 = io_ALU_ASrc == 2'h1; // @[execute.scala 62:21:@609.4]
  assign _T_98 = io_ALU_ASrc == 2'h2; // @[execute.scala 64:28:@614.6]
  assign _T_100 = io_PC + 20'h4; // @[execute.scala 65:24:@616.8]
  assign _T_101 = _T_100[19:0]; // @[execute.scala 65:24:@617.8]
  assign _GEN_9 = _T_98 ? {{12'd0}, _T_101} : io_regRead1; // @[execute.scala 64:50:@615.6]
  assign _GEN_13 = {{1'd0}, io_ALU_BSrc}; // @[execute.scala 70:21:@623.4]
  assign _T_103 = _GEN_13 == 2'h1; // @[execute.scala 70:21:@623.4]
  assign ALU_branch = ALU0_io_branch; // @[execute.scala 34:25:@537.4 execute.scala 88:19:@646.4]
  assign _T_109 = io_regRead1 + io_extend; // @[execute.scala 94:33:@648.4]
  assign _T_110 = _T_109[31:0]; // @[execute.scala 94:33:@649.4]
  assign _T_112 = _T_110 & 32'hfffffffe; // @[execute.scala 94:46:@650.4]
  assign io_ALU_Result = ALU0_io_ALU_Result; // @[execute.scala 89:19:@647.4]
  assign io_branch = ALU_branch & io_branch_op; // @[execute.scala 77:15:@634.6 execute.scala 79:15:@637.6]
  assign io_JALR_target = _T_112[19:0]; // @[execute.scala 94:16:@651.4]
  assign ALU0_io_ALU_Control = _T_42 ? 6'h1f : _GEN_7; // @[execute.scala 83:25:@642.4]
  assign ALU0_io_operand_A = _T_96 ? {{12'd0}, io_PC} : _GEN_9; // @[execute.scala 84:25:@643.4]
  assign ALU0_io_operand_B = _T_103 ? io_extend : io_regRead2; // @[execute.scala 85:25:@644.4]
endmodule
module memory( // @[:@708.2]
  input         clock, // @[:@709.4]
  input         io_load, // @[:@711.4]
  input  [19:0] io_address, // @[:@711.4]
  input  [31:0] io_store_data, // @[:@711.4]
  output [31:0] io_load_data // @[:@711.4]
);
  wire  mem_interface0_clock; // @[memory.scala 27:29:@713.4]
  wire  mem_interface0_io_read; // @[memory.scala 27:29:@713.4]
  wire [19:0] mem_interface0_io_address; // @[memory.scala 27:29:@713.4]
  wire [31:0] mem_interface0_io_in_data; // @[memory.scala 27:29:@713.4]
  wire [19:0] mem_interface0_io_out_address; // @[memory.scala 27:29:@713.4]
  wire [31:0] mem_interface0_io_out_data; // @[memory.scala 27:29:@713.4]
  mem_interface mem_interface0 ( // @[memory.scala 27:29:@713.4]
    .clock(mem_interface0_clock),
    .io_read(mem_interface0_io_read),
    .io_address(mem_interface0_io_address),
    .io_in_data(mem_interface0_io_in_data),
    .io_out_address(mem_interface0_io_out_address),
    .io_out_data(mem_interface0_io_out_data)
  );
  assign io_load_data = mem_interface0_io_out_data; // @[memory.scala 38:17:@725.4]
  assign mem_interface0_clock = clock; // @[:@714.4]
  assign mem_interface0_io_read = io_load; // @[memory.scala 30:31:@718.4]
  assign mem_interface0_io_address = io_address; // @[memory.scala 32:31:@720.4]
  assign mem_interface0_io_in_data = io_store_data; // @[memory.scala 33:31:@721.4]
endmodule
module writeback( // @[:@727.2]
  input         io_opWrite, // @[:@730.4]
  input         io_opSel, // @[:@730.4]
  input  [31:0] io_ALU_Result, // @[:@730.4]
  input  [31:0] io_memory_data, // @[:@730.4]
  output        io_write, // @[:@730.4]
  output [31:0] io_write_data // @[:@730.4]
);
  assign io_write = io_opWrite; // @[writeback.scala 29:17:@733.4]
  assign io_write_data = io_opSel ? io_memory_data : io_ALU_Result; // @[writeback.scala 32:19:@736.6 writeback.scala 34:19:@739.6]
endmodule
module BRISC_V_Core( // @[:@742.2]
  input   clock, // @[:@743.4]
  input   reset, // @[:@744.4]
  input   io_clock, // @[:@745.4]
  input   io_reset, // @[:@745.4]
  input   io_start, // @[:@745.4]
  output  io_register_writeback // @[:@745.4]
);
  wire  fetch0_clock; // @[RISC_V_core.scala 63:21:@784.4]
  wire  fetch0_reset; // @[RISC_V_core.scala 63:21:@784.4]
  wire  fetch0_io_start; // @[RISC_V_core.scala 63:21:@784.4]
  wire [1:0] fetch0_io_PC_select; // @[RISC_V_core.scala 63:21:@784.4]
  wire [19:0] fetch0_io_JAL_target; // @[RISC_V_core.scala 63:21:@784.4]
  wire [19:0] fetch0_io_JALR_target; // @[RISC_V_core.scala 63:21:@784.4]
  wire  fetch0_io_branch; // @[RISC_V_core.scala 63:21:@784.4]
  wire [19:0] fetch0_io_branch_target; // @[RISC_V_core.scala 63:21:@784.4]
  wire [31:0] fetch0_io_instruction; // @[RISC_V_core.scala 63:21:@784.4]
  wire [19:0] fetch0_io_inst_PC; // @[RISC_V_core.scala 63:21:@784.4]
  wire  decode0_clock; // @[RISC_V_core.scala 79:22:@800.4]
  wire  decode0_reset; // @[RISC_V_core.scala 79:22:@800.4]
  wire [19:0] decode0_io_PC; // @[RISC_V_core.scala 79:22:@800.4]
  wire [31:0] decode0_io_instruction; // @[RISC_V_core.scala 79:22:@800.4]
  wire [1:0] decode0_io_extend_sel; // @[RISC_V_core.scala 79:22:@800.4]
  wire  decode0_io_write; // @[RISC_V_core.scala 79:22:@800.4]
  wire [31:0] decode0_io_write_data; // @[RISC_V_core.scala 79:22:@800.4]
  wire [31:0] decode0_io_rs1_data; // @[RISC_V_core.scala 79:22:@800.4]
  wire [31:0] decode0_io_rs2_data; // @[RISC_V_core.scala 79:22:@800.4]
  wire [6:0] decode0_io_opcode; // @[RISC_V_core.scala 79:22:@800.4]
  wire [6:0] decode0_io_funct7; // @[RISC_V_core.scala 79:22:@800.4]
  wire [2:0] decode0_io_funct3; // @[RISC_V_core.scala 79:22:@800.4]
  wire [31:0] decode0_io_extend_imm; // @[RISC_V_core.scala 79:22:@800.4]
  wire [19:0] decode0_io_branch_target; // @[RISC_V_core.scala 79:22:@800.4]
  wire [19:0] decode0_io_JAL_target; // @[RISC_V_core.scala 79:22:@800.4]
  wire [6:0] control_unit0_io_opcode; // @[RISC_V_core.scala 100:28:@820.4]
  wire  control_unit0_io_branch_op; // @[RISC_V_core.scala 100:28:@820.4]
  wire  control_unit0_io_memRead; // @[RISC_V_core.scala 100:28:@820.4]
  wire [2:0] control_unit0_io_ALUOp; // @[RISC_V_core.scala 100:28:@820.4]
  wire [1:0] control_unit0_io_next_PC_sel; // @[RISC_V_core.scala 100:28:@820.4]
  wire [1:0] control_unit0_io_operand_A_sel; // @[RISC_V_core.scala 100:28:@820.4]
  wire  control_unit0_io_operand_B_sel; // @[RISC_V_core.scala 100:28:@820.4]
  wire [1:0] control_unit0_io_extend_sel; // @[RISC_V_core.scala 100:28:@820.4]
  wire  control_unit0_io_regWrite; // @[RISC_V_core.scala 100:28:@820.4]
  wire [2:0] execute0_io_ALU_Operation; // @[RISC_V_core.scala 117:23:@836.4]
  wire [2:0] execute0_io_funct3; // @[RISC_V_core.scala 117:23:@836.4]
  wire [6:0] execute0_io_funct7; // @[RISC_V_core.scala 117:23:@836.4]
  wire [19:0] execute0_io_PC; // @[RISC_V_core.scala 117:23:@836.4]
  wire [1:0] execute0_io_ALU_ASrc; // @[RISC_V_core.scala 117:23:@836.4]
  wire  execute0_io_ALU_BSrc; // @[RISC_V_core.scala 117:23:@836.4]
  wire  execute0_io_branch_op; // @[RISC_V_core.scala 117:23:@836.4]
  wire [31:0] execute0_io_regRead1; // @[RISC_V_core.scala 117:23:@836.4]
  wire [31:0] execute0_io_regRead2; // @[RISC_V_core.scala 117:23:@836.4]
  wire [31:0] execute0_io_extend; // @[RISC_V_core.scala 117:23:@836.4]
  wire [31:0] execute0_io_ALU_Result; // @[RISC_V_core.scala 117:23:@836.4]
  wire  execute0_io_branch; // @[RISC_V_core.scala 117:23:@836.4]
  wire [19:0] execute0_io_JALR_target; // @[RISC_V_core.scala 117:23:@836.4]
  wire  memory0_clock; // @[RISC_V_core.scala 137:22:@855.4]
  wire  memory0_io_load; // @[RISC_V_core.scala 137:22:@855.4]
  wire [19:0] memory0_io_address; // @[RISC_V_core.scala 137:22:@855.4]
  wire [31:0] memory0_io_store_data; // @[RISC_V_core.scala 137:22:@855.4]
  wire [31:0] memory0_io_load_data; // @[RISC_V_core.scala 137:22:@855.4]
  wire  writeback0_io_opWrite; // @[RISC_V_core.scala 150:25:@868.4]
  wire  writeback0_io_opSel; // @[RISC_V_core.scala 150:25:@868.4]
  wire [31:0] writeback0_io_ALU_Result; // @[RISC_V_core.scala 150:25:@868.4]
  wire [31:0] writeback0_io_memory_data; // @[RISC_V_core.scala 150:25:@868.4]
  wire  writeback0_io_write; // @[RISC_V_core.scala 150:25:@868.4]
  wire [31:0] writeback0_io_write_data; // @[RISC_V_core.scala 150:25:@868.4]
  wire [31:0] write_data; // @[RISC_V_core.scala 34:31:@758.4 RISC_V_core.scala 161:14:@880.4]
  wire [31:0] ALU_result; // @[RISC_V_core.scala 53:31:@777.4 RISC_V_core.scala 131:15:@851.4]
  fetch fetch0 ( // @[RISC_V_core.scala 63:21:@784.4]
    .clock(fetch0_clock),
    .reset(fetch0_reset),
    .io_start(fetch0_io_start),
    .io_PC_select(fetch0_io_PC_select),
    .io_JAL_target(fetch0_io_JAL_target),
    .io_JALR_target(fetch0_io_JALR_target),
    .io_branch(fetch0_io_branch),
    .io_branch_target(fetch0_io_branch_target),
    .io_instruction(fetch0_io_instruction),
    .io_inst_PC(fetch0_io_inst_PC)
  );
  decode decode0 ( // @[RISC_V_core.scala 79:22:@800.4]
    .clock(decode0_clock),
    .reset(decode0_reset),
    .io_PC(decode0_io_PC),
    .io_instruction(decode0_io_instruction),
    .io_extend_sel(decode0_io_extend_sel),
    .io_write(decode0_io_write),
    .io_write_data(decode0_io_write_data),
    .io_rs1_data(decode0_io_rs1_data),
    .io_rs2_data(decode0_io_rs2_data),
    .io_opcode(decode0_io_opcode),
    .io_funct7(decode0_io_funct7),
    .io_funct3(decode0_io_funct3),
    .io_extend_imm(decode0_io_extend_imm),
    .io_branch_target(decode0_io_branch_target),
    .io_JAL_target(decode0_io_JAL_target)
  );
  control_unit control_unit0 ( // @[RISC_V_core.scala 100:28:@820.4]
    .io_opcode(control_unit0_io_opcode),
    .io_branch_op(control_unit0_io_branch_op),
    .io_memRead(control_unit0_io_memRead),
    .io_ALUOp(control_unit0_io_ALUOp),
    .io_next_PC_sel(control_unit0_io_next_PC_sel),
    .io_operand_A_sel(control_unit0_io_operand_A_sel),
    .io_operand_B_sel(control_unit0_io_operand_B_sel),
    .io_extend_sel(control_unit0_io_extend_sel),
    .io_regWrite(control_unit0_io_regWrite)
  );
  execute execute0 ( // @[RISC_V_core.scala 117:23:@836.4]
    .io_ALU_Operation(execute0_io_ALU_Operation),
    .io_funct3(execute0_io_funct3),
    .io_funct7(execute0_io_funct7),
    .io_PC(execute0_io_PC),
    .io_ALU_ASrc(execute0_io_ALU_ASrc),
    .io_ALU_BSrc(execute0_io_ALU_BSrc),
    .io_branch_op(execute0_io_branch_op),
    .io_regRead1(execute0_io_regRead1),
    .io_regRead2(execute0_io_regRead2),
    .io_extend(execute0_io_extend),
    .io_ALU_Result(execute0_io_ALU_Result),
    .io_branch(execute0_io_branch),
    .io_JALR_target(execute0_io_JALR_target)
  );
  memory memory0 ( // @[RISC_V_core.scala 137:22:@855.4]
    .clock(memory0_clock),
    .io_load(memory0_io_load),
    .io_address(memory0_io_address),
    .io_store_data(memory0_io_store_data),
    .io_load_data(memory0_io_load_data)
  );
  writeback writeback0 ( // @[RISC_V_core.scala 150:25:@868.4]
    .io_opWrite(writeback0_io_opWrite),
    .io_opSel(writeback0_io_opSel),
    .io_ALU_Result(writeback0_io_ALU_Result),
    .io_memory_data(writeback0_io_memory_data),
    .io_write(writeback0_io_write),
    .io_write_data(writeback0_io_write_data)
  );
  assign write_data = writeback0_io_write_data; // @[RISC_V_core.scala 34:31:@758.4 RISC_V_core.scala 161:14:@880.4]
  assign ALU_result = execute0_io_ALU_Result; // @[RISC_V_core.scala 53:31:@777.4 RISC_V_core.scala 131:15:@851.4]
  assign io_register_writeback = write_data[0]; // @[RISC_V_core.scala 61:24:@783.4]
  assign fetch0_clock = clock; // @[:@785.4]
  assign fetch0_reset = reset; // @[:@786.4]
  assign fetch0_io_start = io_start; // @[RISC_V_core.scala 66:29:@789.4]
  assign fetch0_io_PC_select = control_unit0_io_next_PC_sel; // @[RISC_V_core.scala 67:29:@790.4]
  assign fetch0_io_JAL_target = decode0_io_JAL_target; // @[RISC_V_core.scala 69:29:@792.4]
  assign fetch0_io_JALR_target = execute0_io_JALR_target; // @[RISC_V_core.scala 70:29:@793.4]
  assign fetch0_io_branch = execute0_io_branch; // @[RISC_V_core.scala 71:29:@794.4]
  assign fetch0_io_branch_target = decode0_io_branch_target; // @[RISC_V_core.scala 72:29:@795.4]
  assign decode0_clock = clock; // @[:@801.4]
  assign decode0_reset = reset; // @[:@802.4]
  assign decode0_io_PC = fetch0_io_inst_PC; // @[RISC_V_core.scala 82:28:@805.4]
  assign decode0_io_instruction = fetch0_io_instruction; // @[RISC_V_core.scala 83:28:@806.4]
  assign decode0_io_extend_sel = control_unit0_io_extend_sel; // @[RISC_V_core.scala 84:28:@807.4]
  assign decode0_io_write = writeback0_io_write; // @[RISC_V_core.scala 85:28:@808.4]
  assign decode0_io_write_data = writeback0_io_write_data; // @[RISC_V_core.scala 87:28:@810.4]
  assign control_unit0_io_opcode = decode0_io_opcode; // @[RISC_V_core.scala 103:34:@825.4]
  assign execute0_io_ALU_Operation = control_unit0_io_ALUOp; // @[RISC_V_core.scala 120:29:@841.4]
  assign execute0_io_funct3 = decode0_io_funct3; // @[RISC_V_core.scala 121:29:@842.4]
  assign execute0_io_funct7 = decode0_io_funct7; // @[RISC_V_core.scala 122:29:@843.4]
  assign execute0_io_PC = fetch0_io_inst_PC; // @[RISC_V_core.scala 123:29:@844.4]
  assign execute0_io_ALU_ASrc = control_unit0_io_operand_A_sel; // @[RISC_V_core.scala 124:29:@845.4]
  assign execute0_io_ALU_BSrc = control_unit0_io_operand_B_sel; // @[RISC_V_core.scala 125:29:@846.4]
  assign execute0_io_branch_op = control_unit0_io_branch_op; // @[RISC_V_core.scala 126:29:@847.4]
  assign execute0_io_regRead1 = decode0_io_rs1_data; // @[RISC_V_core.scala 127:29:@848.4]
  assign execute0_io_regRead2 = decode0_io_rs2_data; // @[RISC_V_core.scala 128:29:@849.4]
  assign execute0_io_extend = decode0_io_extend_imm; // @[RISC_V_core.scala 129:29:@850.4]
  assign memory0_clock = clock; // @[:@856.4]
  assign memory0_io_load = control_unit0_io_memRead; // @[RISC_V_core.scala 140:27:@860.4]
  assign memory0_io_address = ALU_result[19:0]; // @[RISC_V_core.scala 142:27:@862.4]
  assign memory0_io_store_data = decode0_io_rs2_data; // @[RISC_V_core.scala 143:27:@863.4]
  assign writeback0_io_opWrite = control_unit0_io_regWrite; // @[RISC_V_core.scala 153:29:@873.4]
  assign writeback0_io_opSel = control_unit0_io_memRead; // @[RISC_V_core.scala 154:29:@874.4]
  assign writeback0_io_ALU_Result = execute0_io_ALU_Result; // @[RISC_V_core.scala 156:29:@876.4]
  assign writeback0_io_memory_data = memory0_io_load_data; // @[RISC_V_core.scala 157:29:@877.4]
endmodule
