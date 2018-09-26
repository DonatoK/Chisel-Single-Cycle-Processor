;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit memory : 
  module bsram : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip readAddress : UInt<20>, flip readEnable : UInt<1>, flip writeEnable : UInt<1>, flip writeAddress : UInt<20>, flip writeData : UInt<32>, readData : UInt<32>}
    
    smem mem : UInt<32>[1024] @[bsram.scala 25:22]
    node _T_23 = bits(io.writeAddress, 9, 0)
    write mport _T_24 = mem[_T_23], clock
    _T_24 <= io.writeData
    node _T_25 = bits(io.readEnable, 0, 0) @[bsram.scala 28:55]
    wire _T_27 : UInt @[bsram.scala 28:24]
    _T_27 is invalid @[bsram.scala 28:24]
    when _T_25 : @[bsram.scala 28:24]
      _T_27 <= io.readAddress @[bsram.scala 28:24]
      node _T_29 = or(_T_27, UInt<10>("h00")) @[bsram.scala 28:24]
      node _T_30 = bits(_T_29, 9, 0) @[bsram.scala 28:24]
      read mport _T_31 = mem[_T_30], clock @[bsram.scala 28:24]
      skip @[bsram.scala 28:24]
    io.readData <= _T_31 @[bsram.scala 28:13]
    
  module mem_interface : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip read : UInt<1>, flip write : UInt<1>, flip address : UInt<20>, flip in_data : UInt<32>, valid : UInt<1>, ready : UInt<1>, out_address : UInt<20>, out_data : UInt<32>}
    
    inst bsram0 of bsram @[mem_interface.scala 25:21]
    bsram0.clock <= clock
    bsram0.reset <= reset
    bsram0.io.clock <= io.clock @[mem_interface.scala 26:25]
    bsram0.io.reset <= io.reset @[mem_interface.scala 27:25]
    bsram0.io.readAddress <= io.address @[mem_interface.scala 28:25]
    bsram0.io.readEnable <= io.read @[mem_interface.scala 29:25]
    bsram0.io.writeEnable <= io.write @[mem_interface.scala 30:25]
    bsram0.io.writeAddress <= io.address @[mem_interface.scala 31:25]
    bsram0.io.writeData <= io.in_data @[mem_interface.scala 32:25]
    io.out_data <= bsram0.io.readData @[mem_interface.scala 34:25]
    node _T_26 = eq(io.read, UInt<1>("h01")) @[mem_interface.scala 37:17]
    when _T_26 : @[mem_interface.scala 37:26]
      io.out_address <= io.address @[mem_interface.scala 38:20]
      skip @[mem_interface.scala 37:26]
    else : @[mem_interface.scala 39:16]
      io.out_address <= UInt<1>("h00") @[mem_interface.scala 40:20]
      skip @[mem_interface.scala 39:16]
    node _T_29 = eq(io.read, UInt<1>("h01")) @[mem_interface.scala 43:17]
    node _T_31 = eq(io.write, UInt<1>("h01")) @[mem_interface.scala 43:37]
    node _T_32 = or(_T_29, _T_31) @[mem_interface.scala 43:25]
    when _T_32 : @[mem_interface.scala 43:46]
      io.valid <= UInt<1>("h01") @[mem_interface.scala 44:14]
      io.ready <= UInt<1>("h00") @[mem_interface.scala 45:14]
      skip @[mem_interface.scala 43:46]
    else : @[mem_interface.scala 46:16]
      io.valid <= UInt<1>("h00") @[mem_interface.scala 47:14]
      io.ready <= UInt<1>("h01") @[mem_interface.scala 48:14]
      skip @[mem_interface.scala 46:16]
    
  module memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip load : UInt<1>, flip store : UInt<1>, flip address : UInt<20>, flip store_data : UInt<32>, load_data : UInt<32>, data_address : UInt<20>, valid : UInt<1>, ready : UInt<1>}
    
    inst mem_interface0 of mem_interface @[memory.scala 26:29]
    mem_interface0.clock <= clock
    mem_interface0.reset <= reset
    mem_interface0.io.clock <= io.clock @[memory.scala 27:31]
    mem_interface0.io.reset <= io.reset @[memory.scala 28:31]
    mem_interface0.io.read <= io.load @[memory.scala 29:31]
    mem_interface0.io.write <= io.store @[memory.scala 30:31]
    mem_interface0.io.address <= io.address @[memory.scala 31:31]
    mem_interface0.io.in_data <= io.store_data @[memory.scala 32:31]
    io.valid <= mem_interface0.io.valid @[memory.scala 34:17]
    io.ready <= mem_interface0.io.ready @[memory.scala 35:17]
    io.data_address <= mem_interface0.io.out_address @[memory.scala 36:17]
    io.load_data <= mem_interface0.io.out_data @[memory.scala 37:17]
    
