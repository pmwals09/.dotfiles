set nocompatible

filetype plugin indent on " Load plugins according to detected filetype

set scrolloff=8 " file will scroll to follow cursor
set number " add line numbers to buffer 
set relativenumber " make line numbers relative to current line
set tabstop=2 " default to 2-space tabs
set softtabstop=2 " default to 2-space tabs
set shiftwidth=2 " default to 2-space tabs
set expandtab " expand tabs into spaces
set smartindent " indent intelligently/automatically when possible
set backspace=indent,eol,start " make backspace work as you'd expect
set hidden
set laststatus=2 " Always show statusline
set display=lastline " Show as much as possible of the last line
set showmode
set showcmd
set incsearch
set hlsearch
set ttyfast
set lazyredraw
set splitbelow
set splitright
set cursorline
set report=0
set synmaxcol=200
set list
set autochdir
set colorcolumn=80
set ignorecase
set smartcase
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
  Plug 'junegunn/fzf.vim' " fuzzy finder
  Plug 'ayu-theme/ayu-vim' " nicer-looking theme
  Plug 'tpope/vim-surround' " surround with brackets, etc.
  Plug 'sheerun/vim-polyglot' " syntax highlighting
  Plug 'dense-analysis/ale' " linting
  Plug 'tpope/vim-fugitive'

  " Available CoC options: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
  Plug 'neoclide/coc.nvim', { 'branch': 'release' } " code completion
  Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'antonk52/coc-cssmodules', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'iamcco/coc-diagnostic', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'voldikss/coc-dot-complete', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-emmet', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'weirongxu/coc-explorer', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'coc-extensions/coc-omnisharp'
  Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'neoclide/coc-snippets', { 'do': 'yarn install --frozen-lockfile' }
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
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-F> gg=G
