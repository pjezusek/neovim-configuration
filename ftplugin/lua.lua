local lib = require('lib')


--- Telescope
lib.nmap('<C-f><C-S>', "<cmd>lua require('busted_utils').find_spec_file()<cr>")
