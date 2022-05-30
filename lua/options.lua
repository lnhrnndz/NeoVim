local options = {
	encoding = "utf-8",
	title = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	smartindent = true,
	errorbells = false,
	visualbell = true,
	termguicolors = true,
	splitbelow = true,
	splitright = true,
	scrolloff = 8,
	sidescrolloff = 8,
	signcolumn = "yes",
	cursorline = true,
	ignorecase = true,
	smartcase = true,
	incsearch = true,
	hlsearch = false,
	wrap = false,
	swapfile = false,
	undofile = true,
	hidden = true,
  updatetime = 300,
  mouse = "a",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
