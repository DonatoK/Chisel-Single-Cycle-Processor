;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit register_file : 
  module register_file : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip wEn : UInt<1>, flip write_data : UInt<32>, flip read_sel1 : UInt<5>, flip read_sel2 : UInt<5>, flip write_sel : UInt<5>, read_data1 : UInt<32>, read_data2 : UInt<32>}
    
    reg register_file_block : UInt<32>[32], clock @[regFile.scala 28:32]
    node _T_60 = asUInt(clock) @[regFile.scala 30:15]
    node _T_62 = eq(_T_60, UInt<1>("h01")) @[regFile.scala 30:22]
    when _T_62 : @[regFile.scala 30:31]
      node _T_63 = bits(reset, 0, 0) @[regFile.scala 31:16]
      when _T_63 : @[regFile.scala 31:23]
        register_file_block[0] <= UInt<1>("h00") @[regFile.scala 32:30]
        skip @[regFile.scala 31:23]
      else : @[regFile.scala 33:18]
        node _T_65 = bits(io.wEn, 0, 0) @[regFile.scala 34:19]
        node _T_67 = neq(io.write_sel, UInt<1>("h00")) @[regFile.scala 34:43]
        node _T_68 = and(_T_65, _T_67) @[regFile.scala 34:26]
        when _T_68 : @[regFile.scala 34:53]
          register_file_block[io.write_sel] <= io.write_data @[regFile.scala 35:43]
          skip @[regFile.scala 34:53]
        else : @[regFile.scala 37:16]
          register_file_block[UInt<1>("h00")] <= UInt<1>("h00") @[regFile.scala 38:33]
          skip @[regFile.scala 37:16]
        skip @[regFile.scala 33:18]
      skip @[regFile.scala 30:31]
    io.read_data1 <= register_file_block[io.read_sel1] @[regFile.scala 43:17]
    io.read_data2 <= register_file_block[io.read_sel2] @[regFile.scala 44:17]
    
