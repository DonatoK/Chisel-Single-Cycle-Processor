// BRISC-V single cycle writeback in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat

object main  extends App {

 chisel3.Driver.emitVerilog(new writeback) //<:  new BRISC_V_Core)
}


class writeback extends Module {
  val io = IO(new Bundle {
    val clock       = Input(UInt(1.W))
    val reset       = Input(UInt(1.W))
    val opWrite     = Input(UInt(1.W))
    val opSel       = Input(UInt(1.W))
    val opReg       = Input(UInt(5.W))
    val ALU_Result  = Input(UInt(32.W))
    val memory_data = Input(UInt(32.W))
    val write       = Output(UInt(1.W)) 
    val write_reg   = Output(UInt(5.W))
    val write_data  = Output(UInt(32.W))
  })
  
  io.write_reg  := io.opReg
  io.write      := io.opWrite
  
  when  (io.opSel === 1.U){
    io.write_data := io.memory_data
  } .otherwise {
    io.write_data := io.ALU_Result
  }

}
