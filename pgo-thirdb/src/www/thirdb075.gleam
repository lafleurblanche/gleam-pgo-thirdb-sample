import db/schema.{type ThirdB075}

import gleam/int
import gleam/list

import lustre/attribute.{attribute}
import lustre/element.{text}
import lustre/element/html.{html}

import sketch
import sketch/lustre as sketch_lustre
import sketch/options as sketch_options
import sketch/size.{px}

fn table_style() {
  [sketch.padding(px(10)), sketch.color("blue"), sketch.border("")]
  |> sketch.class()
  |> sketch.to_lustre()
}

pub fn render(thirdb075list: List(ThirdB075)) {
  // Create sketch cache
  let assert Ok(cache) =
    sketch_options.node()
    |> sketch_lustre.setup()

  sketch.prepare(cache)

  // Create table content
  let table_items =
    thirdb075list
    |> list.map(fn(b075) {
      html.tr([], [
        html.th([attribute("scope", "row")], [text(b075.id |> int.to_string)]),
        html.td([], [text(b075.from_sta_code)]),
        html.td([], [text(b075.sta_code)]),
        html.td([], [text(b075.sta_name)]),
      ])
    })

  // Create HTML tree as base
  html([attribute("lang", "ja")], [
    html.head([], [
      html.meta([attribute("charset", "utf-8")]),
      html.body([], [
        html.div([], [
          // Insert table content
          table_items
          |> table,
        ]),
      ]),
    ]),
  ])
  // Render to String(SSR)
  |> sketch_lustre.ssr(cache)
  |> element.to_string_builder
}

/// Create table HTML as base
fn table(items) {
  html.table([table_style()], [
    html.thead([], [
      html.tr([], [
        html.th([attribute("scope", "col")], [text("ID")]),
        html.th([attribute("scope", "col")], [text("FromStaCode")]),
        html.th([attribute("scope", "col")], [text("StaCode")]),
        html.th([attribute("scope", "col")], [text("StaName")]),
      ]),
    ]),
    html.tbody([], items),
  ])
}
