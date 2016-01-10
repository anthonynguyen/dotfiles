set autoindent
set tabstop=4
set softtabstop=4
set colorcolumn=80
set expandtab
set nu
syntax on
command W w

set t_Co=256

nmap \l :setlocal number!<CR>
nmap \p :set paste!<CR>

nmap j gj
nmap k gk
nmap <Down> gj
nmap <Up> gk

nmap \q :nohlsearch<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap zz ZZ
nmap zq ZQ

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

nmap <C-Left> <C-W><C-H>
nmap <C-Down> <C-W><C-J>
nmap <C-Up> <C-W><C-K>
nmap <C-Right> <C-W><C-L>

set fillchars+=vert:\ 

set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch

execute pathogen#infect()
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize=36
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_smart_startup_focus=2

nmap \t :NERDTreeTabsToggle<CR>

if (&filetype == 'gitcommit')
    autocmd VimEnter * NERDTreeTabsClose
endif

let g:bufferline_show_bufnr=1
let g:bufferline_echo=0

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_theme="murmur"
