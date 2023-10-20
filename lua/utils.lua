local M = {}

-- Files
function M.remove_extension(file_name)
  return file_name:match("(.+)%..+$") or file_name
end

function M.get_extension(file_name)
  return file_name:match("^.+(%..+)$")
end

function M.file_exists(file_name)
  local file = io.open(file_name, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

function M.spec_file(file_name)
  if file_name:match("^.+_spec%..+$") then
    return file_name
  end
  local extension = M.get_extension(file_name)
  if extension then
    return M.remove_extension(file_name) .. '_spec' .. extension
  else
    return M.remove_extension(file_name) .. '_spec'
  end
end

function M.significant_file_path_segments(file_path, significant_segments)
  local file_path_segments = M.split(file_path, '/')
  local result = ''
  local significant_segments_start_index = #file_path_segments - significant_segments + 1
  if #file_path_segments > significant_segments then
    result = table.concat(file_path_segments, '/', significant_segments_start_index)
  else
    result = table.concat(file_path_segments, '/')
  end
  return result
end

-- Strings
function M.split(str, delimiter)
  if str == '' then return {} end
  local result = {}
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

function M.to_pascal_case(str)
  return (str:gsub("_(%a)", function(s)
    return string.upper(s)
  end):gsub("^%l", string.upper))
end

-- Tables
function M.map(tbl, func)
  local new_tbl = {}
  for i, v in ipairs(tbl) do
    new_tbl[i] = func(v)
  end
  return new_tbl
end

function M.clone_table(source)
  local clone = {}
  for key, value in pairs(source) do
    clone[key] = value
  end
  return clone
end

return M
