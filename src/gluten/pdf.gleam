import gleam/erlang/process.{type Pid}
import gleam/erlang/charlist
import simplifile as file
import gluten/bindings/eg_pdf
import gluten/bindings/eg_pdf_lib
import gluten/data_types.{type FontDefinition, type PageSize, type Point}

pub opaque type PDF {
  PDF(pid: Pid)
}

pub fn start_pdf() -> PDF {
  let pid = eg_pdf.new()
  PDF(pid)
}

pub fn set_current_page(pdf: PDF, current_page: Int) -> PDF {
  eg_pdf.set_page(pdf.pid, current_page)
  pdf
}

pub fn set_pagesize(pdf: PDF, page_size: PageSize) -> PDF {
  let page_dimension = data_types.get_page_dimension(page_size)
  eg_pdf.set_pagesize(pdf.pid, page_dimension.width, page_dimension.height)
  pdf
}

pub fn set_current_font(pdf: PDF, font: FontDefinition) -> PDF {
  let font_name = charlist.from_string(font.font_name)
  eg_pdf.set_font(pdf.pid, font_name, font.point_size)
  pdf
}

pub fn move_and_show(pdf: PDF, position: Point, text: String) -> PDF {
  let characters = charlist.from_string(text)
  eg_pdf_lib.move_and_show(pdf.pid, position.x, position.y, characters)
  pdf
}

pub fn export_pdf(pdf: PDF) -> BitArray {
  eg_pdf.export_pdf(pdf.pid).0
}

pub fn delete_pdf(pdf: PDF) {
  eg_pdf.delete(pdf.pid)
}

pub fn write_pdf_to_file(
  input_data: BitArray,
  uri: String,
) -> Result(Nil, file.FileError) {
  file.write_bits(uri, input_data)
}

pub fn get_string_width(
  pdf: PDF,
  font_info: FontDefinition,
  test_string: String,
) -> Int {
  let font: charlist.Charlist = charlist.from_string(font_info.font_name)
  let test_charlist: charlist.Charlist = charlist.from_string(test_string)
  eg_pdf.get_string_width(pdf.pid, font, font_info.point_size, test_charlist)
}

pub fn set_author(pdf: PDF, author: String) -> PDF {
  todo
  // Convert the author to Charlist
}

pub fn set_title(pdf: PDF, title: String) -> PDF {
  todo
}

pub fn set_subject(pdf: PDF, subject: String) -> PDF {
  todo
}

pub fn set_keywords(pdf: PDF, keywords: List(String)) -> PDF {
  todo
}
