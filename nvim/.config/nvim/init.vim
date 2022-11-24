"=================
" General Settings
"=================

syntax on
set ma
set mouse=a
set nocompatible
set cursorline
set tabstop=2 " default to 2-space tabs
set shiftwidth=2 " default to 2-space tabs
set softtabstop=2 " default to 2-space tabs
set expandtab " expand tabs into spaces
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu
set foldlevelstart=99
set scrolloff=8 " file will scroll to follow cursor
set clipboard=unnamedplus
set number " add line numbers to buffer
set relativenumber " make line numbers relative to current line
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
set report=0
set synmaxcol=200
set list
set colorcolumn=80
set ignorecase
set smartcase
filetype plugin indent on " Load plugins according to detected filetype
let g:netrw_liststyle = 3
let g:netrw_banner = 0
set termguicolors

" =======
" Plugins
" =======

call plug#begin('~/.vim/plugged')
  " Style
  Plug 'morhetz/gruvbox'
  " Plug 'ayu-theme/ayu-vim'
  Plug 'vim-airline/vim-airline'
  " Plug 'hoob3rt/lualine.vim' " Statusline
  Plug 'kyazdani42/nvim-web-devicons'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " Markdown preview
  Plug 'ellisonleao/glow.nvim'

  " Language packs
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-ruby/vim-ruby'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'vlime/vlime', {'rtp': 'vim/'}
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'mattn/emmet-vim'

  " LSP Autocomplete
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Native LSP
  Plug 'neovim/nvim-lspconfig'

  " Debugging
  Plug 'mfussenegger/nvim-dap'
  Plug 'Pocco81/DAPInstall.nvim'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'theHamsta/nvim-dap-virtual-text'

  " FZF FTW
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Ergonomics
  Plug 'tpope/vim-surround'
  Plug 'townk/vim-autoclose'
  Plug 'folke/todo-comments.nvim'
  Plug 'dhruvasagar/vim-table-mode'

  " Notes
  Plug 'vimwiki/vimwiki'

  " Misc attempts
  " Plug 'dense-analysis/ale' " linting
  " Plug 'rcarriga/vim-ultest'
  " Plug 'vim-test/vim-test'
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'lighttiger2505/deoplete-vim-lsp'
  " Plug 'nickspoons/vim-sharpenup'
  " Plug 'honza/vim-snippets'
  " Plug 'SirVer/ultisnips'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
  " Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' }
  " Plug 'coc-extensions/coc-omnisharp' " C-sharp
  " Plug 'neoclide/coc-java' " Java
  " Plug 'neoclide/coc-prettier', { 'do': 'yarn install --frozen-lockfile' }
  Plug 'vlime/vlime', {'rtp': 'vim/'}
call plug#end()

" =====
" Style
" =====
" let ayucolor="dark"
" colorscheme ayu
autocmd vimenter * ++nested colorscheme gruvbox
" colorscheme gruvbox

" =======
" Keymaps
" =======

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

" Windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=


" ==============
" Plugin configs
" ==============

" Airline
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
 
" VimWiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.auto_tags = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [wiki]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Sharpenup
let g:sharpenup_map_prefix = '<Space>os'

" OmniSharp
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}
let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" let g:OmniSharp_want_snippet = 1

" CoC
" nmap <leader>rn <Plug>(coc-rename)

" Rubocop
let g:ruby_rubocop_options = '--config ~/.config/nvim/rubocop.yml --force-exclusion'

" FZF
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:glow_use_pager = v:false

" ===========================
" Config that's easier in lua
" ===========================
" Add some autocmd's to set filetypes for the language servers

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

" Load the lua file
lua require('pw-lua')
