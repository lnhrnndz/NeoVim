return {
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
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s( { trig=";a", snippetType="autosnippet" },
    {
      t("\\alpha"),
    }
  ),
  s({trig=";b", snippetType="autosnippet"},
    {
      t("\\beta"),
    }
  ),
  s({trig=";g", snippetType="autosnippet"},
    {
      t("\\gamma"),
    }
  ),

}
