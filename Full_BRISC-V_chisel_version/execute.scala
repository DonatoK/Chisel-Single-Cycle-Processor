//BRISC-V single cycle execute in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat

class execute extends Module {
  val io = IO(new Bundle { 
    val clock         = Input(UInt(1.W))
    val reset         = Input(UInt(1.W))
    val ALU_Operation = Input(UInt(3.W))
    val funct3        = Input(UInt(3.W))
    val funct7        = Input(UInt(7.W))
    val PC            = Input(UInt(20.W))
    val ALU_ASrc      = Input(UInt(2.W))
    val ALU_BSrc      = Input(UInt(1.W))
    val branch_op     = Input(UInt(1.W))
    val regRead1      = Input(UInt(32.W))
    val regRead2      = Input(UInt(32.W))
    val extend        = Input(UInt(32.W))
    val ALU_Result    = Output(UInt(32.W))
    val zero          = Output(UInt(1.W))
    val branch        = Output(UInt(1.W))
    val JALR_target   = Output(UInt(20.W))
  })
  
  val ALU_Control = UInt(6.W)
  val ALU_branch  = UInt(1.W)
  val operand_A   = UInt(32.W)
  val operand_B   = UInt(32.W)
  
  when  (io.ALU_Operation === "b011".asUInt(3.W)){
    ALU_Control := "b011111".asUInt(6.W) // pass for JAL and JALR
  } . elsewhen (io.ALU_Operation === "b010".asUInt(3.W)){
    ALU_Control := Cat(io.ALU_Operation, io.funct3) // branches
    // R type instructions
  } .elsewhen ((io.ALU_Operation === "b000".asUInt(3.W)) & (io.funct7 === "b0000000".asUInt(7.W))){
    ALU_Control := Cat(io.ALU_Operation, io.funct3) 
  } .elsewhen ((io.ALU_Operation === "b000".asUInt(3.W)) & (io.funct7 === "b0100000".asUInt(7.W))){
    ALU_Control := Cat("b001".asUInt(3.W), io.funct3)
  } .elsewhen (io.ALU_Operation === "b000".asUInt(3.W)){
    ALU_Control := Cat(io.ALU_Operation, io.funct3)
    // I type instructions
  } .elsewhen ((io.ALU_Operation === "b001".asUInt(3.W)) & (io.funct7 === "b0000000".asUInt(7.W))& io.funct3 === "b101".asUInt(3.W)){
    ALU_Control := Cat("b000".asUInt(3.W), io.funct3)
  } .elsewhen ((io.ALU_Operation === "b001".asUInt(3.W)) & (io.funct7 === "b0100000".asUInt(7.W))& io.funct3 === "b101".asUInt(3.W)){
    ALU_Control := Cat("b001".asUInt(3.W), io.funct3)
  } .elsewhen  ((io.ALU_Operation === "b001".asUInt(3.W)) & (io.funct3 === "b101".asUInt(3.W))){
    ALU_Control := Cat("b000".asUInt(3.W), io.funct3)
  } .elsewhen (io.ALU_Operation === "b001".asUInt(3.W)){
    ALU_Control := Cat("b000".asUInt(3.W), io.funct3)
  } .otherwise {
    ALU_Control := "b000000".asUInt(6.W) //adds
  } 
//operand A
  when (io.ALU_ASrc === "b01".asUInt(2.W)){
    operand_A := io.PC
  } .elsewhen (io.ALU_ASrc === "b10".asUInt(2.W)){
    operand_A := io.PC + 4.U
  } .otherwise {
    operand_A := io.regRead1
  }
//operand B
  when (io.ALU_BSrc === "b01".asUInt(2.W)){
    operand_B := io.extend
  } .otherwise {
    operand_B := io.regRead2
  }
// branch
  when (ALU_branch.toBool && io.branch_op.toBool ){
    io.branch := 1.U
  } .otherwise {
    io.branch := 0.U
  }

  val ALU0 = Module (new ALU())
    ALU0.io.ALU_Control := ALU_Control
    ALU0.io.operand_A   := operand_A
    ALU0.io.operand_B   := operand_B
    ALU0.io.zero        := io.zero
    ALU0.io.branch      := ALU_branch
    ALU0.io.ALU_Result  := io.ALU_Result

io.JALR_target := ((io.regRead1 + io.extend) & "hhfffffffe".asUInt(32.W))
}      
