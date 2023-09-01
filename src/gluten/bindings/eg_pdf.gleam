import gleam/erlang/process.{Pid}

@external(erlang, "eg_pdf", "new")
pub fn new() -> Pid

@external(erlang, "eg_pdf", "set_page")
pub fn set_page(pid: Pid, page_no: Int) -> Int

@external(erlang, "eg_pdf", "delete")
pub fn delete(pid: Pid) -> Nil

@external(erlang, "eg_pdf", "set_pagesize")
pub fn set_pagesize(pid: Pid, width: Int, height: Int) -> Nil

@external(erlang, "eg_pdf", "set_font")
pub fn set_font(pid: Pid, font_name: String, size: Int) -> Nil
