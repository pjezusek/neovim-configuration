require 'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-k>',
      node_incremental = '<C-k>',
      node_decremental = '<C-j>',
    },
  },
  indent = {
    enable = true
  }
}
