local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- Entry point.
  s(
    { trig = "main", dscr = "int main()" },
    fmta(
      [[
        int main() {
            <>
            return 0;
        }
      ]],
      { i(1) }
    ),
    { condition = line_begin }
  ),

  -- `#pragma once` is supported by every compiler we care about and cannot
  -- collide the way hand-written include guards can.
  s({ trig = "once", dscr = "#pragma once" }, t("#pragma once"), { condition = line_begin }),

  s(
    { trig = "inc", dscr = "#include <>" },
    fmta("#include <<<>>", { i(1) }),
    { condition = line_begin }
  ),

  s(
    { trig = "incl", dscr = '#include ""' },
    fmta([[#include "<>"]], { i(1) }),
    { condition = line_begin }
  ),

  -- Catch2 v3.
  s(
    { trig = "tc", dscr = "Catch2 TEST_CASE" },
    fmta(
      [[
        TEST_CASE("<>", "[<>]") {
            <>
        }
      ]],
      { i(1, "description"), i(2, "tag"), i(3) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "sec", dscr = "Catch2 SECTION" },
    fmta(
      [[
        SECTION("<>") {
            <>
        }
      ]],
      { i(1, "description"), i(2) }
    )
  ),

  -- Range-for over a const reference: the default way to iterate.
  s(
    { trig = "fore", dscr = "range-based for loop" },
    fmta(
      [[
        for (const auto& <> : <>) {
            <>
        }
      ]],
      { i(1, "item"), i(2, "container"), i(3) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "ns", dscr = "namespace" },
    fmta(
      [[
        namespace <> {

        <>

        }  // namespace <>
      ]],
      { i(1, "name"), i(2), rep(1) }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "cls", dscr = "class" },
    fmta(
      [[
        class <> {
        public:
            <>

        private:
            <>
        };
      ]],
      { i(1, "Name"), i(2), i(3) }
    ),
    { condition = line_begin }
  ),
}
