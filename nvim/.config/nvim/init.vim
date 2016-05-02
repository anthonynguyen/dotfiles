set autoindent
set tabstop=4
set softtabstop=4
"set colorcolumn=80
set expandtab
set nu
syntax on
command W w

set incsearch
set ignorecase
set smartcase
set hlsearch

nmap \q :nohlsearch<CR>

nmap j gj
nmap k gk

nmap <C-s> :w<CR>
nmap <C-w> :q<CR>

nmap <S-Left> :bprev<CR>
nmap <S-Right> :bnext<CR>

execute pathogen#infect()

let g:bufferline_show_bufnr=1
let g:bufferline_echo=0

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'bufferline' ] ],
  \ },
  \ 'component': {
  \ 'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
  \ }
  \ }
