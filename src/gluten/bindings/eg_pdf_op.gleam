import gleam/erlang/charlist.{type Charlist}

@external(erlang, "eg_pdf_op", "n2s")
pub fn float_to_charlist(input: Float) -> Charlist

@external(erlang, "eg_pdf_op", "n2s")
pub fn int_to_charlist(input: Float) -> Charlist

@external(erlang, "eg_pdf_op", "n2s")
pub fn int_list_to_charlist(input: List(Int)) -> Charlist

@external(erlang, "eg_pdf_op", "n2s")
pub fn float_list_to_charlist(input: List(Float)) -> Charlist
