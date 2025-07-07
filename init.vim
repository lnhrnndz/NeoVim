" github.com/lnhrnndz/dotfiles

lua require("stuff")

colorscheme ayu

" OPTIONS "
" ------- "

set title
set splitbelow splitright
set tabstop=4 softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set visualbell
set termguicolors
set encoding=utf-8
set noerrorbells
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set cursorline
set ignorecase smartcase
set incsearch
set nohlsearch
set nowrap
set noswapfile
set nobackup
set undofile
set hidden
set mouse=niv
set updatetime=300
"set iskeyword-=_
set conceallevel=0
set noshowmode


" AUTOCOMANDS "
" ----------- "

set number
augroup hybrid_line_numbers
  autocmd!
  autocmd BufEnter,FocusGained,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,WinLeave   * if &nu | set nornu | endif
augroup end
au CmdLineEnter *.* set norelativenumber | redraw
au CmdlineLeave *.* set relativenumber | redraw
"au CmdlineLeave * if (match("NvimTree",&filetype)) | set relativenumber | redraw | endif

augroup no_auto_comments
  autocmd!
  autocmd BufWinEnter * :set formatoptions-=cro
augroup end

augroup easyquit
  autocmd!
  autocmd FileType git,fugitive,fugitiveblame,qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
augroup end

augroup spellcheck
  autocmd!
  autocmd BufWinEnter *.md setlocal spell
  "autocmd BufWinEnter *.txt setlocal spell
  autocmd BufWinEnter *.tex setlocal spell
augroup end

"augroup wrapping
"  autocmd!
"  autocmd FileType markdown setlocal wrap
"  autocmd FileType text setlocal wrap
"  autocmd FileType latex setlocal wrap
"augroup end

augroup git
  autocmd!
  autocmd FileType gitcommit setlocal wrap
  autocmd FileType gitcommit setlocal spell
augroup end

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup end

augroup expand_tab
  autocmd!
  autocmd FileType lua setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType yaml setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType haskell setlocal expandtab
augroup end

"autocmd User SneakLeave highlight clear Sneak


" KEYMAPS "
" ------- "

let mapleader = " "

nnoremap ! :! 

" NAVIGATION

" better window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" resize with arrow keys
nmap <silent> <C-Up> :5winc + <CR>
nmap <silent> <C-Down> :5winc - <CR>
nmap <silent> <C-Left> :5winc < <CR>
nmap <silent> <C-Right> :5winc > <CR>
" navigate buffers
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprevious<CR>
nnoremap <silent> <leader>bb :buffers<CR>
nnoremap <silent> <leader>bd :bd<CR>
nmap <leader><TAB> <C-^>
" tmux-like pane splitting
nmap <silent> <leader>" :vsplit<CR>
nmap <silent> <leader>% :split<CR>


" TEXT MANIPULATION

" move text up and down
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
" same thing but don't format
nnoremap <silent> <S-A-j> :m .+1<CR>
nnoremap <silent> <S-A-k> :m .-2<CR>
inoremap <silent> <A-j> <Esc>:m .+1<CR>
inoremap <silent> <A-k> <Esc>:m .-2<CR>
vnoremap <silent> <A-j> :m '>+1<CR>gv
vnoremap <silent> <A-k> :m '<-2<CR>gv
" move text left or right
nnoremap <A-h> 2h<<
nnoremap <A-l> >>2l
inoremap <A-h> <Esc>2h<<a
inoremap <A-l> <Esc>>>2la
vnoremap <A-h> <2<left>gv
vnoremap <A-l> >2<right>gv
" search and replace
nnoremap <leader>r :%s//gc<Left><Left><Left>
nnoremap <leader>R :s//gc<Left><Left><Left>


" PLUGINS

" explorer
nmap <silent> <leader>e :NvimTreeToggle<CR>
"map <silent> <leader>f :FZF<CR>
" git
nnoremap <silent> <leader>lg :lua _LAZYGIT_TOGGLE()<CR>
nmap <silent> <leader>gs :G<CR>
nmap <silent> <leader>gp :Git push<CR>
nmap <silent> <leader>gl :Git log --branches --graph --pretty=format:'%C(yellow)%h%Creset %s%C(auto)%d'<CR>
nmap <silent> <leader>gL :Git log --branches --graph --decorate<CR>
nmap <silent> <leader>gh :GcLog<CR>
nmap <silent> <leader>gb :Git blame<CR>
nmap <silent> <leader>gd :Git difftool<CR>
nmap <silent> <leader>gm :Git mergetool<CR>
"nmap <silent> <leader>gl :diffget //3<CR>
"nmap <silent> <leader>gh :diffget //2<CR>
nmap <silent> <leader>gc :GCheckout<CR>
" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader><leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader><leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader><leader>fb <cmd>Telescope buffers hidden=true<cr>
nnoremap <leader><leader>fh <cmd>Telescope help_tags hidden=true<cr>
nnoremap <leader>tg :Telescope git
" mkdmflow
nnoremap <leader>ft :MkdnTableFormat<CR>

" MISC

nnoremap <leader><leader><leader><leader> :set scrolloff=

nnoremap <leader>sc :! shellcheck %<CR>
nnoremap <leader>sC :vsplit<CR>:terminal shellcheck %<CR>

nnoremap <leader>mm :set mouse? <cr>
nnoremap <leader>mo :set mouse= <cr>
nnoremap <leader>mn :set mouse=n<cr>
nnoremap <leader>ma :set mouse=a<cr>

noremap <F4> :set hlsearch! hlsearch?<CR>

nnoremap <leader>s :setlocal spell!<CR>
nnoremap <leader>sp :setlocal spell!<CR>

" discount auto pairs
"inoremap [<CR> [<CR><BS>]<Esc>O
"inoremap (<CR> (<CR><BS>)<Esc>O
"inoremap {<CR> {<CR><BS>}<Esc>O

nnoremap <leader>ch :so $VIMRUNTIME/syntax/hitest.vim<CR>

nnoremap <leader>cb :hi Normal guibg=NONE ctermbg=NONE<CR>:hi SignColumn guibg=NONE ctermbg=NONE<CR>
