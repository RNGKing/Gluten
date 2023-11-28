pub type Point {
  Point(x: Int, y: Int)
}

pub type PageSize {
  A0
  A1
  A2
  A3
  A4
  A5
  A6
  A7
  A8
  A9
  B0
  B1
  B2
  B3
  B4
  B5
  B6
  B7
  B8
  B9
  B10
  C5E
  COMM10E
  DLE
  EXECUTIVE
  FOLIO
  LEDGER
  LEGAL
  LETTER
  TABLOID
}

pub type PageDimension {
  PageDimension(width: Int, height: Int)
}

pub type FontDefinition {
  FontDefinition(font_name: String, point_size: Int)
}

fn create_page_dimension(width: Int, height: Int) -> PageDimension {
  PageDimension(width: width, height: height)
}

pub fn get_page_dimension(page_size: PageSize) -> PageDimension {
  case page_size {
    A0 -> create_page_dimension(2380, 3368)
    A1 -> create_page_dimension(1684, 2380)
    A2 -> create_page_dimension(1190, 1684)
    A3 -> create_page_dimension(842, 1190)
    A4 -> create_page_dimension(595, 842)
    A5 -> create_page_dimension(421, 595)
    A6 -> create_page_dimension(297, 421)
    A7 -> create_page_dimension(210, 297)
    A8 -> create_page_dimension(148, 210)
    A9 -> create_page_dimension(105, 148)
    B0 -> create_page_dimension(2836, 4008)
    B1 -> create_page_dimension(2004, 2836)
    B2 -> create_page_dimension(1418, 2004)
    B3 -> create_page_dimension(1002, 1418)
    B4 -> create_page_dimension(709, 1002)
    B5 -> create_page_dimension(501, 709)
    B6 -> create_page_dimension(355, 501)
    B7 -> create_page_dimension(250, 355)
    B8 -> create_page_dimension(178, 250)
    B9 -> create_page_dimension(125, 178)
    B10 -> create_page_dimension(89, 125)
    C5E -> create_page_dimension(462, 649)
    COMM10E -> create_page_dimension(298, 683)
    DLE -> create_page_dimension(312, 624)
    EXECUTIVE -> create_page_dimension(542, 720)
    FOLIO -> create_page_dimension(595, 935)
    LEDGER -> create_page_dimension(1224, 792)
    LEGAL -> create_page_dimension(612, 1008)
    LETTER -> create_page_dimension(612, 792)
    TABLOID -> create_page_dimension(792, 1224)
  }
}
