execute pathogen#infect()

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set colorcolumn=80

set number
set relativenumber

set scrolloff=30
set hidden

set lazyredraw
set noshowmode

" set termguicolors
colorscheme wal
syntax on

set bg=dark

" This is for st, see here: https://github.com/neovim/neovim/issues/3211
map <F1> <del>
map! <F1> <del>

command W w
command Q q

command Vsp vsp
command VSp vsp
command VSP vsp

command Sp sp
command SP sp

set splitbelow
set splitright

nmap <leader>= :vertical resize +5<CR>
nmap <leader>- :vertical resize -5<CR>
nmap <leader>] :resize +5<CR>
nmap <leader>[ :resize -5<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

set fillchars=vert:│

set incsearch
set ignorecase
set smartcase
set hlsearch

nmap <leader>h :nohlsearch<CR>
nmap <leader>w :bd<CR>

nmap <leader>n :call NumberToggle()<CR>
nmap <leader>s :call ScrollToggle()<CR>

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

function! ScrollToggle()
  if(&scrolloff != 0)
    set scrolloff=0
  else
    set scrolloff=9999
  endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""'

let g:lightline = {
      \ 'enable': { 'statusline': 1, 'tabline': 1 },
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fname']],
      \   'right': [ [ 'lineinfo' ],  [ 'readonly', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fname' ] ],
      \   'right': [ [ 'lineinfo' ] ],
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ],
      \ },
      \ 'component': {
      \   'fname': '%F',
      \ },
      \ }

let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_show = 2

let g:filebeagle_show_hidden = 1
let g:filebeagle_show_line_numbers = 1

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
