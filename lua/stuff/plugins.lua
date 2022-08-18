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
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup()
    end
  }

  use 'tpope/vim-obsession'

  use 'justinmk/vim-sneak'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'lnhrnndz/xresources-nvim'
  use 'lunarvim/darkplus.nvim'
  use 'morhetz/gruvbox'

  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'moll/vim-bbye'

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'neovim/nvim-lspconfig'

  use 'williamboman/nvim-lsp-installer'

  use 'elkowar/yuck.vim'


  use 'jakewvincent/mkdnflow.nvim'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = 'markdown' }


  use 'ap/vim-css-color'
end)
