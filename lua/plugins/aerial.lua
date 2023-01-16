local lib = require('lib')

lib.nmap('<C-T>', "<cmd>AerialToggle<cr>")

require("aerial").setup({
  layout = {
    default_direction = "prefer_left",
  },
  keymaps = {
    ["<Tab>"] = "actions.jump"
  },
})
