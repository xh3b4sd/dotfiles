"
" global
"

let mapleader = "<space>"

" use goimports for formatting
let g:go_fmt_command = "goimports"

" Enable autocompletions at startup.
let g:deoplete#enable_at_startup = 0

"
"     https://jonasjacek.github.io/colors
"     https://github.com/joshdick/onedark.vim
"
let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "234", "cterm16": "0" }
\}

"
let NERDTreeDirArrows = 1

"
let NERDTreeShowLineNumbers=1

"
let NERDTreeMouseMode=3

"
let g:NERDTreeMinimalUI = 1

"
let g:airline_extensions = []

"
let g:airline_theme= "minimalist"

"
let g:airline_skip_empty_sections = 1



"
" plugin
"

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()



colorscheme onedark



set encoding=utf-8
set guifont=Hack:h14
set mouse=a
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set syntax=on
set timeoutlen=500



"
" key mapping
"


" buffer
nnoremap L :bn<cr>
nnoremap H :bp<cr>
nnoremap qb :bd<cr>

" go to definition
nnoremap gd :GoDef<cr>

" fuzzy find
nnoremap fzf :FZF<cr>

" simple save
nnoremap ss :w<cr>

" quit vim
nnoremap qq :q<cr>

" format paragraph
nnoremap gq vip gq k 0

" copy to clipboard
vnoremap Y "*y<cr>



"
"
"

" Enable NERDTree when opening NeoVim.
autocmd vimenter * NERDTree

" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" Close NeoVim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
