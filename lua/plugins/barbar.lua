local lib = require('lib')

require 'bufferline'.setup {
  -- Enable/disable animations
  animation = true,

  auto_hide = false,

  tabpages = true,

  closable = false,

  clickable = false,

  icons = true,
}

lib.nmap('<A-,>', '<Cmd>BufferPrevious<CR>')
lib.nmap('<A-.>', '<Cmd>BufferNext<CR>')
lib.nmap('<A-<>', '<Cmd>BufferMovePrevious<CR>')
lib.nmap('<A->>', '<Cmd>BufferMoveNext<CR>')
lib.nmap('<A-1>', '<Cmd>BufferGoto 1<CR>')
lib.nmap('<A-2>', '<Cmd>BufferGoto 2<CR>')
lib.nmap('<A-3>', '<Cmd>BufferGoto 3<CR>')
lib.nmap('<A-4>', '<Cmd>BufferGoto 4<CR>')
lib.nmap('<A-5>', '<Cmd>BufferGoto 5<CR>')
lib.nmap('<A-6>', '<Cmd>BufferGoto 6<CR>')
lib.nmap('<A-7>', '<Cmd>BufferGoto 7<CR>')
lib.nmap('<A-8>', '<Cmd>BufferGoto 8<CR>')
lib.nmap('<A-9>', '<Cmd>BufferGoto 9<CR>')
lib.nmap('<A-0>', '<Cmd>BufferLast<CR>')
-- Close buffer
lib.nmap('<C-q>', '<Cmd>BufferClose<CR>')
