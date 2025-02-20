import db/schema
import gleam/dynamic
import gleam/list
import gleam/option.{Some}
import gleam/pgo
import gleam/result

pub fn connect(
  host host: String,
  port port: Int,
  user user: String,
  password password: String,
  database database: String,
) {
  pgo.connect(
    pgo.Config(
      ..pgo.default_config(),
      port: port,
      user: user,
      password: Some(password),
      host: host,
      database: database,
      pool_size: 15,
    ),
  )
}

pub fn get_all_thirdb072(db) {
  let sql = "select id, sta_code, sta_name from thirdb_thb072"

  let return_type = dynamic.tuple3(dynamic.int, dynamic.string, dynamic.string)

  use resp <- result.try(pgo.execute(sql, db, [], return_type))
  resp.rows
  |> list.map(schema.from_tuple_thirdb072)
  |> Ok
}

pub fn get_all_thirdb073(db) {
  let sql = "select id, sta_code, sta_name from thirdb_thb073"

  let return_type = dynamic.tuple3(dynamic.int, dynamic.string, dynamic.string)

  use resp <- result.try(pgo.execute(sql, db, [], return_type))
  resp.rows
  |> list.map(schema.from_tuple_thirdb073)
  |> Ok
}

pub fn get_all_thirdb074(db) {
  let sql = "select id, from_sta_code, sta_code, sta_name from thirdb_thb074"

  let return_type =
    dynamic.tuple4(dynamic.int, dynamic.string, dynamic.string, dynamic.string)

  use resp <- result.try(pgo.execute(sql, db, [], return_type))
  resp.rows
  |> list.map(schema.from_tuple_thirdb074)
  |> Ok
}
