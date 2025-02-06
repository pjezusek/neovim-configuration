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

--- Toggles the `.only` modifier for a given line.
--- Adds `.only` if it's not present, removes it if it is.
---
--- @param line_number number: The line number to toggle focus for.
---
--- @example
--- -- In a Neovim buffer, toggle focus for line number 10.
--- M.toggle_focus_for_line(10)
function M.toggle_focus_for_line(line_number)
 local current_line = vim.fn.getline(line_number)
 if current_line:match("%.only%s*%(") then
   local updated_line = current_line:gsub("%.only%s*%(", "(")
   vim.fn.setline(line_number, updated_line)
 else
   local updated_line = current_line:gsub("(%w+)%s*%(", "%1.only(", 1)
   vim.fn.setline(line_number, updated_line)
 end
end

--- Checks if a given line contains a Vitest block like 'test', 'describe', or 'it',
--- optionally followed by '.only'.
---
--- @param line string: The line to check.
---
--- @return boolean: True if the line contains a Vitest block, false otherwise.
function M.check_if_vitest_block(line)
  local patterns = {
    "^%s*test%s*[.(]",
    "^%s*test%.only%s*[.(]",
    "^%s*describe%s*[.(]",
    "^%s*describe%.only%s*[.(]",
    "^%s*it%s*[.(]",
    "^%s*it%.only%s*[.(]"
  }

  for _, pattern in ipairs(patterns) do
    if line:match(pattern) then
      return true
    end
  end
  return false
end

--- Toggles the focus for the current line or the nearest Vitest test block.
---
--- @example
--- -- In a Neovim buffer, toggle focus for the current line or nearest Vitest test block.
--- M.toggle_focus()
function M.toggle_focus()
  local current_line = vim.api.nvim_get_current_line()

  if M.check_if_vitest_block(current_line) then
    M.toggle_focus_for_line(vim.fn.line('.'))
    return
  end

  local node = vim.treesitter.get_node()
  while node do
    local row = node:start()
    local node_start_line = vim.fn.getline(row + 1)
    if not M.check_if_vitest_block(node_start_line) then
      node = node:parent()
    else
      M.toggle_focus_for_line(row + 1)
      break
    end
  end
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
