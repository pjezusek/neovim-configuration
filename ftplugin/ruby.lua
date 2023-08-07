local lib = require('lib')


--- Telescope
lib.nmap('<C-f><C-S>', "<cmd>lua require('rspec_utils').find_spec_file()<cr>")

--- RSpec
lib.nmap('<A-f>', "<cmd>lua require('rspec_utils').toggle_focus()<cr><cmd>w<cr>")
vim.api.nvim_command(
  "command! CreateRailsRspec lua require('rspec_utils').create_rails_rspec_file()"
)
