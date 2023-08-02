local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd([[
      packadd packer.nvim
    ]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Style
  -- use 'folke/tokyonight.nvim'
  -- use('morhetz/gruvbox')
  use('sainnhe/sonokai')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use("romgrk/nvim-treesitter-context")

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

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use {
    "folke/trouble.nvim",
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use { 'kyazdani42/nvim-web-devicons' }
  -- Snippets
  use('rafamadriz/friendly-snippets')


  -- Debugging
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      {
        'microsoft/vscode-js-debug',
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
      'mxsdev/nvim-dap-vscode-js'
    }
  }

  -- FZF FTW
  use { 'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Git
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

  -- Ergonomics
  use('tpope/vim-surround')
  use('townk/vim-autoclose')
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("todo-comments").setup {
      }
    end
  }
  use('dhruvasagar/vim-table-mode')
  use('mbbill/undotree')
  use {
    'ThePrimeagen/harpoon',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Notes
  use('vimwiki/vimwiki')

  -- Lisp
  use('vlime/vlime', { rtp = 'vim/' })

  -- Bootstrap if needed - after all plugins:
  if packer_bootstrap then
    require('packer').sync()
  end
end)
