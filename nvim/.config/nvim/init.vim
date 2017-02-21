set autoindent
set tabstop=5
set softtabstop=4
"set colorcolumn=80
set expandtab
set number
set relativenumber
set scrolloff=30
syntax on
set hidden

command W w
command Q q

command Vsp vsp
command VSp vsp
command VSP vsp

command Sp sp
command SP sp

set incsearch
set ignorecase
set smartcase
set hlsearch

nmap \q :nohlsearch<CR>

nmap j gj
nmap k gk

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

nmap <C-N> :bprev<CR>
nmap <C-M> :bnext<CR>

" Don't disable number, so we get the current line number and offsets
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nmap \n :call NumberToggle()<CR>

function! ScrollToggle()
  if(&scrolloff != 0)
    set scrolloff=0
  else
    set scrolloff=9999
  endif
endfunc

nmap \s :call ScrollToggle()<CR>

execute pathogen#infect()

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fugitive', 'bufferline'] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'readonly', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '± %{exists("*fugitive#head")?fugitive#head():""}',
      \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

let g:bufferline_echo = 0

map \t :NERDTreeToggle<CR>

