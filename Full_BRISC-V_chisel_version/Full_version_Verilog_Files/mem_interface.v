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
  input         reset, // @[:@25.4]
  input         io_clock, // @[:@26.4]
  input         io_reset, // @[:@26.4]
  input         io_read, // @[:@26.4]
  input         io_write, // @[:@26.4]
  input  [19:0] io_address, // @[:@26.4]
  input  [31:0] io_in_data, // @[:@26.4]
  output        io_valid, // @[:@26.4]
  output        io_ready, // @[:@26.4]
  output [19:0] io_out_address, // @[:@26.4]
  output [31:0] io_out_data // @[:@26.4]
);
  wire  bsram0_clock; // @[mem_interface.scala 29:21:@28.4]
  wire [19:0] bsram0_io_readAddress; // @[mem_interface.scala 29:21:@28.4]
  wire  bsram0_io_readEnable; // @[mem_interface.scala 29:21:@28.4]
  wire [19:0] bsram0_io_writeAddress; // @[mem_interface.scala 29:21:@28.4]
  wire [31:0] bsram0_io_writeData; // @[mem_interface.scala 29:21:@28.4]
  wire [31:0] bsram0_io_readData; // @[mem_interface.scala 29:21:@28.4]
  wire  _T_32; // @[mem_interface.scala 47:25:@48.4]
  bsram bsram0 ( // @[mem_interface.scala 29:21:@28.4]
    .clock(bsram0_clock),
    .io_readAddress(bsram0_io_readAddress),
    .io_readEnable(bsram0_io_readEnable),
    .io_writeAddress(bsram0_io_writeAddress),
    .io_writeData(bsram0_io_writeData),
    .io_readData(bsram0_io_readData)
  );
  assign _T_32 = io_read | io_write; // @[mem_interface.scala 47:25:@48.4]
  assign io_valid = io_read | io_write; // @[mem_interface.scala 48:14:@50.6 mem_interface.scala 51:14:@54.6]
  assign io_ready = _T_32 ? 1'h0 : 1'h1; // @[mem_interface.scala 49:14:@51.6 mem_interface.scala 52:14:@55.6]
  assign io_out_address = io_read ? io_address : 20'h0; // @[mem_interface.scala 42:20:@41.6 mem_interface.scala 44:20:@44.6]
  assign io_out_data = bsram0_io_readData; // @[mem_interface.scala 38:25:@38.4]
  assign bsram0_clock = clock; // @[:@29.4]
  assign bsram0_io_readAddress = io_address; // @[mem_interface.scala 32:25:@33.4]
  assign bsram0_io_readEnable = io_read; // @[mem_interface.scala 33:25:@34.4]
  assign bsram0_io_writeAddress = io_address; // @[mem_interface.scala 35:25:@36.4]
  assign bsram0_io_writeData = io_in_data; // @[mem_interface.scala 36:25:@37.4]
endmodule
