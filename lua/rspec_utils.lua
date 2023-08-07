local utils = require('utils')
local rails_utils = require('rails_utils')

local M = {}

local RSpec_keywords = {
  'it',
  'describe',
  'context'
}

function M.spec_file(file_name)
  if rails_utils.is_controller_file(file_name) then
    return utils.spec_file(file_name:gsub("_controller(%..+)$", "%1"))
  else
    return utils.spec_file(file_name)
  end
end

function M.find_spec_file()
  local relative_path = rails_utils.remove_app_from_path(vim.fn.expand('%'))
  local file_name = utils.significant_file_path_segments(M.spec_file(relative_path), 2)
  require('telescope.builtin').find_files({ default_text = file_name })
end

function M.check_if_rspec_do_block(line)
  for _, keyword in ipairs(RSpec_keywords) do
    local match = line:match(keyword .. "(.+)do$")
    if match then
      return true
    end
  end
  return false
end

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

function M.create_rails_rspec_file()
  local path = vim.fn.expand('%')
  local spec_file = 'spec/' .. rails_utils.remove_app_from_path(M.spec_file(path))
  if utils.file_exists(spec_file) then return end

  local root = vim.treesitter.get_node()
  if not root then return end

  local spec_dir = spec_file:match("(.+)/")

  os.execute("mkdir -p " .. spec_dir)

  local file = io.open(spec_file, "w")
  if not file then return end

  file:write("require 'rails_helper'\n")
  file:write("RSpec.describe " .. rails_utils.class_name_from_path(path) .. " do\n")
  file:write("end\n")
  file:close()
end

return M
