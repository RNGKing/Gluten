import gleam/erlang/process.{Pid}
import gleam/erlang/charlist
import gleam/erlang/file.{Reason}
import gluten/bindings/eg_pdf
import gluten/bindings/eg_pdf_lib
import gluten/data_types.{FontDefinition, PageSize, Point}

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
  eg_pdf.set_font(pdf.pid, font.font_name, font.point_size)
  pdf
}

pub fn move_and_show(pdf: PDF, position: Point, text: String) -> PDF {
  let characters = charlist.from_string(text)
  eg_pdf_lib.move_and_show(pdf.pid, position.x, position.y, characters)
  pdf
}

pub fn export_pdf(pdf: PDF) -> BitString {
  eg_pdf.export_pdf(pdf.pid).0
}

pub fn delete_pdf(pdf: PDF) {
  eg_pdf.delete(pdf.pid)
}

pub fn write_pdf_to_file(
  input_data: BitString,
  uri: String,
) -> Result(Nil, Reason) {
  file.write_bits(input_data, uri)
}
