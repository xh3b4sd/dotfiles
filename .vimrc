set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'Matt-Deacalion/vim-systemd-syntax'

" colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'https://github.com/vim-scripts/darktango.vim'

Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'
Plugin 'ekalinin/Dockerfile.vim'

" snipmate and dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" cr-    fooBar    to     foo-bar    (dash case)
" cr_    fooBar    to     foo_bar    (underscore)
" crm    fooBar    to     FooBar     (mixed case)
" crc    fooBar    to     fooBar     (camel case)
Plugin 'tpope/vim-abolish'

" All of your Plugins must be added before the following line
" required
call vundle#end()
filetype plugin on
syntax on

colorscheme wombat256mod
"colorscheme monokai-chris

" vim-go settings
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1

set backspace=indent,eol,start
" IMPORTANT to get ctrl + q to work
silent !stty -ixon > /dev/null 2>/dev/null

" strip trailing spaces on save except for *.t files
autocmd BufWritePre *\(*.t\)\@<! :%s/\s\+$//e

vnoremap ? !python -m json.tool<Return>
"filetype off
let NERDTreeShowHidden=1

let mapleader = ","
let g:mapleader = ","
let g:vim_markdown_folding_disabled=1
let g:go_fmt_experimental = 1
let g:NERDTreeDirArrows=0
set ruler
set incsearch
set lazyredraw
set ttyfast
set nocompatible
set wildmenu
set wildmode=list:full
set mouse=a
set number
set nowrap
set nohlsearch
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartcase
set scrolloff=5
set encoding=utf-8
" By default, when doing `vim -p $(find a lot of files)`, vim does not open
" more than 10 tabs. With this setting i is possible to open 100 files at
" once.
set tabpagemax=100

" ALWAYS close folds by default
autocmd BufRead *
  \ exe "normal! zM"

" only fold one indention level
set foldnestmax=1
set foldlevelstart=0
set foldmethod=indent

" toggle current fold
map <C-f> za
" toggle all folds
map <C-c> zi
" move to next fold
map <C-j> zj
" move to prev fold
map <C-k> zk

map - :
map Y y$
map R v$hp
map <C-l> :tabn<Return>
map <C-h> :tabp<Return>
map <C-e> :tabe<Space>
map <C-w> :w<Return>
map <C-q> :q<Return>
vnoremap / <Esc>/\%V
vnoremap : <Esc>:'<,'>s///g
" don't overwrite register by pasting yanked lines
xnoremap p pgvy

" Center display line after searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Remember info about open buffers on close
set viminfo^=%
