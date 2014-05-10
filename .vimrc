set backspace=indent,eol,start
" IMPORTANT to get ctrl + q to work
silent !stty -ixon > /dev/null 2>/dev/null
autocmd BufWritePre * :%s/\s\+$//e
filetype on
syntax on
vnoremap ? !python -m json.tool<Return>
filetype off
let NERDTreeShowHidden=1

let mapleader = ","
let g:mapleader = ","
let g:vim_markdown_folding_disabled=1
let g:NERDTreeDirArrows=0
set ruler
set incsearch
set lazyredraw
set nocompatible
set rtp+=~/.vim/bundle/vundle/
set wildmenu
set wildmode=list:full
set mouse=a
set clipboard=unnamed
set number
set nowrap
set nohlsearch
set noswapfile
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set ignorecase
set smartcase
set scrolloff=5

set foldnestmax=1
set foldmethod=syntax

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

map <C-f> za
map <C-c> zi
 
map - :
map Y y$
map R v$hp
map <C-n> :tabn<Return>
map <C-p> :tabp<Return>
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

call vundle#rc()
Bundle 'lunaru/vim-less'
Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle 'The-NERD-tree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'plasticboy/vim-markdown'
Bundle 'ekalinin/Dockerfile.vim'

" snipmate and dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

filetype plugin on
colorscheme wombat256mod

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
