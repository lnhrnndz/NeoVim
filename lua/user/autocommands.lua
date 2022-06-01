vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType fugitive,qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  augroup end

  " hybrid relative line numbers
  set number
  augroup _hybrid_rnu
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,WinLeave   * if &nu | set nornu | endif
  augroup end
  au CmdLineEnter * set norelativenumber | redraw
  au CmdlineLeave * if (match("NvimTree",&filetype)) | set relativenumber | redraw | endif

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
  augroup END

  autocmd User SneakLeave highlight clear Sneak
]]

-- Spellcheck for certain files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
