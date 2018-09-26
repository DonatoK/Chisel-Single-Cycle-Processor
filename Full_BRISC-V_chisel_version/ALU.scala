// BRISC-V single cycle ALU in chisel
//

package BRISCV

import chisel3._
import chisel3.util.Cat

class ALU extends Module {
  val io = IO(new Bundle {
    val ALU_Control = Input(UInt(6.W))
    val operand_A   = Input(UInt(32.W))
    val operand_B   = Input(UInt(32.W))
    val zero        = Output(UInt(1.W))
    val branch      = Output(UInt(1.W))
    val ALU_Result  = Output(UInt(32.W))
  })
    
  val shift_amount = io.operand_B(4,0)
   
  io.zero   := (io.ALU_Result === 0.U).asUInt
  io.branch := ((io.ALU_Control(4,3) === 0x2.U) & (io.ALU_Result === 0x1.U)).asUInt

//  io.ALU_Result := 0.U
  when (io.ALU_Control === 0x00.U ) {
    io.ALU_Result := io.operand_A + io.operand_B 
  } .elsewhen (io.ALU_Control === 0x08.U ) {
    io.ALU_Result := io.operand_A - io.operand_B
  } .elsewhen (io.ALU_Control === 0x04.U ) {
     io.ALU_Result:= io.operand_A ^ io.operand_B
  } .elsewhen (io.ALU_Control === 0x06.U ) {
     io.ALU_Result:= io.operand_A | io.operand_B
  } .elsewhen (io.ALU_Control === 0x07.U ) {
     io.ALU_Result:= io.operand_A & io.operand_B
  } .elsewhen (io.ALU_Control === 0x02.U ) {
     io.ALU_Result:= io.operand_A < io.operand_B  //less than
  } .elsewhen (io.ALU_Control === 0x03.U) {
     io.ALU_Result:= io.operand_A < io.operand_B // less than
  } .elsewhen (io.ALU_Control === 0x01.U) {
     io.ALU_Result:= io.operand_A << shift_amount // probably undefined should be a shift
  } .elsewhen (io.ALU_Control === 0x05.U) {
    io.ALU_Result:= io.operand_A >> shift_amount
  } .elsewhen (io.ALU_Control === 0x0d.U) {
    io.ALU_Result:= io.operand_A >> shift_amount
  } .elsewhen (io.ALU_Control === 0x1f.U) {
     io.ALU_Result:= io.operand_A + 4.U
  } .elsewhen (io.ALU_Control === 0x10.U) {
     io.ALU_Result:= io.operand_A === io.operand_B
  } .elsewhen (io.ALU_Control === 0x11.U) {
     io.ALU_Result:= io.operand_A =/= io.operand_B
  } .elsewhen (io.ALU_Control === 0x14.U) {
     io.ALU_Result:= io.operand_A < io.operand_B
  } .elsewhen (io.ALU_Control === 0x15.U) {
    io.ALU_Result:= io.operand_A >= io.operand_B
  } .elsewhen (io.ALU_Control === 0x16.U) {
     io.ALU_Result:= io.operand_A < io.operand_B
  } .elsewhen (io.ALU_Control === 0x17.U) {
     io.ALU_Result:= io.operand_A >= io.operand_B
  } .otherwise {
     io.ALU_Result := 0.U
  }
  

}
    






