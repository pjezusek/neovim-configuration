require('packer').startup(function()
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

  -- Better substitute
  use { 'tpope/vim-abolish' }

  -- Search highlight
  use { 'kevinhwang91/nvim-hlslens' }

  -- Tagbar
  use { "stevearc/aerial.nvim" }

  -- Better ui for things
  use { 'stevearc/dressing.nvim' }

  -- Tabs
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- Show current context
  use "nvim-treesitter/nvim-treesitter-context"

  -- Autoclose tags
  use "windwp/nvim-ts-autotag"
end)

require('plugins.mason')
require('plugins.onedark')
require('plugins.nvim-treesitter')
require('plugins.telescope')
require('plugins.nvim-lspconfig')
require('plugins.nvim-cmp')
require('plugins.lua_snip')
require('plugins.nvim-lint')
require('plugins.trouble')
require('plugins.lualine')
require('plugins.indent-blankline')
require('plugins.todo-comments')
require('plugins.nvim-hlslens')
require('plugins.hop')
require('plugins.nvim-surround')
require('plugins.dressing')
require('plugins.bufferline')
require('plugins.nvim-autopairs')
require('plugins.treesitter-context')
require('plugins.nvim-ts-autotag')
