return require('packer').startup(function()
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
end)

