local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local jsts = {
  s({
    trig = "cl",
    namr = "Console Log",
    dscr = "Log to console",
  }, {
    t("console.log("),
    i(1),
    t(");"),
  }),
  s({
    trig = "tc",
    namr = "Try Catch",
    dscr = "Try catch block",
  }, {
    t({ "try {", "  " }),
    i(1),
    t({ "", "} catch (error) {", "  " }),
    i(2, ""),
    t({ "", "}" }),
  }),
  s({
    trig = "iiafe",
    namr = "Immediately Invoked Async Function Expression",
    dscr = "Async IIFE pattern",
  }, {
    t({ "(async () => {" }),
    t({ "", "  " }),
    i(1),
    t({ "", "})();" }),
  }),
  s({
    trig = "af",
    namr = "Arrow Function",
    dscr = "Create an arrow function",
  }, {
    t("("),
    i(1),
    t(") => {"),
    t({ "", "  " }),
    i(2),
    t({ "", "}" }),
  }),
  s({
    trig = "aaf",
    namr = "Async Arrow Function",
    dscr = "Create an async arrow function",
  }, {
    t("async ("),
    i(1),
    t(") => {"),
    t({ "", "  " }),
    i(2),
    t({ "", "}" }),
  }),
  s({
    trig = "fn",
    namr = "Function Declaration",
    dscr = "Create a function declaration",
  }, {
    t("function "),
    i(1),
    t("("),
    i(2),
    t({ ") {", "  " }),
    i(3),
    t({ "", "}" }),
  })
}

ls.add_snippets(nil, {
  javascript = jsts,
  typescript = jsts,
})
