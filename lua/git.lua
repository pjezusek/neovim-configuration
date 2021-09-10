local M = {}

function M.gitRoot()
  local pipe = io.popen('git rev-parse --show-toplevel 2> /dev/null')
  return pipe:read()
end

function M.gitBranchName()
  local pipe = io.popen("git branch | grep '*' | cut -f2 -d' ' 2> /dev/null")
  return pipe:read()
end

return M
