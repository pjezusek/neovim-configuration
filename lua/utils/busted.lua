local utils = require('utils.generic')

local M = {}

--- Finds a spec file using Telescope based on the current file's path.
---
--- 1. Retrieves the current file's path.
--- 2. Generates the spec file name based on the current file.
--- 3. Extracts significant segments of the spec file's path.
--- 4. Uses Telescope to find and display the spec file.
---
--- @example
--- Assuming the current file is "src/my_module.lua",
--- and the spec file is "src/my_module_spec.lua",
--- this function will search for "my_module_spec.lua" using Telescope.
function M.find_spec_file()
  local relative_path = vim.fn.expand('%')
  local file_name = utils.significant_file_path_segments(utils.spec_file(relative_path), 2)
  require('telescope.builtin').find_files({ default_text = file_name })
end

return M
