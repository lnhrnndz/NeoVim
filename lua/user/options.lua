local options = {
	encoding = "utf-8",
	title = true,
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = false,
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
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set iskeyword+=_]]
