local utils = require('utils.generic')

--- Telescope
utils.nmap('<C-f><C-S>', "<cmd>lua require('utils.rspec').find_spec_file()<cr>")

--- RSpec
utils.nmap('<A-f>', "<cmd>lua require('utils.rspec').toggle_focus()<cr><cmd>w<cr>")
vim.api.nvim_command(
  "command! CreateSpecRspec lua require('utils.rspec').create_rails_rspec_file()"
)
