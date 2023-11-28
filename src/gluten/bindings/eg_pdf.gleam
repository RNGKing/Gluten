import gleam/erlang/process.{type Pid}
import gleam/erlang/charlist

@external(erlang, "eg_pdf", "new")
pub fn new() -> Pid

@external(erlang, "eg_pdf", "set_page")
pub fn set_page(pid: Pid, page_no: Int) -> Nil

@external(erlang, "eg_pdf", "delete")
pub fn delete(pid: Pid) -> Nil

@external(erlang, "eg_pdf", "set_pagesize")
pub fn set_pagesize(pid: Pid, width: Int, height: Int) -> Nil

@external(erlang, "eg_pdf", "set_font")
pub fn set_font(pid: Pid, font_name: charlist.Charlist, size: Int) -> Nil

@external(erlang, "eg_pdf", "export")
pub fn export_pdf(pid: Pid) -> #(BitArray, Int)

@external(erlang, "eg_pdf", "get_string_width")
pub fn get_string_width(
  pid: Pid,
  font: charlist.Charlist,
  font_size: Int,
  test_string: charlist.Charlist,
) -> Int
