runtime! archlinux.vim
syntax enable
set encoding=utf8
set history=700
set autoread
set ruler
set smarttab
set hlsearch
set incsearch
set expandtab
"set noshowmatch
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
set laststatus=2
set noshowmode

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

nnoremap j gj
nnoremap k gk

let mapleader=","

call plug#begin('~/.config/nvim/plugged')

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0ng/vim-hybrid'
"Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'withgod/vim-sourcepawn'
Plug 'simnalamburt/vim-mundo'
Plug 'Raimondi/delimitMate'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'raichoo/smt-vim'
Plug 'Konfekt/FastFold'

call plug#end()

colorscheme hybrid
let g:airline_powerline_fonts = 1
let g:airline_theme="bubblegum"
let g:airline#extensions#tabline#enabled = 1
set background=dark
hi Normal ctermbg=none

nnoremap <leader>u :MundoToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap gb :bnext<CR>
nnoremap gB :bprev<CR>

let g:deoplete#enable_at_startup = 1
