package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/lua/?.lua"
local G = require "git"
local M = {}

function M.RSpecFailedSpecs(rspecResultFile)
  local f = io.open(G.gitRoot() .. '/' .. rspecResultFile)
  local temporaryResults = {}
  local failedSpecs = {}
  for l in f:lines() do
    if string.find(l, 'failed') then
      local separatorPosition = string.find(l, '|')
      local result = l:sub(0, separatorPosition - 1)
                      :gsub('%s', '')
                      :gsub('%[[^%]]+]', '')
      temporaryResults[result] = result
    end
  end
  for _, v in pairs(temporaryResults) do
    table.insert(failedSpecs, v)
  end
  return failedSpecs
end

function M.RSpecFailedToQuickfixList(rspecResultFile, openQuickfixList)
  openQuickfixList = openQuickfixList or true
  local vimDictionary = {}
  for _, v in pairs(M.RSpecFailedSpecs(rspecResultFile)) do
    table.insert(vimDictionary, {
        filename=v,
        lnum=1,
        text='File with failed specs'
    })
  end
  vim.fn.setqflist(vimDictionary, 'r')
  vim.api.nvim_command('copen | cfirst')
end


return M

