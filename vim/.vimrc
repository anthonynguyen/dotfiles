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
let g:NERDTreeWinSize=45
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_smart_startup_focus=2

let g:bufferline_show_bufnr=1
let g:bufferline_echo=0

if (&filetype == 'gitcommit')
    autocmd VimEnter * NERDTreeTabsClose
endif


nmap \t :NERDTreeTabsToggle<CR>
nmap \l :setlocal numer!<CR>
nmap \p :set paste!<CR>

nmap j gj
nmap k gk
nmap <Down> gj
nmap <Up> gk

nmap \q :nohlsearch<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-q> :Bclose<CR>

set incsearch
set ignorecase
set smartcase
set hlsearch

