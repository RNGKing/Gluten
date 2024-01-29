import gluten/pdf
import gluten/data_types.{type PageDimension, A4, FontDefinition, Point}
import gleam/int
import gleam/float

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
    "Height = "
    <> int.to_string(page_dimensions.height)
  let test_string: String = width_string <> " -- " <> height_string
  let label_string: String = sheet_name <> " template planning sheet-"
  let string_size: Int = pdf.get_string_width(out_pdf, font_info, test_string)
  let target_size: Int = 24
  let indent: Int = float.round(int.to_float(page_dimensions.width) *. 0.15)
  let font_size: Int =
    float.round(
      int.to_float(target_size)
      *. {
        {
          {
            int.to_float(page_dimensions.width)
            -. { 2.0 *. int.to_float(indent) }
          }
          /. int.to_float(string_size)
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
