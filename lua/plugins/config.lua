return require('packer').startup(function()
  -- Manage packer itself
  use 'wbthomason/packer.nvim'

  -- Plugin manger
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  }

  -- Theme
  use 'navarasu/onedark.nvim'

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
    'benfowler/telescope-luasnip.nvim',
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
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }

  -- Better work with tmux
  use 'christoomey/vim-tmux-navigator'

  -- Markdown preview
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })

  -- Fast editing surrounding characters
  use 'kylechui/nvim-surround'

  -- Easy comments
  use {
    'tomtom/tcomment_vim',
    requires = { { 'tyru/caw.vim' } }
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Highlight same elements
  use { 'RRethy/vim-illuminate' }

  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Indent guidelines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Easy jumping
  use {
    'phaazon/hop.nvim',
    branch = 'v2'
  }

  -- Python formatter
  use 'psf/black'

  -- Mark TODO in the project
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- Tabline
  use { 'nanozuki/tabby.nvim' }

  -- Better substitute
  use { 'tpope/vim-abolish' }

  -- Search highlight
  use { 'kevinhwang91/nvim-hlslens' }

  -- Plugin for jupyter
  use { "untitled-ai/jupyter_ascending.vim" }
  use { "barreiroleo/ltex-extra.nvim" }

  -- Files tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Tagbar
  use { "stevearc/aerial.nvim" }
end)
