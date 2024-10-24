local M = {}

--- Split a string by a delimiter.
---
--- @param str string: The string to split
--- @param delimiter string: The delimiter to split by
---
--- @return table: A table of strings resulting from the split
---
--- @example
--- local parts = M.split("one,two,three", ",")
--- parts is {"one", "two", "three"}
function M.split(str, delimiter)
  if str == '' then return {} end
  local result = {}
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

--- Convert a string to PascalCase.
---
--- @param str string: The string to convert
---
--- @return string: The converted PascalCase string
---
--- @example
--- local pascal = M.to_pascal_case("hello_world")
--- pascal is "HelloWorld"
function M.to_pascal_case(str)
  return (str:gsub("_(%a)", function(s)
    return string.upper(s)
  end):gsub("^%l", string.upper))
end

return M
