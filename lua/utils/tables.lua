local M = {}

--- Applies a given function to each element of the table and returns a new table with the results.
---
--- @param tbl table: The table to map over.
--- @param func function: The function to apply to each element of the table.
---
--- @return table: A new table with the results of applying func to each element.
---
--- @example
--- local numbers = {1, 2, 3, 4, 5}
--- local function square(x) return x * x end
--- local squared_numbers = M.map(numbers, square)
--- squared_numbers is now {1, 4, 9, 16, 25}
function M.map(tbl, func)
  local new_tbl = {}
  for i, v in ipairs(tbl) do
    new_tbl[i] = func(v)
  end
  return new_tbl
end

--- Creates a shallow copy of the given table.
---
--- @param source table: The table to be cloned.
---
--- @return table: A new table that is a shallow copy of the source table.
---
--- @example
--- local original = {a = 1, b = 2, c = 3}
--- local copy = M.clone_table(original)
--- copy.a = 10
--- original.a is still 1, copy.a is now 10
function M.clone_table(source)
  local clone = {}
  for key, value in pairs(source) do
    clone[key] = value
  end
  return clone
end

return M
