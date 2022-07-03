require('lint').linters_by_ft = {
  ruby = { 'rubocop', 'ruby' },
  javascript = { 'eslint', },
  typescript = { 'eslint', },
  vue = { 'eslint', },
  markdown = { 'markdownlint', },
  python = { 'pyright', }
}

vim.api.nvim_command([[au TextChanged <buffer> lua require('lint').try_lint()]])
