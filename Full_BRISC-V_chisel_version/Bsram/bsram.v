module bsram( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input         io_clock, // @[:@6.4]
  input         io_reset, // @[:@6.4]
  input  [19:0] io_readAddress, // @[:@6.4]
  input         io_readEnable, // @[:@6.4]
  input         io_writeEnable, // @[:@6.4]
  input  [19:0] io_writeAddress, // @[:@6.4]
  input  [31:0] io_writeData, // @[:@6.4]
  output [31:0] io_readData // @[:@6.4]
);
  reg [31:0] mem [0:1023]; // @[bsram.scala 29:22:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] mem__T_31_data; // @[bsram.scala 29:22:@8.4]
  wire [9:0] mem__T_31_addr; // @[bsram.scala 29:22:@8.4]
  wire [31:0] mem__T_24_data; // @[bsram.scala 29:22:@8.4]
  wire [9:0] mem__T_24_addr; // @[bsram.scala 29:22:@8.4]
  wire  mem__T_24_mask; // @[bsram.scala 29:22:@8.4]
  wire  mem__T_24_en; // @[bsram.scala 29:22:@8.4]
  wire  _T_25; // @[bsram.scala 32:55:@12.4]
  wire [9:0] _T_30; // @[bsram.scala 32:24:@18.6]
  reg [9:0] mem__T_31_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign mem__T_31_addr = mem__T_31_addr_pipe_0;
  assign mem__T_31_data = mem[mem__T_31_addr]; // @[bsram.scala 29:22:@8.4]
  assign mem__T_24_data = io_writeData;
  assign mem__T_24_addr = io_writeAddress[9:0];
  assign mem__T_24_mask = 1'h1;
  assign mem__T_24_en = 1'h1;
  assign _T_25 = io_readEnable; // @[bsram.scala 32:55:@12.4]
  assign _T_30 = io_readAddress[9:0]; // @[bsram.scala 32:24:@18.6]
  assign io_readData = mem__T_31_data; // @[bsram.scala 32:13:@21.4]
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
      mem[mem__T_24_addr] <= mem__T_24_data; // @[bsram.scala 29:22:@8.4]
    end
    if (_T_25) begin
      mem__T_31_addr_pipe_0 <= _T_30;
    end
  end
endmodule
