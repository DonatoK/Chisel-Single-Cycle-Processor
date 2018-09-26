//BRISC-V single cycle memory_interface in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat


class mem_interface extends Module {
  val io = IO(new Bundle {
    val clock       = Input(UInt(1.W))
    val reset       = Input(UInt(1.W))
    val read        = Input(UInt(1.W))
    val write       = Input(UInt(1.W))
    val address     = Input(UInt(20.W))
    val in_data     = Input(UInt(32.W))
    
    val valid       = Output(UInt(1.W)) 
    val ready       = Output(UInt(1.W)) 
    val out_address = Output(UInt(20.W)) 
    val out_data    = Output(UInt(32.W)) 
  })

//add BSRAM
 val bsram0 = Module(new bsram())
 bsram0.io.clock        := io.clock
 bsram0.io.reset        := io.reset
 bsram0.io.readAddress  := io.address
 bsram0.io.readEnable   := io.read
 bsram0.io.writeEnable  := io.write
 bsram0.io.writeAddress := io.address
 bsram0.io.writeData    := io.in_data

 io.out_data            :=  bsram0.io.readData   


  when (io.read === 1.U ){ 
    io.out_address := io.address
  } .otherwise {
    io.out_address := 0.U
  }

  when (io.read === 1.U || io.write === 1.U ){
    io.valid := 1.U
    io.ready := 0.U
  } .otherwise {
    io.valid := 0.U
    io.ready := 1.U
  }
}
