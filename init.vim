" github.com/lnhrnndz/dotfiles

lua require("stuff")

colorscheme xresources

" special rules when in tmux session
if (empty($TMUX))
    let g:dracula_italic = 1
else
    let g:dracula_italic = 0
endif

"autocmd VimEnter * GitGutter
"autocmd BufWritePost * GitGutter
"let g:gitgutter_sign_allow_clobber = 0

let $FZF_DEFAULT_OPTS='--reverse'
let g:vimwiki_list = [{'path': '~/wikis',
            \'links_space_char': '-',
            \'syntax': 'markdown', 'ext': '.md'}]


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
set iskeyword-=_

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" hybrid relative numbers
set number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,WinLeave   * if &nu | set nornu | endif
augroup END
au CmdLineEnter * set norelativenumber | redraw
au CmdlineLeave * if (match("NvimTree",&filetype)) | set relativenumber | redraw | endif



"" statusline
"function! GitBranch()
"    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"function! StatuslineGit()
"    let l:branchname = GitBranch()
"    return strlen(l:branchname) > 0?' '.l:branchname.' ':''
"endfunction
"
"let g:modeMap={
"            \ 'n'      : 'NORMAL',
"            \ 'i'      : 'INSERT',
"            \ 'R'      : 'REPLACE',
"            \ 'v'      : 'VISUAL',
"            \ 'V'      : 'VISUAL LINE',
"            \ "\<C-V>" : 'VISUAL BLOCK',
"            \ 'c'      : 'COMMAND',
"            \ 't'      : 'TERMINAL',
"            \ 's'      : 'SELECT',
"            \ 'r'      : 'REPLACE'
"            \}
"
"set laststatus=2
"
"set statusline=%#TermCursor#
"set statusline+=%#TermCursor#\ %{g:modeMap[mode()]}\ %#TermCursor#
"set statusline+=%#DiffChange#%{StatuslineGit()}
"set statusline+=%#ColorColumn#\ \[%n\]\ %t\ %m%r
"set statusline+=%=%<
"set statusline+=\ %y
"set statusline+=\ %#StatusLine#
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ \[%{&fileformat}\]
"set statusline+=\ %#TermCursor#
"set statusline+=\ %p%%\ %l:%c
"set statusline+=\ 


" KEYMAPS

let mapleader = " "

inoremap kj <Esc>
nnoremap ! :! 

" NAVIGATION

" better window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" resize with arrow keys
nmap <C-Up> :10winc < <CR>
nmap <C-Down> :5winc - <CR>
nmap <C-Left> :5winc + <CR>
nmap <C-Right> :10winc > <CR>
" navigate buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <leader>bb :buffers<CR>
nnoremap <leader>bd :bd<CR>
nmap <leader><TAB> <C-^>
" tmux-like pane splitting
nmap <leader>" :vsplit<CR>
nmap <leader>% :split<CR>


" TEXT MANIPULATION

" move text up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
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
map <leader>e :NvimTreeToggle<CR>
"map <leader>f :FZF<CR>
" git
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gc :GCheckout<CR>


" MISC

nnoremap <leader>s :! shellcheck %<CR>
nnoremap <leader>S :vsplit<CR>:terminal shellcheck %<CR>

nnoremap <leader>mo :set mouse= <cr>
nnoremap <leader>mn :set mouse=n<cr>
nnoremap <leader>ma :set mouse=a<cr>

inoremap [<CR> [<CR><BS>]<Esc>O
inoremap (<CR> (<CR><BS>)<Esc>O
inoremap {<CR> {<CR><BS>}<Esc>O

"nnoremap <leader>c :so $VIMRUNTIME/syntax/hitest.vim<CR>
