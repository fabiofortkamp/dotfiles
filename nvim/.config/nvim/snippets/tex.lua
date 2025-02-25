
-- stolen from https://ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

--
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function() return not tex_utils.in_mathzone() end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env "equation"
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env "itemize"
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env "tikzpicture"
end

return {
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({ trig = ";a", snippetType = "autosnippet" }, {
    t "\\alpha",
  }),
  s({ trig = ";b", snippetType = "autosnippet" }, {
    t "\\beta",
  }),
  s({ trig = ";g", snippetType = "autosnippet" }, {
    t "\\gamma",
  }),
  s(
    { trig = "eq", dscr = "Expands 'eq' into an equation environment" },
    fmta(
      [[
    \begin{equation*}
        <>
    \end{equation*}
  ]],
      { i(1) }
    )
  ),
  s(
    {trig = "tt", dscr = "Expands 'tt' into a texttt environment",},
    fmta("\\texttt{<>}", { d(1, get_visual) })
),
  s({
    trig = "tii",
    dscr = "Expands 'tii' into a textit environment",},
    -- fmta call for the \texttt snippet
    fmta("\\textit{<>}", { d(1, get_visual) })
  ),
  s(
    { trig = "env", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s(
    { trig = "([^%a])mm", wordTrig = false, regTrig = true },
    fmta("<>$<>$", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    })
  ),
  s(
    { trig = "([^%a])ee", regTrig = true, wordTrig = false },
    fmta("<>e^{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    })
  ),
  s(
    { trig = "ff" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone } -- `condition` option passed in the snippet `opts` table
  ),
  -- A fun zero subscript snippet
  s(
    { trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      t "0",
    })
  ),
  s(
    { trig = "h1", dscr = "Top-level section" },
    fmta([[\section{<>}]], { i(1) }),
    { condition = line_begin } -- set condition in the `opts` table
  ),

  s(
    { trig = "new", dscr = "A generic new environmennt" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "sd", snippetType = "autosnippet", wordTrig = false },
    fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
    { condition = tex_utils.in_mathzone }
  ),
}

