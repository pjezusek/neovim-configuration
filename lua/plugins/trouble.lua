local lib = require('lib')

lib.nmap('<leader>xx', ':TroubleToggle<CR>')
lib.nmap('<leader>tt', ':TodoTrouble<CR>')
lib.nmap('<leader>q', ':TroubleToggle quickfix<CR>')

-- Jump in trouble list
lib.nmap(']t', ':lua require("trouble").next({skip_groups = true, jump = true})<CR>')
lib.nmap('[t', ':lua require("trouble").previous({skip_groups = true, jump = true})<CR>')
