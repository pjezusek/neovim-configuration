local M = {}

--- Removes the 'src/' prefix from the given file path.
---
--- @param file_name string: The file path to modify.
---
--- @return string: The file path without the 'src/' prefix.
---
--- @example
--- M.remove_src_from_path("src/models/user.ts") -- returns "models/user.ts"
function M.remove_src_from_path(file_name)
  return (file_name:gsub("src/", ""))
end

return M
