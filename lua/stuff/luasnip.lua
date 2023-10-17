require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/stuff/snippets/"})

require("luasnip").config.set_config({
  -- Enable autotriggered snippets
  enable_autosnippets = true,
  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  -- Update repeated insert nodes simultaniously
  update_events = 'TextChanged,TextChangedI'
})

vim.cmd[[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
]]
--]]

--local ls = require("luasnip")
--local s = ls.snippet
--local sn = ls.snippet_node
--local t = ls.text_node
--local i = ls.insert_node
--local f = ls.function_node
--local d = ls.dynamic_node
--local fmt = require("luasnip.extras.fmt").fmt
--local fmta = require("luasnip.extras.fmt").fmta
--local rep = require("luasnip.extras").rep
