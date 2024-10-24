-- Abbrevations
-- Open help in new tab
vim.api.nvim_command([[
  cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
]])
-- Messages
vim.api.nvim_command([[
  cnoreabbrev <expr> msg getcmdtype() == ":" && getcmdline() == 'msg' ? 'messages' : 'msg'
]])
-- Search
vim.api.nvim_command([[
  cnoreabbrev <expr> sr getcmdtype() == ":" && getcmdline() == 'sr' ? 'silent grep ' : 'sr'
]])

