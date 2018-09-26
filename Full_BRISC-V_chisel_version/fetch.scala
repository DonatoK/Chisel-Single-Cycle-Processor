// BRISC-V single cycle Fetch in chisel
//

package BRISCV

import chisel3._
import chisel3.util.Cat

class fetch extends Module {
  val io = IO(new Bundle {
     val clock           = Input(UInt(1.W))
     val reset           = Input(UInt(1.W))
     val start           = Input(UInt(1.W)) 
     val PC_select       = Input(UInt(2.W)) 
     val program_address = Input(UInt(20.W))
     val JAL_target      = Input(UInt(20.W))
     val JALR_target     = Input(UInt(20.W))
     val branch          = Input(UInt(1.W))
     val branch_target   = Input(UInt(20.W))
     
     val instruction     = Output(UInt(32.W)) 
     val inst_PC         = Output(UInt(20.W))
     val valid           = Output(UInt(1.W))
     val ready           = Output(UInt(1.W))
  })

  val old_PC = RegInit(0.U(32.W))
  val fetch  = RegInit(0.U(1.W))
  val PC_reg = RegInit(0.U(32.W))
  val out_addr = UInt(32.W)
  val instruction_address  = UInt(32.W)
  val PC_plus4 = UInt(20.W)
  val PC       = UInt(20.W)

// add mem_interface
val mem_interface0 = Module (new mem_interface())
mem_interface0.io.clock       := io.clock
mem_interface0.io.reset       := io.reset 
mem_interface0.io.read        := fetch
mem_interface0.io.write       := 0.U
mem_interface0.io.address     := instruction_address 
mem_interface0.io.in_data      := 0.U

mem_interface0.io.valid       := io.valid
mem_interface0.io.ready       := io.ready
mem_interface0.io.out_address := out_addr
mem_interface0.io.out_data    := io.instruction
  
  when(reset.toBool){
    PC := io.program_address
  } .otherwise {
    PC := PC_reg
  }

  when (reset.toBool) {
    fetch  := 0.U
    PC_reg := 0.U
    old_PC := 0.U
  } .elsewhen (io.start.toBool){
    fetch  := 1.U
    PC_reg := io.program_address
    old_PC := 0.U
  } .otherwise {
    fetch  := 0.U
    old_PC := PC_reg
    when (io.PC_select === "b10".asUInt(2.W)){
      PC_reg := io.JAL_target
    } .elsewhen (io.PC_select === "b11".asUInt(2.W)){
      PC_reg := io.JALR_target
    } .elsewhen (io.PC_select === "b01".asUInt(2.W) && io.branch.toBool){
      PC_reg := io.branch_target
    } .otherwise {
      PC_reg := PC_plus4
    }
  }
  io.inst_PC := out_addr << 2
  instruction_address := PC >> 2
  PC_plus4 := PC+4.U
}




