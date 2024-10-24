local utils = require('utils.generic')
local table_utils = require('utils.tables')
local string_utils = require('utils.strings')

local M = {}

--- Checks if the given file name is a controller file.
---
--- @param file_name string: The name of the file to check.
---
--- @return boolean: True if the file name matches the controller file pattern, false otherwise.
---
--- @example
--- M.is_controller_file("users_controller.rb") -- returns true
--- M.is_controller_file("application.rb") -- returns false
function M.is_controller_file(file_name)
  if file_name:match("^.+_controller%..+$") then
    return true
  else
    return false
  end
end

--- Removes the 'app/' prefix from the given file path.
---
--- @param file_name string: The file path to modify.
---
--- @return string: The file path without the 'app/' prefix.
---
--- @example
--- M.remove_app_from_path("app/models/user.rb") -- returns "models/user.rb"
--- M.remove_app_from_path("lib/tasks/task.rake") -- returns "lib/tasks/task.rake"
function M.remove_app_from_path(file_name)
  return (file_name:gsub("app/", ""))
end

--- Removes the first namespace segment from the given file path.
--- Assumes the path has been modified by remove_app_from_path.
---
--- @param file_name string: The file path to modify.
---
--- @return string: The file path without the first namespace segment.
---
--- @example
--- M.remove_first_namespace_from_path("app/models/user.rb") -- returns "models/user.rb"
--- M.remove_first_namespace_from_path("app/admin/reports/sales.rb") -- returns "admin/reports/sales.rb"
function M.remove_first_namespace_from_path(file_name)
  local result = M.remove_app_from_path(file_name)
  local file_path_segments = string_utils.split(result, '/')
  if #file_path_segments < 2 then
    return result
  end
  return table.concat(file_path_segments, '/', 2)
end

--- Converts a file path to a class name in PascalCase format.
--- Removes the first namespace and file extension from the path.
---
--- @param file_path string: The file path to convert.
---
--- @return string: The class name in PascalCase format.
---
--- @example
--- M.class_name_from_path("app/models/user.rb") -- returns "Models::User"
--- M.class_name_from_path("app/controllers/admin/reports/sales_controller.rb") -- returns "Controllers::Admin::Reports::SalesController"
function M.class_name_from_path(file_path)
  local class_in_path_format = utils.remove_extension(M.remove_first_namespace_from_path(file_path))
  local file_path_segments = string_utils.split(class_in_path_format, '/')
  local result = table_utils.map(file_path_segments, function(x) return string_utils.to_pascal_case(x) end)
  return table.concat(result, '::')
end

return M
