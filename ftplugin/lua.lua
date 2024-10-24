local utils = require('utils.generic')

--- Telescope
utils.nmap('<C-f><C-S>', "<cmd>lua require('utils.busted').find_spec_file()<cr>")
