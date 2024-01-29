import gleeunit/should
import gluten/pdf
import gluten/data_types.{FontDefinition, Point}

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
