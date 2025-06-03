import db/schema
import dotenv_gleam
import envoy
import gleam/dynamic
import gleam/io
import gleam/list
import gleam/option.{Some}
import gleam/pgo
import gleam/result

pub fn connect() -> pgo.Connection {
  // .env ファイルのロード
  dotenv_gleam.config_with(".env")

  // 環境変数の取得
  let assert Ok(host) = envoy.get("DBHOST")
  let assert Ok(user) = envoy.get("DBUSER")
  let assert Ok(password) = envoy.get("DBPASSWD")
  let assert Ok(database) = envoy.get("DBNAME")

  // デバッグ用（確認のため）
  io.debug(host)
  io.debug(user)
  io.debug(password)
  io.debug(database)

  // コネクション作成
  pgo.connect(
    pgo.Config(
      ..pgo.default_config(),
      user: user,
      password: Some(password),
      host: host,
      database: database,
      pool_size: 15,
      port: 64_350,
      ssl: False,
      // コネクションプールを設定
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

pub fn get_all_thirdb075(db) {
  let sql = "select id, from_sta_code, sta_code, sta_name from thirdb_thb075"

  let return_type =
    dynamic.tuple4(dynamic.int, dynamic.string, dynamic.string, dynamic.string)

  use resp <- result.try(pgo.execute(sql, db, [], return_type))
  resp.rows
  |> list.map(schema.from_tuple_thirdb075)
  |> Ok
}
