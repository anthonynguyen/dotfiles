set autoindent
set tabstop=4
set softtabstop=4
set colorcolumn=80
set expandtab
set nu
syntax on
command W w

execute pathogen#infect()
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize=40
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_smart_startup_focus=2

let g:bufferline_show_bufnr=1
let g:bufferline_echo=0

nmap \t :NERDTreeTabsToggle<CR>
nmap \l :setlocal number!<CR>
nmap \p :set paste!<CR>

if (&filetype == 'gitcommit')
    autocmd VimEnter * NERDTreeTabsClose
endif

nmap j gj
nmap k gk
nmap <Down> gj
nmap <Up> gk

nmap \q :nohlsearch<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-q> :q<CR>

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

nmap <C-Left> <C-W><C-H>
nmap <C-Down> <C-W><C-J>
nmap <C-Up> <C-W><C-K>
nmap <C-Right> <C-W><C-L>

set splitbelow
set splitright

set incsearch
set ignorecase
set smartcase
set hlsearch

