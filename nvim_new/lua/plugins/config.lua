return require('packer').startup(function()
  -- Manage packer itself
  use 'wbthomason/packer.nvim'

  -- Syntax parser
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Ranger integration
  use {
    'francoiscabrol/ranger.vim',
    requires = { { 'rbgrouleff/bclose.vim' } }
  }

  -- Leaderf - fuzzy search
  use 'Yggdroot/LeaderF'

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  -- Icons for cmp
  use 'onsails/lspkind.nvim'
  -- Linter
  use 'mfussenegger/nvim-lint'

  -- Pretty lists
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
end)
