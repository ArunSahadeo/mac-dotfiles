" Set shell to BASH for POSIX compatibility

set shell=bash

" Show the filename in the window titlebar
set title

" Enable mouse

set mouse=a

" Toggle soft wrap
set wrap

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
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/matchtagalways'
Plugin 'tpope/vim-fugitive'
Plugin 'jwalton512/vim-blade'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'dsawardekar/wordpress.vim'

" End plugin setup. All of your Plugins must be added before the following line
call vundle#end() 

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

"-----------------Plugin Settings-----------------"

" CtrlP Ignore these file types
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                      

" CtrlP Don't search these folders
let g:ctrlp_custom_ignore={ 'dir':'\.git$\|vendor$\|bower_components$\|node_modules$\|public$' }

" Vim-php-cs-fixer set to PSR-2 standard
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_fixers_list = "-psr0"

" Set PDV template dir
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

"-----------------Basic Settings-----------------"

" Toggle soft wrap
set wrap!

" Auto match HTML tags
runtime macros/matchit.vim

" Make Vim case insensitive
set ignorecase

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Set history buffer
set history=1000

" Set standard encoding
set encoding=utf-8

" Set leader char
let mapleader=','

" Set screen colours
set t_CO=256

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

"----------------Shell-------------"

" Load bash aliases
let $BASH_ENV = "~/.bash_aliases"

"----------------Moving-------------"

" Map window keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-----------------Mappings-----------------"

" Exit insert mode 
inoremap jj <Esc>

" Edit vimrc
nmap <Leader>ev :e $MYVIMRC<cr>

" Edit bash_aliases
nmap <Leader>eb :e ~/.bash_aliases<cr>

" Edit php snippiets
nmap <Leader>esp :e ~/.vim/snippets/php.snippets<cr>

" Edit html snippiets
nmap <Leader>esh :e ~/.vim/snippets/html.snippets<cr>

" Edit muttrc
nmap <Leader>emr :e ~/.muttrc<cr>

" Edit mutt aliases
nmap <Leader>ema :e ~/.mutt/aliases<cr>

" Edit laravel 5.2 routes
nmap <Leader>elr :e app/Http/routes.php<cr>

" Edit laravel 5.3 web routes
nmap <Leader>elw :e routes/web.php<cr>

" Install plugins
nmap <leader>pi :PluginInstall<CR>

" Search plugins
nmap <leader>ps :PluginSearch 

" Run unit tests in file
nmap <Leader>tt :!reset && vendor/bin/phpunit %<cr>

" Run unit tests in fail group
nmap <Leader>tf :!reset && vendor/bin/phpunit --group="fail"<cr>

" Run all unit tests
nmap <Leader>ta :!reset && vendor/bin/phpunit<cr>

" Search functions
nmap <c-E> :CtrlPBufTag<cr>

" Search recently viewed files
nmap <c-O> :CtrlPMRUFiles<cr>

" Tab align array
nmap <Leader>a :Tabularize /=><cr>

" Add doc blocks
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"-----------------Auto Commands-----------------"

" Reload vimrc on save
autocmd BufWritePost $MYVIMRC :source $MYVIMRC

" Copy vimrc changes to my-dev-repo to commit 
autocmd BufWritePost $MYVIMRC :silent !cp $MYVIMRC ~/Code/theo/my-dev-env/

" Reload bash aliases on save
autocmd BufWritePost ~/.bash_aliases :silent !source ~/.bash_aliases

" Copy bash aliases changes to my-dev-repo to commit 
autocmd BufWritePost ~/.bash_aliases :silent !cp ~/.bash_aliases ~/Code/theo/my-dev-env/

" Copy bash aliases changes to my-dev-repo to commit 
autocmd BufWritePost ~/.vim/snippets/* :silent !cp -r ~/.vim/snippets/* ~/Code/theo/my-dev-env/snippets/

" Format PHP files to PSR-2
autocmd BufWritePost *.php silent call PhpCsFixerFixFile() | syntax on

" Set Blade files to HTML file type
au BufRead,BufNewFile *.blade.* set filetype=html

" Generate ctags when saving PHP files
" autocmd BufWritePost *.php :silent !ctags -R &
