" Set shell to BASH for POSIX compatibility

set shell=bash

" Show the filename in the window titlebar
set title

" Enable mouse

set mouse=a

" Toggle soft wrap
nnoremap <Space>q :set wrap! wrap?<CR>

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Improve command-line autocomplete

set wildmenu

"-----------------Plugins-----------------"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Turn off file types during plugin setup
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Install the following plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/matchtagalways'
Plugin 'tpope/vim-fugitive'
Plugin 'jwalton512/vim-blade'
Plugin 'shawncplus/phpcomplete.vim'

" End plugin setup. All of your Plugins must be added before the following line
call vundle#end() 

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

"-----------------Basic Settings-----------------"

" Toggle soft wrap
set wrap!

" Show hidden buffers
set hidden

" Auto match HTML tags
runtime macros/matchit.vim

" Make Vim case insensitive
set ignorecase

" Switch syntax highlighting on
syntax on

" Show line numbers
set number

" Set history buffer
set history=1000

" Set standard encoding
set encoding=utf-8

" Highlight search matches while typing
set incsearch

" Highlight previous search matches
set hlsearch

" Set tabs as 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set color scheme
colorscheme evening

"----------------Moving-------------"

" Map window keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
execute "set <M-C>=\ec"
nnoremap <M-C> <C-W><C-V>

"-----------------Mappings-----------------"

" Exit insert mode 
inoremap jj <Esc>

"-----------------Auto Commands-----------------"

" Reload vimrc on save
autocmd BufWritePost $MYVIMRC :source $MYVIMRC

" Set Blade files to HTML file type
au BufRead,BufNewFile *.blade.* set filetype=html

" Set Typescript files to JS file type
au BufRead,BufNewFile *.ts set filetype=javascript
