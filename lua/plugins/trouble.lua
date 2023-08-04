local lib = require('lib')

require('trouble').setup {}

lib.nmap('<leader>x', ':TroubleToggle<CR>')
lib.nmap('<leader>xt', ':TodoTrouble<CR>')
lib.nmap('<leader>q', ':TroubleToggle quickfix<CR>')
lib.nmap("<leader>xd", ":TroubleToggle document_diagnostics<CR>")

-- Jump in trouble list
lib.nmap(']t', ':lua require("trouble").next({skip_groups = true, jump = true})<CR>')
lib.nmap('[t', ':lua require("trouble").previous({skip_groups = true, jump = true})<CR>')
