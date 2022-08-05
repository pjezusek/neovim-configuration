require('lint').linters_by_ft = {
  ruby = { 'rubocop', 'ruby' },
  javascript = { 'eslint', },
  typescript = { 'eslint', },
  vue = { 'eslint', },
  markdown = { 'markdownlint', },
  python = { 'flake8', 'pylint' },
}

vim.api.nvim_command([[au BufWritePost <buffer> lua require('lint').try_lint()]])
