local options = { noremap = true, silent = true }

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>p', '<cmd>MarkdownPreview<CR>', options)

