local lib = require('lib')

lib.nmap('<leader>xx', ':TroubleToggle workspace_diagnostics<cr>')
lib.nmap('<leader>q', ':TroubleToggle quickfix<cr>')
lib.nmap('gR', ':TroubleToggle lsp_references<cr>')
