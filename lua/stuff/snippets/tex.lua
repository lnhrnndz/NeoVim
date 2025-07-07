local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

s( { trig = "mm", snippetType = "autosnippet" }, { t("$"), i(1), t("$"), i(0) }),
s( { trig = "ms", snippetType = "autosnippet" }, { t("$$"), i(1), t("$$"), i(0) }),


s( { trig = "tt" }, 
  fmta(
    [[
      \text{<>}<>
    ]],
    {
      i(1), i(0)
    }
  )
),

s( { trig = "tb" }, fmta( [[\textbf{<>}<>]], { i(1), i(0) })),
s( { trig = "ti" }, fmta( [[\textit{<>}<>]], { i(1), i(0) })),
s( { trig = "bf" }, fmta( [[\textbf{<>}<>]], { i(1), i(0) })),
s( { trig = "ita" }, fmta( [[\textit{<>}<>]], { i(1), i(0) })),


s( { trig = "beg", desc = "expands 'beg' into '\\begin{}' and '\\end{}'" },
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
  )
),

s( { trig = "it", desc = "\\item" }, { t("\\item"), }),


s( { trig="//", snippetType="autosnippet" },
  fmta(
    [[
      \frac{<>}{<>}
    ]],
    {
      i(1),
      i(2),
    }
  )
),

s({ trig=",,", snippetType="autosnippet" }, { t("\\,"), }),
s({ trig=";;", snippetType="autosnippet" }, { t("\\;"), }),

s({ trig="sub" }, { t("\\subset"), }),
s({ trig="subeq" }, { t("\\subseteq"), }),

s({ trig="sub" }, fmta([[\lim_{<> \to \infty}<>]], { i(1,"n"), i(0) })),

s({ trig="ss", snippetType="autosnippet", wordTrig="false" }, fmta([[^{<>}<>]], { i(1,"n"), i(0) })),
s({ trig="sb", snippetType="autosnippet", wordTrig="false" }, fmta([[_{<>}<>]], { i(1,"n"), i(0) })),
--s({ trig=".^", snippetType="autosnippet", trigEngine="pattern" }, fmta([[^{<>}<>]], { i(1,"n"), i(0) })),
--s({ trig="ee", snippetType="autosnippet", wordTrig="false" }, fmta([[^{<>}<>]], { i(1,"n"), i(0) })),

s({ trig="NN", snippetType="autosnippet" }, { t("\\mathbb{N}"), }),
s({ trig="ZZ", snippetType="autosnippet" }, { t("\\mathbb{Z}"), }),
s({ trig="QQ", snippetType="autosnippet" }, { t("\\mathbb{Q}"), }),
s({ trig="RR", snippetType="autosnippet" }, { t("\\mathbb{R}"), }),
s({ trig="CC", snippetType="autosnippet" }, { t("\\mathbb{C}"), }),

-- quantors and stuff
s({ trig=",a", snippetType="autosnippet" }, { t("\\forall"), }), -- forAll
--s({ trig=",e", snippetType="autosnippet" }, { t("\\exists"), }),
s({ trig=",x", snippetType="autosnippet" }, { t("\\exists"), }), -- eXists
s({ trig=",e", snippetType="autosnippet" }, { t("\\in"), }), -- element of
s({ trig=",i", snippetType="autosnippet" }, { t("\\in"), }), -- in
s({ trig=",s", snippetType="autosnippet" }, { t("\\mid"), }), -- such that

-- parenthesis () [] {}
s({ trig=".r", snippetType="autosnippet" }, fmta( [[(<>)<>]], { i(1), i(0) })), -- parenthesis
s({ trig=".b", snippetType="autosnippet" }, fmta( [[[<>]<>]], { i(1), i(0) })), -- bracket
s({ trig=".c", snippetType="autosnippet" }, fmta( [[\{<>\}<>]], { i(1), i(0) })), -- curly
s({ trig=".v", snippetType="autosnippet" }, fmta( [[\langle <> \rangle<>]], { i(1), i(0) })), -- vector
s({ trig=".a", snippetType="autosnippet" }, fmta( [[| <> |<>]], { i(1), i(0) })), -- absolute
s({ trig=".n", snippetType="autosnippet" }, fmta( [[\| <> \|<>]], { i(1), i(0) })), --norm

s({ trig=".R", snippetType="autosnippet" }, fmta( [[\left( <> \right)<>]], { i(1), i(0) })),
s({ trig=".B", snippetType="autosnippet" }, fmta( [[\left[ <> \right]<>]], { i(1), i(0) })),
s({ trig=".C", snippetType="autosnippet" }, fmta( [[\left\{ <> \right\}<>]], { i(1), i(0) })),
s({ trig=".V", snippetType="autosnippet" }, fmta( [[\left\langle <> \right\rangle<>]], { i(1), i(0) })),

-- Greek letters
s({ trig=";a", snippetType="autosnippet" }, { t("\\alpha"), }),
s({ trig=";b", snippetType="autosnippet" }, { t("\\beta"), }),
s({ trig=";g", snippetType="autosnippet" }, { t("\\gamma"), }),

}
