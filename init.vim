" github.com/lnhrnndz/dotfiles

lua require("stuff")

colorscheme xresources

" special rules when in tmux session
if (empty($TMUX))
    let g:dracula_italic = 1
else
    let g:dracula_italic = 0
endif

let $FZF_DEFAULT_OPTS='--reverse'
let g:vimwiki_list = [{'path': '~/wikis',
            \'links_space_char': '-',
            \'syntax': 'markdown', 'ext': '.md'}]


" OPTIONS "
" ------- "

set title
set splitbelow splitright
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
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
    autocmd FileType fugitive,qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
augroup end

augroup spellcheck
    autocmd!
    autocmd BufWinEnter *.md setlocal spell
    autocmd BufWinEnter *.txt setlocal spell
    autocmd BufWinEnter *.tex setlocal spell
augroup end

"augroup wrapping
"    autocmd!
"    autocmd FileType markdown setlocal wrap
"    autocmd FileType text setlocal wrap
"    autocmd FileType latex setlocal wrap
"augroup end

augroup git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
augroup end

augroup html
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup end

augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
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
" move text left or right
nnoremap <A-h> <<4h
nnoremap <A-l> >>4l
inoremap <A-h> <Esc><<3hi
inoremap <A-l> <Esc>>>5li
vnoremap <A-h> <4hV
vnoremap <A-l> >4lV
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
nmap <silent> <leader>gl :diffget //3<CR>
nmap <silent> <leader>gh :diffget //2<CR>
nmap <silent> <leader>gc :GCheckout<CR>
" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" MISC

nnoremap <leader><leader><leader><leader> :set scrolloff=

nnoremap <leader>s :! shellcheck %<CR>
nnoremap <leader>S :vsplit<CR>:terminal shellcheck %<CR>

nnoremap <leader>mm :set mouse? <cr>
nnoremap <leader>mo :set mouse= <cr>
nnoremap <leader>mn :set mouse=n<cr>
nnoremap <leader>ma :set mouse=a<cr>

inoremap [<CR> [<CR><BS>]<Esc>O
inoremap (<CR> (<CR><BS>)<Esc>O
inoremap {<CR> {<CR><BS>}<Esc>O

"nnoremap <leader>c :so $VIMRUNTIME/syntax/hitest.vim<CR>
