local utils = require('utils')

local M = {}

function M.is_controller_file(file_name)
  if file_name:match("^.+_controller%..+$") then
    return true
  else
    return false
  end
end

function M.remove_app_from_path(file_name)
  return file_name:gsub("app/", "")
end

function M.remove_first_namespace_from_path(file_name)
  local result = M.remove_app_from_path(file_name)
  local file_path_segments = utils.split(result, '/')
  if #file_path_segments < 2 then
    return result
  end
  return table.concat(file_path_segments, '/', 2)
end

function M.class_name_from_path(file_path)
  local class_in_path_format = utils.remove_extension(M.remove_first_namespace_from_path(file_path))
  local file_path_segments = utils.split(class_in_path_format, '/')
  local result = utils.map(file_path_segments, function(x) return utils.to_pascal_case(x) end)
  return table.concat(result, '::')
end

return M
