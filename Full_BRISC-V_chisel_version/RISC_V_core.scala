// BRISC-V single cycle top_level in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat

object BRISCV  extends App {
  chisel3.Driver.execute(args, () => new BRISC_V_Core)
}

class BRISC_V_Core extends Module {
  val io =IO(new Bundle {
    val clock = Input(UInt(1.W))
    val reset = Input(UInt(1.W))
    val start = Input(UInt(1.W))
    
    val register_writeback = Output(UInt(1.W))
  })

  val instruction       = UInt(32.W)
  val inst_PC           = UInt(20.W)
  val i_valid           = UInt(1.W)
  val i_ready           = UInt(1.W)
  val d_valid           = UInt(1.W)
  val d_ready           = UInt(1.W)
  val JAL_target        = UInt(20.W)
  val JALR_target       = UInt(20.W)
  val branch_target     = UInt(20.W)
  val write             = UInt(1.W)
  val write_reg         = UInt(5.W)
  val write_data        = UInt(32.W)
  val rs1_data          = UInt(32.W)
  val rs2_data          = UInt(32.W)
  val rd                = UInt(5.W)
  val opcode            = UInt(7.W)
  val funct7            = UInt(7.W)
  val funct3            = UInt(3.W)
  val memRead           = UInt(1.W)
  val memtoReg          = UInt(1.W)
  val ALUOp             = UInt(3.W)
  val branch_op         = UInt(1.W)
  val next_PC_select    = UInt(2.W)
  val operand_A_sel     = UInt(2.W)
  val operand_B_sel     = UInt(1.W)
  val extend_sel        = UInt(2.W)
  val extend_imm        = UInt(32.W)
  val memWrite          = UInt(1.W)
  val regWrite          = UInt(1.W)
  val branch            = UInt(1.W)
  val ALU_result        = UInt(32.W)
  val generated_address = UInt(20.W) 
  val ALU_branch        = UInt(1.W)
  val zero              = UInt(1.W)
  val memory_data       = UInt(32.W)
  val memory_addr       = UInt(20.W)

generated_address := ALU_result

val fetch0 = Module (new fetch())
  fetch0.io.clock           := io.clock
  fetch0.io.reset           := io.reset
  fetch0.io.start           := io.start
  fetch0.io.PC_select       := next_PC_select
  fetch0.io.program_address := 0.U 
  fetch0.io.JAL_target      := JAL_target
  fetch0.io.JALR_target     := JALR_target
  fetch0.io.branch          := branch
  fetch0.io.branch_target   := branch_target

  fetch0.io.instruction     := instruction
  fetch0.io.inst_PC         := inst_PC
  fetch0.io.valid           := i_valid
  fetch0.io.ready           := i_ready
         
val decode0 = Module (new decode())
  decode0.io.clock         := io.clock
  decode0.io.reset         := io.reset
  decode0.io.PC            := inst_PC
  decode0.io.instruction   := instruction
  decode0.io.extend_sel    := extend_sel
  decode0.io.write         := write
  decode0.io.write_reg     := write_reg
  decode0.io.write_data    := write_data
  decode0.io.rs1_data      := rs1_data
  decode0.io.rs2_data      := rs2_data
  decode0.io.rd            := rd
  decode0.io.opcode        := opcode
  decode0.io.funct7        := funct7
  decode0.io.funct3        := funct3
  decode0.io.extend_imm    := extend_imm
  decode0.io.branch_target := branch_target
  decode0.io.JAL_target    := JAL_target

val control_unit0 = Module (new control_unit())
  control_unit0.io.clock         := io.clock
  control_unit0.io.reset         := io.reset
  control_unit0.io.opcode        := opcode
  control_unit0.io.branch_op     := branch_op
  control_unit0.io.memRead       := memRead
  control_unit0.io.memtoReg      := memtoReg
  control_unit0.io.ALUOp         := ALUOp
  control_unit0.io.next_PC_sel   := next_PC_select
  control_unit0.io.operand_A_sel := operand_A_sel
  control_unit0.io.operand_B_sel := operand_B_sel
  control_unit0.io.extend_sel    := extend_sel
  control_unit0.io.memWrite      := memWrite
  control_unit0.io.regWrite      := regWrite

val execute0 = Module (new execute())
  execute0.io.clock         := io.clock
  execute0.io.reset         := io.reset
  execute0.io.ALU_Operation := ALUOp
  execute0.io.funct3        := funct3
  execute0.io.funct7        := funct7
  execute0.io.PC            := inst_PC
  execute0.io.ALU_ASrc      := operand_A_sel
  execute0.io.ALU_BSrc      := operand_B_sel
  execute0.io.branch_op     := branch_op
  execute0.io.regRead1      := rs1_data
  execute0.io.regRead2      := rs2_data
  execute0.io.extend        := extend_imm
  execute0.io.ALU_Result    := ALU_result
  execute0.io.zero          := zero
  execute0.io.branch        := branch
  execute0.io.JALR_target   := JALR_target

val memory0 = Module (new memory())
  memory0.io.clock        := io.clock
  memory0.io.reset        := io.reset
  memory0.io.load         := memRead
  memory0.io.store        := memWrite
  memory0.io.address      := generated_address
  memory0.io.store_data   := rs2_data
  memory0.io.load_data    := memory_data
  memory0.io.data_address := memory_addr
  memory0.io.valid        := d_valid
  memory0.io.ready        := d_ready

val writeback0 = Module (new writeback())
  writeback0.io.clock       := io.clock
  writeback0.io.reset       := io.reset
  writeback0.io.opWrite     := regWrite
  writeback0.io.opSel       := memRead
  writeback0.io.opReg       := rd
  writeback0.io.ALU_Result  := ALU_result
  writeback0.io.memory_data := memory_data
  writeback0.io.write       := write
  writeback0.io.write_reg   := write_reg
  writeback0.io.write_data  := write_data


}
