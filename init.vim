" github.com/lnhrnndz/dotfiles

lua require("stuff")

colorscheme xresources

" special rules when in tmux session
if (empty($TMUX))
    let g:dracula_italic = 1
    set mouse=a
else
    let g:dracula_italic = 0
    set mouse=n
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
set signcolumn=yes
set cursorline
set ignorecase smartcase
set incsearch
set nohlsearch
set nowrap
set noswapfile
set updatetime=300
set nobackup
"set undodir=~/.vim/undodir
set undofile
set hidden

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


" remaps

let mapleader = " "

" nnoremap <leader>c :so $VIMRUNTIME/syntax/hitest.vim<CR>

" terminal
nnoremap ! :! 
" vnoremap ! y:! <CR>=escape(@",'/\')

" application shortcuts
map <leader>e :NvimTreeToggle<CR>
"map <leader>f :FZF<CR>

" git
nmap <leader>gs :G<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

nmap <leader>gc :GCheckout<CR>

" buffer shortcuts
nmap <leader>bb :buffers<CR>
nmap <leader>bl :ls!<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>1 :b1<CR> 
nmap <leader>2 :b2<CR> 
nmap <leader>3 :b3<CR> 
nmap <leader>4 :b4<CR> 
nmap <leader>5 :b5<CR> 
nmap <leader>6 :b6<CR> 
nmap <leader>7 :b7<CR> 
nmap <leader>8 :b8<CR> 
nmap <leader>9 :b9<CR> 
nmap <leader>0 :b
nmap <leader><TAB> <C-^>

nmap <leader>" :vsplit<CR>
nmap <leader>% :split<CR>

nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

nmap <C-h> :10winc < <CR>
nmap <C-j> :5winc - <CR>
nmap <C-k> :5winc + <CR>
nmap <C-l> :10winc > <CR>

nnoremap <leader>r :%s//gc<Left><Left><left>
nnoremap <leader>R :s//gc<Left><Left><left>

vnoremap <leader>r y:%s//gc<left><left><left><C-R>=escape(@",'/\')<CR><BS>/
vnoremap <leader>R y:s//gc<left><left><left><C-R>=escape(@",'/\')<CR><BS>/
vnoremap / y/<C-R>=escape(@",'/\')<CR><BS>

inoremap {<CR> {<CR><BS>}<Esc>O
inoremap [<CR> [<CR><BS>]<Esc>O
inoremap (<CR> (<CR><BS>)<Esc>O

nnoremap <leader>s :! shellcheck %<CR>
nnoremap <leader>S :vsplit<CR>:terminal shellcheck %<CR>

nnoremap <leader>mo :set mouse= <cr>
nnoremap <leader>mn :set mouse=n<cr>
nnoremap <leader>ma :set mouse=a<cr>