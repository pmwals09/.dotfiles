local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Style
  -- 'folke/tokyonight.nvim'
  -- 'morhetz/gruvbox'
  'sainnhe/sonokai',

  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
      end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  "romgrk/nvim-treesitter-context",

  "rcarriga/nvim-notify",

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'folke/neodev.nvim',
      {
        'j-hui/fidget.nvim', tag = 'legacy'
      },
    },
  },

      -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons', },
  },
  'nvim-tree/nvim-web-devicons',

  -- Debugging
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      {
        'microsoft/vscode-js-debug',
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
      'mxsdev/nvim-dap-vscode-js',
    },
    lazy = true
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    lazy = true
  },
  -- FZF FTW
  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable('make') == 1,
  },

  -- Git
  {
    'tpope/vim-fugitive',
  },
  'lewis6991/gitsigns.nvim',

  -- Ergonomics
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'tpope/vim-surround',
  'townk/vim-autoclose',
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("todo-comments").setup {}
    end,
  },
  'mbbill/undotree',
  {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { {"nvim-lua/plenary.nvim"} }
  }
  },

  -- Lisp
  {
    'vlime/vlime',
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/custom-rtp")
    end,
    lazy = true
  },

  -- Quicknotes
  'pmwals09/quicknote.nvim',
  'dmmulroy/tsc.nvim',
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}
require("lazy").setup(plugins)
