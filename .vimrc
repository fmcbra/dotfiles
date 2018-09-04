""
" ~/.vimrc
""

" Syntax highlighting is required to get vim colour schemes (:colorscheme) to work
syntax on

" Disable compatibility mode
set nocompatible
" Ditto filetype
filetype off

" Add Vundle.vim dir to rtp (run time path)
set rtp+=~/.vim/bundle/Vundle.vim

" Initialise Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()

" Enable indenting by filetype
filetype plugin indent on

" Set a colour scheme
colorscheme anotherdark

" Read in ~/.vimrc.local if it exists
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

""
" vim: ts=2 sw=2 et fdm=marker :
""
