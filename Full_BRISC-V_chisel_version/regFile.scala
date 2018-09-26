//BRISC-V single cycle register file in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat

class register_file extends Module {
  val io = IO(new Bundle{
    val clock      = Input(UInt(1.W))
    val reset      = Input(UInt(1.W))
    val wEn        = Input(UInt(1.W))
    val write_data = Input(UInt(32.W))
    val read_sel1  = Input(UInt(5.W))
    val read_sel2  = Input(UInt(5.W))
    val write_sel  = Input(UInt(5.W))
    val read_data1 = Output(UInt(32.W))
    val read_data2 = Output(UInt(32.W))
  })
  

  val register_file_block = Reg(Vec(32, UInt(32.W)))

  when (clock.asUInt === 1.U) {
    when(reset.toBool){
      register_file_block(0) := 0.U
    } .otherwise {
      when(io.wEn.toBool && (io.write_sel =/= 0.U )){
        register_file_block(io.write_sel) := io.write_data
      }
     .otherwise{
        io.read_data1 := register_file_block(io.read_sel1)
        io.read_data2 := register_file_block(io.read_sel2)
      }
   }
}
}
