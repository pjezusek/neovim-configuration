local lib = require('lib')

-- Disable numbers and sign column when using ranger
vim.api.nvim_command([[
  augroup PrepareVieportForRanger
    autocmd TermOpen * setlocal nonumber norelativenumber scl=no
  augroup END
]])

vim.g.ranger_map_keys = 0

lib.nmap('<leader>\\', ':RangerWorkingDirectory<CR>')
lib.nmap('<C-\\>', ':Ranger<CR>')
