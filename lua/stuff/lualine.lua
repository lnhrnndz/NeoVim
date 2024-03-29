local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
		section_separators = '',
		component_separators = '',
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', icons_enabled = false}},
    lualine_c = {
    {
      'diff',
      colored = true, -- Displays a colored diff status if set to true
      diff_color = {
        -- Same color values as the general color option can be used here.
        added = 'DiffAdd',  -- Changes the diff's added color
        modified = 'DiffChange', -- Changes the diff's modified color
        removed  = 'DiffDelete', -- Changes the diff's removed color you
      },
      symbols = {added = ' +', modified = ' ~', removed = ' -'}, -- Changes the symbols used by the diff.
      source = nil, -- A function that works as a data source for diff.
      -- It must return a table as such:
      --   { added = add_count, modified = modified_count, removed = removed_count }
      -- or nil on failure. count <= 0 won't be displayed.
      padding = { left = 0, right = 1 }
    },
    {
      'diagnostics',

      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { 'nvim_lsp' },

      -- Displays diagnostics for the defined severity types
      sections = { 'error', 'warn', 'info' },

      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'DiagnosticError', -- Changes diagnostics' error color.
        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
      },
      symbols = {error = 'E', warn = '!', hint = 'i', info = '?' },
      colored = true,       -- Displays diagnostics status in color if set to true.
      update_in_insert = false, -- Update diagnostics in insert mode.
      always_visible = false,   -- Show diagnostics even if there are none.
    },
    {
      'filename',
      file_status = true,    -- Displays file status (readonly status, modified status)
      path = 0,        -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory

      shorting_target = 40,  -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      symbols = {
        modified = ' [+]',    -- Text to show when the file is modified.
        readonly = ' [-]',    -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
      }
    }
  },
  lualine_x = {'encoding', 'fileformat', 'filetype'},
  lualine_y = {'progress'},
  --lualine_z = {'location'}
  lualine_z = {'location'}
  },
  inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'location'},
  lualine_y = {},
  lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
