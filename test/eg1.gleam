import gleeunit
import gleeunit/should
import gluten/pdf
import gluten/data_types
import gleam/io
import gluten/data_types

pub fn main() {
  gleeunit.main()
}

pub fn eg1_test() {
  io.debug("Begin Test")
  let pdf = pdf.start_pdf()
  pdf.set_pagesize()
  io.debug("End Test")
}
