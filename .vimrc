set tabstop=4
set nu
set autoindent
command W w

"NeoBundle Scripts-----------------------------
if has('vim_starting')
	set nocompatible               " Be iMproved

	" Required:
	set runtimepath+=/home/clear/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/clear/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
