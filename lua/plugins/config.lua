return require('packer').startup(function()

  -- Manage packer itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'morhetz/gruvbox'

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

  -- Telescope - fuzzy search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Plugin to telescope to search snippets
  use {
    "benfowler/telescope-luasnip.nvim",
  }

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

  -- Better work with tmux
  use 'christoomey/vim-tmux-navigator'

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Fast editing surrounding characters
  use 'tpope/vim-surround'

  -- Easy comments
  use {
    'tomtom/tcomment_vim',
    requires = { { 'tyru/caw.vim' } }
  }
end)
