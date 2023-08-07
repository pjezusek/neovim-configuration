local utils = require('utils')

local M = {}

function M.find_spec_file()
  local relative_path = vim.fn.expand('%')
  local file_name = utils.significant_file_path_segments(utils.spec_file(relative_path), 2)
  require('telescope.builtin').find_files({ default_text = file_name })
end

return M
