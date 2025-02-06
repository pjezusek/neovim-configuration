local utils = require('utils.generic')

--- Telescope
utils.nmap('<C-f><C-S>', "<cmd>lua require('utils.vitest').find_spec_file()<cr>")

--- Vitest
utils.nmap('<A-f>', "<cmd>lua require('utils.vitest').toggle_focus()<cr><cmd>w<cr>")
vim.api.nvim_command(
  "command! CreateSpecFile lua require('utils.vitest').create_vitest_file()"
)
