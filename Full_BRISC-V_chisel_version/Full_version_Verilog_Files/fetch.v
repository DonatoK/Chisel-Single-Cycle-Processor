module bsram( // @[:@3.2]
  input         clock, // @[:@4.4]
  input  [19:0] io_readAddress, // @[:@6.4]
  input         io_readEnable, // @[:@6.4]
  input  [19:0] io_writeAddress, // @[:@6.4]
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
  assign mem__T_24_data = 32'h0;
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
  output        io_valid, // @[:@26.4]
  output        io_ready, // @[:@26.4]
  output [19:0] io_out_address, // @[:@26.4]
  output [31:0] io_out_data // @[:@26.4]
);
  wire  bsram0_clock; // @[mem_interface.scala 25:21:@28.4]
  wire [19:0] bsram0_io_readAddress; // @[mem_interface.scala 25:21:@28.4]
  wire  bsram0_io_readEnable; // @[mem_interface.scala 25:21:@28.4]
  wire [19:0] bsram0_io_writeAddress; // @[mem_interface.scala 25:21:@28.4]
  wire [31:0] bsram0_io_readData; // @[mem_interface.scala 25:21:@28.4]
  bsram bsram0 ( // @[mem_interface.scala 25:21:@28.4]
    .clock(bsram0_clock),
    .io_readAddress(bsram0_io_readAddress),
    .io_readEnable(bsram0_io_readEnable),
    .io_writeAddress(bsram0_io_writeAddress),
    .io_readData(bsram0_io_readData)
  );
  assign io_valid = io_read; // @[mem_interface.scala 44:14:@50.6 mem_interface.scala 47:14:@54.6]
  assign io_ready = io_read ? 1'h0 : 1'h1; // @[mem_interface.scala 45:14:@51.6 mem_interface.scala 48:14:@55.6]
  assign io_out_address = io_read ? io_address : 20'h0; // @[mem_interface.scala 38:20:@41.6 mem_interface.scala 40:20:@44.6]
  assign io_out_data = bsram0_io_readData; // @[mem_interface.scala 34:25:@38.4]
  assign bsram0_clock = clock; // @[:@29.4]
  assign bsram0_io_readAddress = io_address; // @[mem_interface.scala 28:25:@33.4]
  assign bsram0_io_readEnable = io_read; // @[mem_interface.scala 29:25:@34.4]
  assign bsram0_io_writeAddress = io_address; // @[mem_interface.scala 31:25:@36.4]
endmodule
module fetch( // @[:@58.2]
  input         clock, // @[:@59.4]
  input         reset, // @[:@60.4]
  input         io_clock, // @[:@61.4]
  input         io_reset, // @[:@61.4]
  input         io_start, // @[:@61.4]
  input  [1:0]  io_PC_select, // @[:@61.4]
  input  [19:0] io_program_address, // @[:@61.4]
  input  [19:0] io_JAL_target, // @[:@61.4]
  input  [19:0] io_JALR_target, // @[:@61.4]
  input         io_branch, // @[:@61.4]
  input  [19:0] io_branch_target, // @[:@61.4]
  output [31:0] io_instruction, // @[:@61.4]
  output [19:0] io_inst_PC, // @[:@61.4]
  output        io_valid, // @[:@61.4]
  output        io_ready // @[:@61.4]
);
  wire  mem_interface0_clock; // @[fetch.scala 41:29:@70.4]
  wire  mem_interface0_io_read; // @[fetch.scala 41:29:@70.4]
  wire [19:0] mem_interface0_io_address; // @[fetch.scala 41:29:@70.4]
  wire  mem_interface0_io_valid; // @[fetch.scala 41:29:@70.4]
  wire  mem_interface0_io_ready; // @[fetch.scala 41:29:@70.4]
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
    .io_valid(mem_interface0_io_valid),
    .io_ready(mem_interface0_io_ready),
    .io_out_address(mem_interface0_io_out_address),
    .io_out_data(mem_interface0_io_out_data)
  );
  assign _GEN_0 = reset ? {{12'd0}, io_program_address} : PC_reg; // @[fetch.scala 59:21:@84.4]
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
  assign _GEN_5 = io_start ? io_program_address : _GEN_3; // @[fetch.scala 69:32:@98.6]
  assign _GEN_7 = reset ? 1'h0 : io_start; // @[fetch.scala 65:23:@91.4]
  assign _GEN_8 = reset ? 20'h0 : _GEN_5; // @[fetch.scala 65:23:@91.4]
  assign out_addr = {{12'd0}, mem_interface0_io_out_address}; // @[fetch.scala 35:22:@66.4 fetch.scala 51:18:@81.4]
  assign _GEN_10 = {{2'd0}, out_addr}; // @[fetch.scala 86:26:@126.4]
  assign _T_60 = _GEN_10 << 2; // @[fetch.scala 86:26:@126.4]
  assign _T_61 = PC[19:2]; // @[fetch.scala 87:29:@128.4]
  assign instruction_address = {{14'd0}, _T_61}; // @[fetch.scala 36:34:@67.4 fetch.scala 87:23:@129.4]
  assign io_instruction = mem_interface0_io_out_data; // @[fetch.scala 52:18:@82.4]
  assign io_inst_PC = _T_60[19:0]; // @[fetch.scala 86:14:@127.4]
  assign io_valid = mem_interface0_io_valid; // @[fetch.scala 49:18:@79.4]
  assign io_ready = mem_interface0_io_ready; // @[fetch.scala 50:18:@80.4]
  assign mem_interface0_clock = clock; // @[:@71.4]
  assign mem_interface0_io_read = fetch; // @[fetch.scala 44:33:@75.4]
  assign mem_interface0_io_address = instruction_address[19:0]; // @[fetch.scala 46:33:@77.4]
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
