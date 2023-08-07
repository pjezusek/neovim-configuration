local lib = require('lib')

require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  view = {
    adaptive_size = true,
    side = "left",
    number = true,
    relativenumber = true,
    signcolumn = "yes",
  },
})

lib.nmap('<leader><leader>t', ':NvimTreeFocus<CR>')
