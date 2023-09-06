import gleeunit
import gleeunit/should
import gluten/pdf
import gluten/data_types.{FontDefinition, Point}
import gleam/erlang/file
import gleam/io

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

fn pdf_validation(
  test_pdf_uri: String,
  truth_pdf_uri: String,
) -> Result(Nil, String) {
  let test_bits = file.read_bits(test_pdf_uri)
  let truth_bits = file.read_bits(truth_pdf_uri)
  case test_bits == truth_bits {
    True -> Ok(Nil)
    False -> Error("The two pdfs do not match")
  }
}
