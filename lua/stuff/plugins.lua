local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "solid" }
    end,
  },
}


return require('packer').startup(function()
  use "wbthomason/packer.nvim"

  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup()
    end
  }

  use 'tpope/vim-obsession'
  use 'moll/vim-bbye'
  use 'justinmk/vim-sneak'

  -- UI
  use { 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', commit = "2e5d92e" }

  -- explorer / fuzzy finder
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- colorschemes
  use 'lnhrnndz/xresources-nvim'
  use 'lunarvim/darkplus.nvim'
  use 'morhetz/gruvbox'

  -- highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-context', requires = 'nvim-treesitter/nvim-treesitter' }

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'f3fora/cmp-spell'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- language specific
  use 'ap/vim-css-color'
  use 'elkowar/yuck.vim'

  -- markdown
  use 'jakewvincent/mkdnflow.nvim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = 'markdown' }
end)
