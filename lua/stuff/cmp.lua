local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- TODO: fix icons
--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

vim.g.cmptoggle = true

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  enabled = function()
    return vim.g.cmptoggle
  end,
  mapping = {
    --["<C-k>"] = cmp.mapping.select_prev_item(),
    --["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-1),
    ["<C-f>"] = cmp.mapping.scroll_docs(1),
    ["<C-s>"] = cmp.mapping.complete(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        spell = "[Spell]",
        --cmp_tabnine = "[tab9]",
      })[entry.source.name]
      return vim_item
    end,
  },
  completion = {
    keyword_length = 4
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
    --{ name = "cmp_tabnine" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      border = "single"
      --border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
    --{ name = "spell" , keyword_length = 5, max_item_count = 2 },
  })
})

vim.keymap.set("n", "<leader>tc", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
