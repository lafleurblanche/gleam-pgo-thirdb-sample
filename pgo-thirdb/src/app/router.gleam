import db/client
import dotenv_gleam
import envoy
import gleam/http.{Get, Post}
import gleam/io
import gleam/string_builder
import wisp.{type Request, type Response}
import www/index

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home_page(req)

    ["comments"] -> comments(req)

    _ -> wisp.not_found()
  }
}

fn home_page(req: Request) -> Response {
  use <- wisp.require_method(req, Get)
  dotenv_gleam.config_with(".env")

  let assert Ok(host) = envoy.get("DBHOST")
  let assert Ok(user) = envoy.get("DBUSER")
  let assert Ok(password) = envoy.get("DBPASSWD")
  let assert Ok(database) = envoy.get("DBNAME")
  io.debug(host)
  io.debug(user)

  let third_b072 =
    client.connect(
      host: host,
      port: 64_350,
      user: user,
      password: password,
      database: database,
    )
    |> client.get_all_thirdb072()

  case third_b072 {
    Ok(third_b072) -> {
      let html = index.render(third_b072)

      wisp.ok()
      |> wisp.html_body(html)
    }
    Error(_) -> {
      let html = string_builder.from_string("Cant connect to DB")

      wisp.ok()
      |> wisp.html_body(html)
    }
  }
}

fn comments(req: Request) -> Response {
  // This handler for `/comments` can respond to both GET and POST requests,
  // so we pattern match on the method here.
  case req.method {
    Get -> list_comments()
    _ -> wisp.method_not_allowed([Get, Post])
  }
}

fn list_comments() -> Response {
  // In a later example we'll show how to read from a database.
  let html = string_builder.from_string("Comments!")
  wisp.ok()
  |> wisp.html_body(html)
}
