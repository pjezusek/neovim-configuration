local lib = require('lib')

lib.nmap('<leader>s', '<Plug>(easymotion-overwin-f2)')
lib.nmap('<leader>w', '<Plug>(easymotion-overwin-w)')

vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_use_smartsign_us = 1
