import gleam/erlang/process.{type Pid}
import gleam/erlang/charlist
import gleam/erlang/atom.{type Atom}

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

@external(erlang, "eg_pdf", "set_author")
pub fn set_author(pid: Pid, author: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "set_title")
pub fn set_title(pid: Pid, title: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "set_subject")
pub fn set_subject(pid: Pid, subject: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "set_date")
pub fn set_date(pid: Pid, year: Int, month: Int, day: Int) -> Nil

@external(erlang, "eg_pdf", "set_keywords")
pub fn set_keywords(pid: Pid, keywords: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "set_pag")
pub fn new_page(pid: Pid) -> Int

@external(erlang, "eg_pdf", "ensure_font_gets_loaded")
pub fn ensure_font_gets_loaded(pid: Pid, font_name: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "begin_text")
pub fn begin_text(pid: Pid) -> Nil

@external(erlang, "eg_pdf", "end_text")
pub fn end_text(pid: Pid) -> Nil

@external(erlang, "eg_pdf", "break_text")
pub fn break_text(pid: Pid) -> Nil

@external(erlang, "eg_pdf", "text")
pub fn text(pid: Pid, text: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "textbr")
pub fn text_break(pid: Pid, text: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "kernedtext")
pub fn kerned_text(pid: Pid, text: charlist.Charlist) -> Nil

@external(erlang, "eg_pdf", "set_text_pos")
pub fn set_text_position(pid: Pid, x: Int, y: Int) -> Nil

@external(erlang, "eg_pdf", "set_text_loading")
pub fn set_text_loading(pid: Pid, l: Int) -> Nil

@external(erlang, "eg_pdf", "set_text_rendering")
pub fn set_text_rendering(pid: Pid, mode: Atom) -> Nil

@external(erlang, "eg_pdf", "set_char_space")
pub fn set_char_space(pid: Pid, char_space: Int) -> Nil

@external(erlang, "eg_pdf", "set_word_space")
pub fn set_word_space(pid: Pid, word_space: Int) -> Nil
