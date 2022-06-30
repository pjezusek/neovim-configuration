lib = require('lib')

-- Disable numbers in terminal
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber')

vim.g.ranger_map_keys = 0

lib.nmap('<leader>\\', ':RangerWorkingDirectory<CR>')
lib.nmap('<C-\\>', ':Ranger<CR>')
