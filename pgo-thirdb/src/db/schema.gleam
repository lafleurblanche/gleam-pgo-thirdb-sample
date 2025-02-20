pub type ThirdB072 {
  ThirdB072(id: Int, sta_code: String, sta_name: String)
}

pub type ThirdB073 {
  ThirdB073(id: Int, sta_code: String, sta_name: String)
}

pub type ThirdB074 {
  ThirdB074(id: Int, from_sta_code: String, sta_code: String, sta_name: String)
}

pub fn from_tuple_thirdb072(tup: #(Int, String, String)) {
  ThirdB072(tup.0, tup.1, tup.2)
}

pub fn from_tuple_thirdb073(tup: #(Int, String, String)) {
  ThirdB073(tup.0, tup.1, tup.2)
}

pub fn from_tuple_thirdb074(tup: #(Int, String, String, String)) {
  ThirdB074(tup.0, tup.1, tup.2, tup.3)
}
