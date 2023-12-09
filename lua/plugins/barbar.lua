local lib = require('lib')

-- Move to previous/next
lib.nmap('<A-,>', '<Cmd>BufferPrevious<CR>')
lib.nmap('<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
lib.nmap('<A-<>', '<Cmd>BufferMovePrevious<CR>')
lib.nmap('<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
lib.nmap('<leader>1', '<Cmd>BufferGoto 1<CR>')
lib.nmap('<leader>2', '<Cmd>BufferGoto 2<CR>')
lib.nmap('<leader>3', '<Cmd>BufferGoto 3<CR>')
lib.nmap('<leader>4', '<Cmd>BufferGoto 4<CR>')
lib.nmap('<leader>5', '<Cmd>BufferGoto 5<CR>')
lib.nmap('<leader>6', '<Cmd>BufferGoto 6<CR>')
lib.nmap('<leader>7', '<Cmd>BufferGoto 7<CR>')
lib.nmap('<leader>8', '<Cmd>BufferGoto 8<CR>')
lib.nmap('<leader>9', '<Cmd>BufferGoto 9<CR>')
lib.nmap('<leader>0', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
lib.nmap('<leader>bp', '<Cmd>BufferPin<CR>')
-- Close buffer
lib.nmap('<A-q>', '<Cmd>BufferClose<CR>')
lib.nmap('<A-o>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>')
-- Choose buffer
lib.nmap('<leader>p', '<Cmd>BufferPick<CR>')
