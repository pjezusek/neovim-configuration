require('lint').linters_by_ft = {
  ruby = {'rubocop',}
}

vim.api.nvim_command([[au TextChanged <buffer> lua require('lint').try_lint()]])
