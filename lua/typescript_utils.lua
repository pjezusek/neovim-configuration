local M = {}

--- Removes the 'app/' prefix from the given file path.
-- @param file_name The file path to modify.
-- @return string The file path without the 'app/' prefix.
-- @example
-- M.remove_app_from_path("app/models/user.rb") -- returns "models/user.rb"
-- M.remove_app_from_path("lib/tasks/task.rake") -- returns "lib/tasks/task.rake"
function M.remove_src_from_path(file_name)
  return file_name:gsub("app/", "")
end

return M
