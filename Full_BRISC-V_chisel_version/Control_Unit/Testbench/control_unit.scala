// BRISC-V single cycle Control_unit in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat

object main  extends App {

 //chisel3.Driver.emitVerilog(new control_unit) //<:  new BRISC_V_Core)
 chisel3.testers.TesterDriver(new ControlUnitTests)

}

class control_unit extends Module {
  val io = IO(new Bundle {
    val clock         = Input(UInt(1.W))
    val reset         = Input(UInt(1.W))
    val opcode        = Input(UInt(7.W))
    val branch_op     = Output(UInt(1.W))
    val memRead       = Output(UInt(1.W))
    val memtoReg      = Output(UInt(1.W))
    val ALUOp         = Output(UInt(3.W))
    val next_PC_sel   = Output(UInt(2.W))
    val operand_A_sel = Output(UInt(2.W))
    val operand_B_sel = Output(UInt(1.W))
    val extend_sel    = Output(UInt(2.W))
    val memWrite      = Output(UInt(1.W))
    val regWrite      = Output(UInt(1.W))
  })

  val R_TYPE  = "b0110011".asUInt(7.W)
  val I_TYPE  = "b0010011".asUInt(7.W)
  val STORE   = "b0100011".asUInt(7.W)
  val LOAD    = "b0000011".asUInt(7.W)
  val BRANCH  = "b1100011".asUInt(7.W)
  val JALR    = "b1100111".asUInt(7.W)
  val JAL     = "b1101111".asUInt(7.W)
  val AUIPC   = "b0010111".asUInt(7.W)
  val LUI     = "b0110111".asUInt(7.W)
  val FENCES  = "b0001111".asUInt(7.W)
  val SYSCALL = "b1110011".asUInt(7.W)

  when ((io.opcode === R_TYPE) || (io.opcode === I_TYPE) || (io.opcode === LOAD)
        || (io.opcode === JALR) || (io.opcode === JAL) || (io.opcode === AUIPC) 
        || (io.opcode === LUI))  {
     io.regWrite := 1.U
  } .otherwise{
     io.regWrite := 0.U 
  }

  when (io.opcode === STORE){
     io.memWrite := 1.U
  } .otherwise{
     io.memWrite := 0.U
  }

  when (io.opcode === BRANCH){
    io.branch_op := 1.U
  } .otherwise{
    io.branch_op := 0.U
  }

  when (io.opcode === LOAD){
    io.memRead := 1.U
  } .otherwise{
    io.memRead := 0.U
  }

  when (io.opcode === LOAD){
    io.memtoReg := 1.U
  } .otherwise{
    io.memtoReg := 0.U
  }

  when (io.opcode === R_TYPE){
    io.ALUOp := "b000".asUInt(3.W)
  } .elsewhen (io.opcode === I_TYPE){
    io.ALUOp :=  "b001".asUInt(3.W) 
  } .elsewhen (io.opcode === STORE){
    io.ALUOp := "b101".asUInt(3.W)
  } .elsewhen (io.opcode === LOAD){
    io.ALUOp := "b100".asUInt(3.W)
  } .elsewhen (io.opcode === BRANCH){
    io.ALUOp := "b010".asUInt(3.W)
  } .elsewhen ((io.opcode === JALR)  || (io.opcode === JAL)){
    io.ALUOp := "b011".asUInt(3.W) 
  } .elsewhen ((io.opcode === AUIPC) || (io.opcode === LUI)){
    io.ALUOp := "b110".asUInt(3.W) 
  } .otherwise {
    io.ALUOp := "b000".asUInt(3.W)
  }

  when (io.opcode === AUIPC){
    io.operand_A_sel :="b01".asUInt(2.W) 
  } .elsewhen (io.opcode === LUI){
    io.operand_A_sel :="b11".asUInt(2.W)
  } .elsewhen ((io.opcode === JALR)  || (io.opcode === JAL)){
    io.operand_A_sel :="b10".asUInt(2.W)
  } .otherwise {
    io.operand_A_sel :="b00".asUInt(2.W) 
  }

  when  ((io.opcode === I_TYPE) || (io.opcode === STORE)|| 
         (io.opcode === LOAD) || (io.opcode === AUIPC) || 
         (io.opcode === LUI)){
    io.operand_B_sel := 1.U 
  } .otherwise {
    io.operand_B_sel := 0.U
  }

  when ((io.opcode === I_TYPE)  || (io.opcode === LOAD)){
    io.extend_sel := "b00".asUInt(2.W) 
  } .elsewhen  (io.opcode === STORE) {
    io.extend_sel := "b01".asUInt(2.W)
  } .elsewhen ((io.opcode === AUIPC) | (io.opcode === LUI)){
    io.extend_sel := "b10".asUInt(2.W)
  } .otherwise {
    io.extend_sel := "b10".asUInt(2.W)
  }

  when (io.opcode === BRANCH) {
    io.next_PC_sel := "b01".asUInt(2.W)
  } .elsewhen  (io.opcode === JAL) {
    io.next_PC_sel := "b10".asUInt(2.W)
  } .elsewhen (io.opcode === JALR) {
    io.next_PC_sel := "b11".asUInt(2.W)
  } .otherwise {
     io.next_PC_sel := "b00".asUInt(2.W)
  }

  class ControlUnitTests(c:control_unit)
    extends Tester(c) {
  val test_opcodes = 0x33
  
    poke(c.io.opcode,     test_opcodes)
    poke(c.io.reset, 1)
    step(1)
    expect(c.io.branch_op, (0))
    expect(c.io.memRead, (0))
    expect(c.io.memtoReg, (0))
    expect(c.io.ALUOp, ("b000".asUInt(3.W)))
    expect(c.io.next_PC_sel, ("b00".asUInt(2.W)))
    expect(c.io.operand_A_sel, ("b00".asUInt(2.W)))
    expect(c.io.operand_B_sel, (0))
    expect(c.io.extend_sel, ("b00".asUInt(2.W)))
    expect(c.io.memWrite, (0))
    expect(c.io.regWrite, (1))
  }
}


