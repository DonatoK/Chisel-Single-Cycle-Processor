// BRISC-V single cycle Bsram in chisel
//

package BRISCV
import chisel3._
import chisel3.util.Cat
import chisel3.util.Decoupled



class bsram extends Module {
  val io = IO (new Bundle {
    val clock        = Input(UInt(1.W))
    val reset        = Input(UInt(1.W))
    val readAddress  = Input(UInt(20.W))
    val readEnable   = Input(UInt(1.W))
    val writeEnable  = Input(UInt(1.W))
    val writeAddress = Input(UInt(20.W))
    val writeData    = Input(UInt(32.W))
//    val readData     = Flipped(Decoupled(UInt(32.W)))
    val readData     = Output(UInt(32.W))
  })

val width:Int = 32  
val mem = SyncReadMem(1024, UInt(width.W))
// Create one write port and one read port.
mem.write(io.writeAddress, io.writeData)
io.readData := mem.read(io.readAddress, io.readEnable.toBool)
}
