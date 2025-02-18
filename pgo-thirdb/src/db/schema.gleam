pub type ThirdB072 {
  ThirdB072(id: Int, sta_code: String, sta_name: String)
}

pub fn from_tuple_thirdb072(tup: #(Int, String, String)) {
  ThirdB072(tup.0, tup.1, tup.2)
}
