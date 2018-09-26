;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit writeback : 
  module writeback : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip opWrite : UInt<1>, flip opSel : UInt<1>, flip opReg : UInt<5>, flip ALU_Result : UInt<32>, flip memory_data : UInt<32>, write : UInt<1>, write_reg : UInt<5>, write_data : UInt<32>}
    
    io.write_reg <= io.opReg @[writeback.scala 28:17]
    io.write <= io.opWrite @[writeback.scala 29:17]
    node _T_26 = eq(io.opSel, UInt<1>("h01")) @[writeback.scala 31:19]
    when _T_26 : @[writeback.scala 31:27]
      io.write_data <= io.memory_data @[writeback.scala 32:19]
      skip @[writeback.scala 31:27]
    else : @[writeback.scala 33:16]
      io.write_data <= io.ALU_Result @[writeback.scala 34:19]
      skip @[writeback.scala 33:16]
    
