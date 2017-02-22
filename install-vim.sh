#!/bin/bash

mkdir -p ~/.config/nvim/autoload
cd ~/.config/nvim/autoload
curl -LSo pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

mkdir -p ~/.config/nvim/bundle
cd ~/.config/nvim/bundle

git clone https://github.com/tpope/vim-sensible
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/jeetsukumaran/vim-filebeagle
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/morhetz/gruvbox
git clone https://github.com/ap/vim-buftabline
