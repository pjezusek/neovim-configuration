local string_utils = require 'utils.strings'
local M = {}

-- Default options for key mappings
M.default_options = { noremap = true, silent = true }

--- Map the given shortcuts to the command in the specified mode.
---
--- @param mode string: Mode in which mapping should be performed (e.g., 'n', 'i', 'v', etc.)
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.map('n', '<leader>f', ':Files<CR>')
--- Maps '<leader>f' to ':Files<CR>' in normal mode
function M.map(mode, mapping, command, options)
  options = options or M.default_options
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

--- Map the given shortcuts to the command in normal mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.nmap('<leader>f', ':Files<CR>')
--- Maps '<leader>f' to ':Files<CR>' in normal mode
function M.nmap(mapping, command, options)
  M.map('n', mapping, command, options)
end

--- Map the given shortcuts to the command in insert mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.imap('<C-j>', '<Esc>')
--- Maps '<C-j>' to '<Esc>' in insert mode
function M.imap(mapping, command, options)
  M.map('i', mapping, command, options)
end

--- Map the given shortcuts to the command in visual and select mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.vmap('<leader>c', ':Commentary<CR>')
--- Maps '<leader>c' to ':Commentary<CR>' in visual and select mode
function M.vmap(mapping, command, options)
  M.map('v', mapping, command, options)
end

--- Map the given shortcuts to the command in operator-pending mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.omap('<leader>o', ':Operator<CR>')
--- Maps '<leader>o' to ':Operator<CR>' in operator-pending mode
function M.omap(mapping, command, options)
  M.map('o', mapping, command, options)
end

--- Map the given shortcuts to the command in command-line mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.cmap('<C-a>', '<Home>')
--- Maps '<C-a>' to '<Home>' in command-line mode
function M.cmap(mapping, command, options)
  M.map('c', mapping, command, options)
end

--- Map the given shortcuts to the command in select mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.smap('<leader>t', ':Select<CR>')
--- Maps '<leader>t' to ':Select<CR>' in select mode
function M.smap(mapping, command, options)
  M.map('s', mapping, command, options)
end

--- Map the given shortcuts to the command in visual mode.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.xmap('<leader>t', ':Select<CR>')
--- Maps '<leader>t' to ':Select<CR>' in visual mode
function M.xmap(mapping, command, options)
  M.map('x', mapping, command, options)
end

--- Map the given shortcuts to the command in insert, command-line, and Lang-Arg modes.
---
--- @param mapping string: Shortcuts for the command
--- @param command string: Command to perform
--- @param options table: Additional options for mapping (optional)
---
--- @example
--- M.lmap('<C-l>', ':Lang<CR>')
--- Maps '<C-l>' to ':Lang<CR>' in insert, command-line, and Lang-Arg modes
function M.lmap(mapping, command, options)
  M.map('l', mapping, command, options)
end

-- Files

--- Remove the extension from a file name.
---
--- @param file_name string: The file name with extension
---
--- @return string: The file name without extension
---
--- @example
--- local file_name = "example.txt"
--- local name_without_ext = M.remove_extension(file_name)
--- name_without_ext is "example"
function M.remove_extension(file_name)
  return file_name:match("(.+)%..+$") or file_name
end

--- Get the extension from a file name.
---
--- @param file_name string: The file name with extension
---
--- @return string: The extension including the dot (e.g., ".txt")
---
--- @example
--- local file_name = "example.txt"
--- local extension = M.get_extension(file_name)
--- extension is ".txt"
function M.get_extension(file_name)
  return file_name:match("^.+(%..+)$")
end

--- Check if a file exists.
---
--- @param file_name string: The file name to check
---
--- @return boolean: True if the file exists, otherwise false
---
--- @example
--- local exists = M.file_exists("example.txt")
--- exists is true if "example.txt" exists, otherwise false
function M.file_exists(file_name)
  local file = io.open(file_name, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

--- Generate a spec file name based on the original file name,
--- allowing a custom connector for the "spec" word.
---
--- @param file_name string: The original file name
--- @param connector string: (optional) The connector string to join the base name and "spec". Default is "_".
---
--- @return string: The spec file name (e.g., "example_spec.txt" or "example-spec.txt")
---
--- @example
--- local spec_file = M.spec_file("example.txt") -- spec_file is "example_spec.txt"
--- local spec_file = M.spec_file("example.txt", "-") -- spec_file is "example-spec.txt"
function M.spec_file(file_name, connector)
  if file_name:match("^.+[" .. connector .. "]spec%..+$") then
    return file_name
  end
  local extension = M.get_extension(file_name)
  if extension then
    return M.remove_extension(file_name) .. connector .. 'spec' .. extension
  else
    return M.remove_extension(file_name) .. connector .. 'spec'
  end
end

--- Get significant segments of a file path.
---
--- @param file_path string: The full file path
--- @param significant_segments number: Number of significant segments to keep
---
--- @return string: A string representing the significant segments of the file path
---
--- @example
--- local path = M.significant_file_path_segments("/home/user/project/file.lua", 2)
--- path is "user/project/file.lua"
function M.significant_file_path_segments(file_path, significant_segments)
  local file_path_segments = string_utils.split(file_path, '/')
  local result = ''
  local significant_segments_start_index = #file_path_segments - significant_segments + 1
  if #file_path_segments > significant_segments then
    result = table.concat(file_path_segments, '/', significant_segments_start_index)
  else
    result = table.concat(file_path_segments, '/')
  end
  return result
end

return M
