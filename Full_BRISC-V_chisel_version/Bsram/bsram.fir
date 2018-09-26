;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit bsram : 
  module bsram : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip readAddress : UInt<20>, flip readEnable : UInt<1>, flip writeEnable : UInt<1>, flip writeAddress : UInt<20>, flip writeData : UInt<32>, readData : UInt<32>}
    
    smem mem : UInt<32>[1024] @[bsram.scala 29:22]
    node _T_23 = bits(io.writeAddress, 9, 0)
    write mport _T_24 = mem[_T_23], clock
    _T_24 <= io.writeData
    node _T_25 = bits(io.readEnable, 0, 0) @[bsram.scala 32:55]
    wire _T_27 : UInt @[bsram.scala 32:24]
    _T_27 is invalid @[bsram.scala 32:24]
    when _T_25 : @[bsram.scala 32:24]
      _T_27 <= io.readAddress @[bsram.scala 32:24]
      node _T_29 = or(_T_27, UInt<10>("h00")) @[bsram.scala 32:24]
      node _T_30 = bits(_T_29, 9, 0) @[bsram.scala 32:24]
      read mport _T_31 = mem[_T_30], clock @[bsram.scala 32:24]
      skip @[bsram.scala 32:24]
    io.readData <= _T_31 @[bsram.scala 32:13]
    
