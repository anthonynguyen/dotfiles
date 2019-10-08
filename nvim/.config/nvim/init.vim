set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"set colorcolumn=80
"highlight ColorColumn ctermbg=8 guibg=lightgrey

set number

set lazyredraw
set laststatus=2

syntax on

command W w
command Q q

set incsearch
set ignorecase
set smartcase
set hlsearch

nmap <leader>h :nohlsearch<CR>
nmap <leader>w :bd<CR>

nmap j gj
nmap k gk

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

nmap <C-N> :bprev<CR>
nmap <C-M> :bnext<CR>

