local utils = require('utils.generic')

--- Telescope
utils.nmap('<C-f><C-S>', "<cmd>lua require('utils.vitest').find_spec_file()<cr>")

--- Vitest
vim.api.nvim_command(
  "command! CreateSpecFile lua require('utils.vitest').create_vitest_file()"
)
