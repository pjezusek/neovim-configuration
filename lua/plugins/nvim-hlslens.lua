local lib = require("lib")

require('hlslens').setup({
})

lib.nmap('n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
lib.nmap('N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
lib.nmap('*', [[:keepjumps normal! mi*`i<CR><Cmd>lua require('hlslens').start()<CR>]])
lib.nmap('#', [[#<Cmd>lua require('hlslens').start()<CR>]])
lib.nmap('g*', [[g*<Cmd>lua require('hlslens').start()<CR>]])
lib.nmap('g#', [[g#<Cmd>lua require('hlslens').start()<CR>]])

lib.nmap('<Leader>l', ':noh<CR>')
