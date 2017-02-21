#!/bin/bash

mkdir -p ~/.config/nvim/autoload
cd ~/.config/nvim/autoload
curl -LSo pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

mkdir -p ~/.config/nvim/bundle
cd ~/.config/nvim/bundle

git clone https://github.com/tpope/vim-sensible
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/bling/vim-bufferline
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/easymotion/vim-easymotion

