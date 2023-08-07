require("luasnip.loaders.from_vscode").lazy_load()

-- TODO: Change this to lua mapping
vim.api.nvim_command([[
  imap <silent><expr> <C-Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-Space>' 
]])

local luasnip = require 'luasnip'
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("vue", { "javascript", "typescript" })
luasnip.filetype_extend("ruby", { "rails" })
