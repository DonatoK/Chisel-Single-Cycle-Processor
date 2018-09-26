;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit mem_interface : 
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
    
    inst bsram0 of bsram @[mem_interface.scala 29:21]
    bsram0.clock <= clock
    bsram0.reset <= reset
    bsram0.io.clock <= io.clock @[mem_interface.scala 30:25]
    bsram0.io.reset <= io.reset @[mem_interface.scala 31:25]
    bsram0.io.readAddress <= io.address @[mem_interface.scala 32:25]
    bsram0.io.readEnable <= io.read @[mem_interface.scala 33:25]
    bsram0.io.writeEnable <= io.write @[mem_interface.scala 34:25]
    bsram0.io.writeAddress <= io.address @[mem_interface.scala 35:25]
    bsram0.io.writeData <= io.in_data @[mem_interface.scala 36:25]
    io.out_data <= bsram0.io.readData @[mem_interface.scala 38:25]
    node _T_26 = eq(io.read, UInt<1>("h01")) @[mem_interface.scala 41:17]
    when _T_26 : @[mem_interface.scala 41:26]
      io.out_address <= io.address @[mem_interface.scala 42:20]
      skip @[mem_interface.scala 41:26]
    else : @[mem_interface.scala 43:16]
      io.out_address <= UInt<1>("h00") @[mem_interface.scala 44:20]
      skip @[mem_interface.scala 43:16]
    node _T_29 = eq(io.read, UInt<1>("h01")) @[mem_interface.scala 47:17]
    node _T_31 = eq(io.write, UInt<1>("h01")) @[mem_interface.scala 47:37]
    node _T_32 = or(_T_29, _T_31) @[mem_interface.scala 47:25]
    when _T_32 : @[mem_interface.scala 47:46]
      io.valid <= UInt<1>("h01") @[mem_interface.scala 48:14]
      io.ready <= UInt<1>("h00") @[mem_interface.scala 49:14]
      skip @[mem_interface.scala 47:46]
    else : @[mem_interface.scala 50:16]
      io.valid <= UInt<1>("h00") @[mem_interface.scala 51:14]
      io.ready <= UInt<1>("h01") @[mem_interface.scala 52:14]
      skip @[mem_interface.scala 50:16]
    
