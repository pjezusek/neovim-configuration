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
      init_selection = "<C-;>",
      node_incremental = "<C-;>",
      node_decremental = "<leader>;",
    },
  },
  indent = {
    enable = true
  }
}
