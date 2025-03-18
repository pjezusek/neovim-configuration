local utils = require('utils.generic')

--- Telescope
utils.nmap('<C-f><C-S>', "<cmd>lua require('utils.rspec').find_spec_file()<cr>")

--- RSpec
utils.nmap('<A-f>', "<cmd>lua require('utils.rspec').toggle_focus()<cr><cmd>w<cr>")
vim.api.nvim_command(
  "command! CreateSpecRspec lua require('utils.rspec').create_rails_rspec_file()"
)
utils.vmap('<leader>ie', "<cmd>lua require('utils.rubocop').disable_rubocop_for_selection()<cr>")
utils.nmap('<leader>ie', "<cmd>lua require('utils.rubocop').disable_rubocop_for_current_line()<cr>")
