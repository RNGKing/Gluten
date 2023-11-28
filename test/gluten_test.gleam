import gleeunit
import gleeunit/should
import gluten/pdf
import gluten/data_types.{type PageDimension, A4, FontDefinition, Point}
import gleam/erlang/file
import gleam/io
//import gleam/atom
import gleam/string
import gluten/bindings/eg_pdf_op
import gleam/int
import gleam/float

pub fn main() {
  gleeunit.main()
}

pub fn test_setup_test() {
  //todo
  // creates the output dir if it doesn't exist
  case file.recursive_delete("test\\output") {
    Ok(_) -> file.make_directory("test\\output")
    Error(err) -> {
      io.println("We failed to delete")
      Ok(Nil)
    }
  }
}

pub fn first_program_test() {
  // create pdf
  let out_pdf =
    pdf.start_pdf()
    |> pdf.set_current_page(1)
    |> pdf.set_current_font(FontDefinition(
      font_name: "Victorias-Secret",
      point_size: 40,
    ))
    |> pdf.move_and_show(Point(x: 50, y: 700), "Hello Joe from Gutenburg!")
  let file_write_result =
    pdf.export_pdf(out_pdf)
    |> pdf.write_pdf_to_file("test\\output\\test_one.pdf")
  pdf.delete_pdf(out_pdf)
  should.be_ok(file_write_result)
}

pub fn planning_sheet_test() {
  let sheet_name: String = "a4"
  let font_info = FontDefinition(font_name: "Times-Roman", point_size: 36)
  let out_pdf =
    pdf.start_pdf()
    |> pdf.set_pagesize(A4)
    |> pdf.set_current_page(1)
  let page_dimensions: PageDimension = data_types.get_page_dimension(A4)
  let width_string: String = "Width = " <> int.to_string(page_dimensions.width)
  let height_string: String =
    "Height = " <> int.to_string(page_dimensions.height)
  let test_string: String = width_string <> " -- " <> height_string
  let label_string: String = sheet_name <> " template planning sheet-"
  let string_size: Int = pdf.get_string_width(out_pdf, font_info, test_string)
  let target_size: Int = 24
  let indent: Int = float.round(int.to_float(page_dimensions.width) *. 0.15)
  let font_size: Int =
    float.round(
      int.to_float(target_size) *. {
        {
          {
            int.to_float(page_dimensions.width) -. {
              2.0 *. int.to_float(indent)
            }
          } /. int.to_float(string_size)
        }
      },
    )
  pdf.set_current_font(
    out_pdf,
    FontDefinition(font_name: "Times-Roman", point_size: font_size),
  )
  let base = float.round(int.to_float(page_dimensions.height) *. 0.71)
  pdf.move_and_show(out_pdf, Point(indent, base), label_string)
  pdf.move_and_show(
    out_pdf,
    Point(indent, base - { font_size + 4 }),
    test_string,
  )
}
