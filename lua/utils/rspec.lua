local utils = require('utils.generic')
local rails_utils = require('utils.rails')

local M = {}

local RSpec_keywords = {
  'it',
  'describe',
  'context'
}

--- Converts a given file name to its corresponding spec file name.
-- If the file is a controller, it modifies the file name appropriately before converting.
---
--- @param file_name string: The name of the file to convert.
---
--- @return string: The corresponding spec file name.
---
--- @example
--- M.spec_file("app/controllers/users_controller.rb") -- returns "spec/controllers/users_spec.rb"
--- M.spec_file("app/models/user.rb") -- returns "spec/models/user_spec.rb"
function M.spec_file(file_name)
  if rails_utils.is_controller_file(file_name) then
    return utils.spec_file(file_name:gsub("_controller(%..+)$", "%1"), '_')
  else
    return utils.spec_file(file_name, '_')
  end
end

--- Finds the corresponding spec file for the current file and opens it using Telescope.
---
--- @example
--- -- In a Neovim buffer, call the function to find the spec file for the current file.
--- M.find_spec_file()
function M.find_spec_file()
  local relative_path = rails_utils.remove_app_from_path(vim.fn.expand('%'))
  local file_name = utils.significant_file_path_segments(M.spec_file(relative_path), 2)
  require('telescope.builtin').find_files({ default_text = file_name })
end

--- Checks if a given line contains an RSpec 'do' block.
---
--- @param line string: The line to check.
---
--- @return boolean: True if the line contains an RSpec 'do' block, false otherwise.
---
--- @example
--- M.check_if_rspec_do_block("it 'does something' do") -- returns true
--- M.check_if_rspec_do_block("puts 'Hello World'") -- returns false
function M.check_if_rspec_do_block(line)
  for _, keyword in ipairs(RSpec_keywords) do
    local match = line:match(keyword .. "(.+)do$")
    if match then
      return true
    end
  end
  return false
end

--- Toggles the focus for a given line number in an RSpec 'do' block.
--- Adds or removes ', focus: true' before the 'do' keyword.
---
--- @param line_number number: The line number to toggle focus for.
---
--- @example
--- -- In a Neovim buffer, toggle focus for line number 10.
--- M.toggle_focus_for_line(10)
function M.toggle_focus_for_line(line_number)
  local current_line = vim.fn.getline(line_number)
  if current_line:match(', focus: true do$') then
    local updated_line = current_line:gsub(', focus: true do$', ' do')
    vim.fn.setline(line_number, updated_line)
  else
    local updated_line = current_line:gsub(' do$', ', focus: true do')
    vim.fn.setline(line_number, updated_line)
  end
end

--- Toggles the focus for the current line or the nearest RSpec 'do' block.
---
--- @example
--- -- In a Neovim buffer, toggle focus for the current line or nearest RSpec 'do' block.
--- M.toggle_focus()
function M.toggle_focus()
  local current_line = vim.api.nvim_get_current_line()

  if M.check_if_rspec_do_block(current_line) then
    M.toggle_focus_for_line(vim.fn.line('.'))
    return
  end

  local node = vim.treesitter.get_node()
  while node do
    local row = node:start()
    local node_start_line = vim.fn.getline(row + 1)
    if not M.check_if_rspec_do_block(node_start_line) then
      node = node:parent()
    else
      M.toggle_focus_for_line(row + 1)
      break
    end
  end
end

--- Creates a Rails RSpec file for the current file if it does not already exist.
---
--- @example
--- -- In a Neovim buffer, create a spec file for the current Rails file.
--- M.create_rails_rspec_file()
function M.create_rails_rspec_file()
  local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
  local spec_file = 'spec/' .. rails_utils.remove_app_from_path(M.spec_file(path))
  if utils.file_exists(spec_file) then return end

  local root = vim.treesitter.get_node()
  if not root then return end

  local spec_dir = spec_file:match("(.+)/")

  os.execute("mkdir -p " .. spec_dir)

  local file = io.open(spec_file, "w")
  if not file then return end

  file:write("require 'rails_helper'\n")
  file:write("\n")
  file:write("RSpec.describe " .. rails_utils.class_name_from_path(path) .. " do\n")
  file:write("end\n")
  file:close()
end

return M
