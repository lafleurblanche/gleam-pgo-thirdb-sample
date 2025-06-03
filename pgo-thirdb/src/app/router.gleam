import db/client
import gleam/http.{Get, Post}
import gleam/string_builder
import wisp.{type Request, type Response}
import www/index
import www/thirdb073
import www/thirdb074
import www/thirdb075

pub fn handle_request(req: Request) -> Response {
  case wisp.path_segments(req) {
    [] -> home_page(req)
    ["third-b073"] -> third_b073(req)
    ["third-b074"] -> third_b074(req)
    ["third-b075"] -> third_b075(req)

    ["comments"] -> comments(req)

    _ -> wisp.not_found()
  }
}

fn home_page(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let db = client.connect()
  let third_b072 = client.get_all_thirdb072(db)

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

fn third_b073(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let db = client.connect()
  let third_b073 = client.get_all_thirdb073(db)

  case third_b073 {
    Ok(third_b073) -> {
      let html = thirdb073.render(third_b073)

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

fn third_b074(req: Request) -> Response {
  use <- wisp.require_method(req, Get)

  let db = client.connect()
  let third_b074 = client.get_all_thirdb074(db)

  case third_b074 {
    Ok(third_b074) -> {
      let html = thirdb074.render(third_b074)

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

fn third_b075(req: Request) -> Response {
  use <- wisp.require_method(req, Get)
  let db = client.connect()
  let third_b075 = client.get_all_thirdb075(db)

  case third_b075 {
    Ok(third_b075) -> {
      let html = thirdb075.render(third_b075)

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
