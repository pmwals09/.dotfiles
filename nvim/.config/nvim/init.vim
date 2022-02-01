set scrolloff=8 " file will scroll to follow cursor
set number " add line numbers to buffer 
set relativenumber " make line numbers relative to current line
set tabstop=2 " default to 2-space tabs
set softtabstop=2 " default to 2-space tabs
set shiftwidth=2 " default to 2-space tabs
set expandtab " expand tabs into spaces
set smartindent " indent intelligently/automatically when possible

" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'tpope/vim-surround'
call plug#end()

" syntax highlighting/colors
syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
