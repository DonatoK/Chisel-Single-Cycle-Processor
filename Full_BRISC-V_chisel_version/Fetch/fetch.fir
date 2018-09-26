;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit fetch : 
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
    
  module fetch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip clock : UInt<1>, flip reset : UInt<1>, flip start : UInt<1>, flip PC_select : UInt<2>, flip program_address : UInt<20>, flip JAL_target : UInt<20>, flip JALR_target : UInt<20>, flip branch : UInt<1>, flip branch_target : UInt<20>, instruction : UInt<32>, inst_PC : UInt<20>, valid : UInt<1>, ready : UInt<1>}
    
    reg old_PC : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[fetch.scala 32:23]
    reg fetch : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[fetch.scala 33:23]
    reg PC_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[fetch.scala 34:23]
    wire out_addr : UInt<32> @[fetch.scala 35:22]
    wire instruction_address : UInt<32> @[fetch.scala 36:34]
    wire PC_plus4 : UInt<20> @[fetch.scala 37:22]
    wire PC : UInt<20> @[fetch.scala 38:22]
    inst mem_interface0 of mem_interface @[fetch.scala 41:29]
    mem_interface0.clock <= clock
    mem_interface0.reset <= reset
    mem_interface0.io.clock <= io.clock @[fetch.scala 42:33]
    mem_interface0.io.reset <= io.reset @[fetch.scala 43:33]
    mem_interface0.io.read <= fetch @[fetch.scala 44:33]
    mem_interface0.io.write <= UInt<1>("h00") @[fetch.scala 45:33]
    mem_interface0.io.address <= instruction_address @[fetch.scala 46:33]
    mem_interface0.io.in_data <= UInt<1>("h00") @[fetch.scala 47:33]
    io.valid <= mem_interface0.io.valid @[fetch.scala 49:18]
    io.ready <= mem_interface0.io.ready @[fetch.scala 50:18]
    out_addr <= mem_interface0.io.out_address @[fetch.scala 51:18]
    io.instruction <= mem_interface0.io.out_data @[fetch.scala 52:18]
    node _T_43 = bits(reset, 0, 0) @[fetch.scala 59:14]
    when _T_43 : @[fetch.scala 59:21]
      PC <= io.program_address @[fetch.scala 60:8]
      skip @[fetch.scala 59:21]
    else : @[fetch.scala 61:16]
      PC <= PC_reg @[fetch.scala 62:8]
      skip @[fetch.scala 61:16]
    node _T_44 = bits(reset, 0, 0) @[fetch.scala 65:15]
    when _T_44 : @[fetch.scala 65:23]
      fetch <= UInt<1>("h00") @[fetch.scala 66:12]
      PC_reg <= UInt<1>("h00") @[fetch.scala 67:12]
      old_PC <= UInt<1>("h00") @[fetch.scala 68:12]
      skip @[fetch.scala 65:23]
    else : @[fetch.scala 69:32]
      node _T_48 = bits(io.start, 0, 0) @[fetch.scala 69:25]
      when _T_48 : @[fetch.scala 69:32]
        fetch <= UInt<1>("h01") @[fetch.scala 70:12]
        PC_reg <= io.program_address @[fetch.scala 71:12]
        old_PC <= UInt<1>("h00") @[fetch.scala 72:12]
        skip @[fetch.scala 69:32]
      else : @[fetch.scala 73:16]
        fetch <= UInt<1>("h00") @[fetch.scala 74:12]
        old_PC <= PC_reg @[fetch.scala 75:12]
        node _T_53 = eq(io.PC_select, UInt<2>("h02")) @[fetch.scala 76:24]
        when _T_53 : @[fetch.scala 76:46]
          PC_reg <= io.JAL_target @[fetch.scala 77:14]
          skip @[fetch.scala 76:46]
        else : @[fetch.scala 78:53]
          node _T_55 = eq(io.PC_select, UInt<2>("h03")) @[fetch.scala 78:31]
          when _T_55 : @[fetch.scala 78:53]
            PC_reg <= io.JALR_target @[fetch.scala 79:14]
            skip @[fetch.scala 78:53]
          else : @[fetch.scala 80:73]
            node _T_57 = eq(io.PC_select, UInt<2>("h01")) @[fetch.scala 80:31]
            node _T_58 = bits(io.branch, 0, 0) @[fetch.scala 80:66]
            node _T_59 = and(_T_57, _T_58) @[fetch.scala 80:53]
            when _T_59 : @[fetch.scala 80:73]
              PC_reg <= io.branch_target @[fetch.scala 81:14]
              skip @[fetch.scala 80:73]
            else : @[fetch.scala 82:18]
              PC_reg <= PC_plus4 @[fetch.scala 83:14]
              skip @[fetch.scala 82:18]
        skip @[fetch.scala 73:16]
    node _T_60 = shl(out_addr, 2) @[fetch.scala 86:26]
    io.inst_PC <= _T_60 @[fetch.scala 86:14]
    node _T_61 = shr(PC, 2) @[fetch.scala 87:29]
    instruction_address <= _T_61 @[fetch.scala 87:23]
    node _T_63 = add(PC, UInt<3>("h04")) @[fetch.scala 88:17]
    node _T_64 = tail(_T_63, 1) @[fetch.scala 88:17]
    PC_plus4 <= _T_64 @[fetch.scala 88:12]
    
