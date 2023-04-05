" Set the leader key to comma
let mapleader = ","

" Enable syntax highlighting and indenting

set mouse=a  " enable mouse
set encoding=utf-8
set number
set noswapfile
set scrolloff=7

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype indent on      " load filetype-specific indent files
set guifont=JetBrains\ Mono:h11

" for tabulation
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

syntax on
filetype plugin indent on

" Install essential plugins with vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy finder for files and buffers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Code completion and language server integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git integration
Plug 'tpope/vim-fugitive'

" Status line and buffer tabs
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Gruvbox color scheme
Plug 'morhetz/gruvbox'

call plug#end()

" Configure plugins

" Fuzzy finder
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>

" Code completion
let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-ccls',
  \ ]
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Git
nnoremap <leader>gs :G<CR>

" Status line and buffer tabs
let g:airline_theme = 'simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_tab_type = 1

" Gruvbox color scheme
colorscheme gruvbox

" Python-specific settings
augroup python
  autocmd!
  autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" C-specific settings
augroup c
  autocmd!
  autocmd FileType c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END
