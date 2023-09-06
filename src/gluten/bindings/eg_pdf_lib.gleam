import gleam/erlang/process.{Pid}
import gleam/erlang/charlist

@external(erlang, "eg_pdf_lib", "moveAndShow")
pub fn move_and_show(pid: Pid, x: Int, y: Int, text: charlist.Charlist) -> Nil
