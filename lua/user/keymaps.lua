local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- MISC
-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)
-- discount you complete me
keymap("i", "{<CR>", "{<CR><BS>}<ESC>O", opts)
keymap("i", "[<CR>", "[<CR><BS>]<ESC>O", opts)
keymap("i", "(<CR>", "(<CR><BS>)<ESC>O", opts)
-- mouse off / only in normal mode / always
keymap("n", "<leader>mo", ":set mouse=<CR>", opts)
keymap("n", "<leader>mn", ":set mouse=n<CR>", opts)
keymap("n", "<leader>ma", ":set mouse=a<CR>", opts)

-- NAVIGATION
-- Better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bb", ":buffers<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)
keymap("n", "<leader>1", ":b1<CR>", opts)
keymap("n", "<leader>2", ":b2<CR>", opts)
keymap("n", "<leader>3", ":b3<CR>", opts)
keymap("n", "<leader>4", ":b4<CR>", opts)
keymap("n", "<leader>5", ":b5<CR>", opts)
keymap("n", "<leader>6", ":b6<CR>", opts)
keymap("n", "<leader>7", ":b7<CR>", opts)
keymap("n", "<leader>8", ":b8<CR>", opts)
keymap("n", "<leader>9", ":b9<CR>", opts)
keymap("n", "<leader>0", ":b", opts)

keymap("n", "<leader>%", ":split<CR>", opts)
keymap("n", "<leader>\"", ":vsplit<CR>", opts)

-- TEXT MANIPULATION
-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- Don't yank visually selected text when pasting
keymap("v", "p", '"_dP', opts)
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- search and replace
keymap("n", "<leader>r", ":%s//gc<left><left><left>", opts)
keymap("n", "<leader>R", ":s//gc<left><left><left>", opts)

-- TERMINAL ?
keymap("n", "!", ":! ", opts)
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- PLUGINS
-- NerdTree
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", opts)
-- git
keymap("n", "<leader>gs", ":G<CR>", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)
-- VimWiki

-- SCRIPTS AND SUCH
keymap("n", "<leader>s", ":! shellcheck %<CR>", opts)
keymap("n", "<leader>S", ":vsplit<CR>:terminal shellcheck %<CR>", opts)
