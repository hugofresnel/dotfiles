" Options
syntax on
set noswapfile

set relativenumber
set number

set shiftwidth=4
set expandtab

set scrolloff=5

set listchars=tab:▸\ ,trail:·,nbsp:+
set list

" Keybindings
let mapleader=" "

inoremap <C-h> <C-w>

vnoremap <S-Up> :move '<-2<CR>gv=gv
vnoremap <S-Down> :move '>+1<CR>gv=gv

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap n nzzzv
nnoremap N Nzzzv
