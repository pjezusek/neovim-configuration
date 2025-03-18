-- Remap save and quit commands
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- Close all buffers except actual
vim.api.nvim_create_user_command('BufOnly', 'silent! execute "%bd|e#|bd#"', {})

-- nvim-lint plugin
vim.api.nvim_command([[au BufWritePost <buffer> lua require('lint').try_lint()]])

-- ranger plugin
vim.api.nvim_command([[
  augroup PrepareVieportForRanger
    autocmd TermOpen * setlocal nonumber norelativenumber scl=no
  augroup END
]])

-- conform plugin
vim.api.nvim_create_user_command('ConformFormat', function()
  require("conform").format({ async = true, lsp_fallback = true })
end, {})
