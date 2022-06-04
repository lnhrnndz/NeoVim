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
                added    = 'DiffAdd',    -- Changes the diff's added color
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
        { 'diagnostics' },
        { 'filename' },
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
