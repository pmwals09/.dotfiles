local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Style
  -- use 'folke/tokyonight.nvim'
  use('morhetz/gruvbox')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- Markdown preview
  use('ellisonleao/glow.nvim')

  -- Language packs
  use('sheerun/vim-polyglot')
  use('vim-ruby/vim-ruby')
  use('OmniSharp/omnisharp-vim')
  use('pangloss/vim-javascript')
  use('leafgarland/typescript-vim')
  use('maxmellon/vim-jsx-pretty')
  use('mattn/emmet-vim')

  -- LSP Autocomplete
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  -- Snippets
  use('rafamadriz/friendly-snippets')

  -- Native LSP
  use('neovim/nvim-lspconfig')

  -- Debugging
  use('mfussenegger/nvim-dap')
  use('Pocco81/DAPInstall.nvim')
  use('rcarriga/nvim-dap-ui')
  use('theHamsta/nvim-dap-virtual-text')

  -- FZF FTW
  use('junegunn/fzf', { run = ":call fzf#install()" })
  use('junegunn/fzf.vim')
  use('yuki-yano/fzf-preview.vim', {branch = 'release/rpc'})

  -- Git
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')

  -- Ergonomics
  use('tpope/vim-surround')
  use('townk/vim-autoclose')
  use('folke/todo-comments.nvim')
  use('dhruvasagar/vim-table-mode')

  -- Notes
  use{ 
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/vimwiki/',
          syntax = 'markdown',
          ext = '.md'
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

  -- Lisp
  use('vlime/vlime', {rtp = 'vim/'})

  -- Bootstrap if needed - after all plugins:
  if packer_bootstrap then
    require('packer').sync()
  end
end)
