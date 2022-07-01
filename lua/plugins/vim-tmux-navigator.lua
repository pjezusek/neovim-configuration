local lib = require('lib')

vim.g.tmux_navigator_no_mappings = 1

lib.nmap('<C-h>', ':TmuxNavigateLeft<CR>')
lib.nmap('<C-j>', ':TmuxNavigateDown<CR>')
lib.nmap('<C-k>', ':TmuxNavigateUp<CR>')
lib.nmap('<C-l>', ':TmuxNavigateRight<CR>')
