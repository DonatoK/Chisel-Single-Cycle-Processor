//BRISC-V single cycle writeback in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat
import chisel3.util.Fill

class decode extends Module {
  val io = IO (new Bundle {
    val clock         = Input(UInt(1.W))
    val reset         = Input(UInt(1.W))
    val PC            = Input(UInt(20.W))
    val instruction   = Input(UInt(32.W))
    val extend_sel    = Input(UInt(2.W))
    val write         = Input(UInt(1.W))
    val write_reg     = Input(UInt(5.W))
    val write_data    = Input(UInt(32.W))
    
    val rs1_data      = Output(UInt(32.W))
    val rs2_data      = Output(UInt(32.W))
    val rd            = Output(UInt(5.W))
    val opcode        = Output(UInt(7.W))
    val funct7        = Output(UInt(7.W))
    val funct3        = Output(UInt(3.W))
    val extend_imm    = Output(UInt(32.W))
    val branch_target = Output(UInt(20.W))
    val JAL_target    = Output(UInt(20.W))
  })
  
  val rs1        = io.instruction(19,15)
  val rs2        = io.instruction(24,20)
  val i_imm      = io.instruction(31,20)
  val s_imm_msb  = io.instruction(31,25)
  val s_imm_lsb  = io.instruction(11,7)
  val u_imm      = io.instruction(31,12)
  val i_imm_orig = io.instruction(31,20)
  val uj_imm_32  = Cat(io.instruction(31), io.instruction(19,12), io.instruction(20), io.instruction(31,21))
 
  val s_imm_orig  = Cat(s_imm_msb, s_imm_lsb)
  val sb_imm_orig = Cat(s_imm_msb(6),s_imm_lsb(0),s_imm_msb(5,0),s_imm_lsb(4,1),"b0".asUInt(1.W))
  val sb_imm_32   = Cat(Fill(19, sb_imm_orig(12)), sb_imm_orig)
  val u_imm_32    = Cat(u_imm,"b0".asUInt(12.W))
  val i_imm_32    = Cat(Fill(20, i_imm_orig(11)), i_imm_orig(11,0))
  val s_imm_32    = Cat(Fill(20, s_imm_orig(11)), s_imm_orig)



  when(io.extend_imm === "b01".asUInt(2.W)){
    io.extend_imm := s_imm_32
  } .elsewhen (io.extend_imm === "b10".asUInt(2.W)){
     io.extend_imm := u_imm_32
  } .otherwise{
     io.extend_imm := i_imm_32
  }
  io.opcode := io.instruction(6,0)
  io.funct7 := io.instruction(31,25)
  io.funct3 := io.instruction(14,12)
  io.rd     := io.instruction(11,7)
  io.JAL_target := uj_imm_32 + io.PC

//registerfile
  val registerfile0 = Module(new register_file())
  registerfile0.io.clock      := io.clock
  registerfile0.io.reset      := io.reset
  registerfile0.io.wEn        := io.write 
  registerfile0.io.write_data := io.write_data
  registerfile0.io.read_sel1  := rs1
  registerfile0.io.read_sel2  := rs2
  registerfile0.io.write_sel  := io.write_data
  registerfile0.io.read_data1 := io.rs1_data
  registerfile0.io.read_data2 := io.rs2_data



}
