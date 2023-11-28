import gleam/erlang/process.{type Pid}
import gleam/erlang/charlist

//import gleam/atom.{Atom}

@external(erlang, "eg_pdf_lib", "moveAndShow")
pub fn move_and_show(pid: Pid, x: Int, y: Int, text: charlist.Charlist) -> Nil
//@external(erlang, "eg_pdf_lib", "showGrid")
//pub fn show_grid(pid: Pid, size: Atom) -> Nil
