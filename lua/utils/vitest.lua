local utils = require('utils.generic')
local typescript_utils = require('utils.typescript')

local M = {}

--- Generates the spec file name for a given file using a custom connector.
---
--- @param file_name string: The original file name
---
--- @return string: The spec file name with the connector "."
---
--- @example
--- local spec_file = M.spec_file("example.ts") -- spec_file is "example.spec.ts"
function M.spec_file(file_name)
  return utils.spec_file(file_name, '.')
end

--- Finds the corresponding spec file for the current file and opens it using Telescope.
---
--- @example
--- -- In a Neovim buffer, call the function to find the spec file for the current file.
--- M.find_spec_file()
function M.find_spec_file()
  local relative_path = typescript_utils.remove_src_from_path(vim.fn.expand('%'))
  local file_name = utils.significant_file_path_segments(M.spec_file(relative_path), 2)
  require('telescope.builtin').find_files({ default_text = file_name })
end

--- Creates a spec file for the current file if it does not already exist.
---
--- @example
--- -- In a Neovim buffer, create a spec file for the current file.
--- M.create_vitest_file()
function M.create_vitest_file()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  local spec_file = 'spec/' .. typescript_utils.remove_src_from_path(M.spec_file(path))
  if utils.file_exists(spec_file) then return end

  local root = vim.treesitter.get_node()
  if not root then return end

  local spec_dir = spec_file:match("(.+)/")
  os.execute("mkdir -p " .. spec_dir)

  local file = io.open(spec_file, "w")
  if not file then return end

  local filename = vim.fn.fnamemodify(path, ":t:r")

  file:write("describe('" .. filename .. "', () => { \n })")
  file:close()
end

return M
