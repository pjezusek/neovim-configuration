local M = require "lua/rspec"

describe('RSpecFailedSpecs', function()
  it('returns list of failed spec files', function()
    local result = M.RSpecFailedSpecs('spec/dummy_git_repository/.rspec_status')
    local numberOfEntries = 0
    for _ in pairs(result) do
      numberOfEntries = numberOfEntries + 1
    end
    assert.are.equal(numberOfEntries, 2)
    local testsTable = {
      ['./spec/db/some_not_passed_file.rb']=false,
      ['./spec/db/some_other_not_passed_file.rb']=false
    }
    for _, v in pairs(result) do
      testsTable[v] = true
    end
    for _, v in pairs(testsTable) do
      assert.are.equal(true, v)
    end
  end)
end)
