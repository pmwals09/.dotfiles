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
  Plug 'townk/vim-autoclose'
  Plug 'vim-ruby/vim-ruby'
  Plug 'OmniSharp/omnisharp-vim' " C# development
  Plug 'vim-airline/vim-airline' " Pretty colors
  Plug 'mfussenegger/nvim-dap'
  Plug 'Pocco81/DAPInstall.nvim'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'rcarriga/vim-ultest'
  Plug 'theHamsta/nvim-dap-virtual-text'

  " Available CoC options: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
  " Plug 'neoclide/coc.nvim', { 'branch': 'release' } " code completion
  " Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'antonk52/coc-cssmodules', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'iamcco/coc-diagnostic', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'voldikss/coc-dot-complete', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-emmet', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-eslint', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'weirongxu/coc-explorer', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  " Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'coc-extensions/coc-omnisharp'
  " Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-snippets', { 'do': 'yarn install --frozen-lockfile' }
call plug#end()

" syntax highlighting/colors
syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu

" ALE config
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 0

" rubocop config
let g:ruby_rubocop_options = '--config ~/.config/nvim/rubocop.yml --force-exclusion'

" Remaps
let mapleader = " "

" File navigation
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>pe :Ex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" In-file navigation
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-F> gg=G

" Config quick source
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" quicklist navigation
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

" Copy and paste is hard
vnoremap <leader>p "_dP
vnoremap <leader>y "*y
nnoremap <leader>y "*y
nnoremap <leader>Y gg"+yG

" fugitive HOT ROUTE
nmap <leader>gs :G<CR>

" Debugging
autocmd VimEnter * lua require('dapui').setup()
nnoremap <F4> :lua require('dapui').toggle()<CR>
nnoremap <F5> :lua require('dap').toggle_breakpoint()<CR>
nnoremap <F9> :lua require('dap').continue()<CR>
 
nnoremap <F1> :lua require('dap').step_over()<CR>
nnoremap <F2> :lua require('dap').step_into()<CR>
nnoremap <F3> :lua require('dap').step_out()<CR>
 
nnoremap <leader>dsc :lua require('dap').continue()<CR>
nnoremap <leader>dsv :lua require('dap').step_over()<CR>
nnoremap <leader>dsi :lua require('dap').step_into()<CR>
nnoremap <leader>dso :lua require('dap').step_out()<CR>
 
nnoremap <leader>dhh :lua require('dap.ui.variables').hover()<CR>
vnoremap <leader>dhv :lua require('dap.ui.variables').visual_hover()<CR>
 
nnoremap <leader>duh :lua require('dap.ui.widgets').hover()<CR>
nnoremap <leader>duf :lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>
 
nnoremap <leader>dro :lua require('dap').repl.open()<CR>
nnoremap <leader>drl :lua require('dap').repl.run_last()<CR>
 
nnoremap <leader>dbc :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <leader>dbm :lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>
nnoremap <leader>dbt :lua require('dap').toggle_breakpoint()<CR>
 
nnoremap <leader>dc :lua require('dap.ui.variables').scopes()<CR>
nnoremap <leader>di :lua require('dapui').toggle()<CR>

" Airline config
let g:airline_extensions = []
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
"
