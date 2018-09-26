// BRISC-V single cycle memory in chisel
//
  package BRISCV
  import chisel3._
  import chisel3.util.Cat


object main  extends App {

 chisel3.Driver.emitVerilog(new memory)
}

  
class memory extends Module {
  val io =  IO(new Bundle {
    val clock        = Input(UInt(1.W))
    val reset        = Input(UInt(1.W))
    val load         = Input(UInt(1.W))
    val store        = Input(UInt(1.W))
    val address      = Input(UInt(20.W))
    val store_data   = Input(UInt(32.W))
    val load_data    = Output(UInt(32.W))
    val data_address = Output(UInt(20.W))
    val valid        = Output(UInt(1.W))
    val ready        = Output(UInt(1.W))
  })
// add mem_interface
val mem_interface0 = Module (new mem_interface())
mem_interface0.io.clock       := io.clock
mem_interface0.io.reset       := io.reset
mem_interface0.io.read        := io.load
mem_interface0.io.write       := io.store
mem_interface0.io.address     := io.address
mem_interface0.io.in_data     := io.store_data

io.valid        := mem_interface0.io.valid
io.ready        := mem_interface0.io.ready 
io.data_address := mem_interface0.io.out_address
io.load_data    := mem_interface0.io.out_data

}
