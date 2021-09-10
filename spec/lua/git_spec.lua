local pathUtils = require 'pl.path'
local M = require "lua/git"

describe('gitRoot', function()
  it('returns git root dir', function()
    assert.are.equal(
      pathUtils.abspath('spec/dummy_git_repository'),
      M.gitRoot()
    )
  end)
end)

describe('gitBranchName', function()
  it('returns actual git branch', function()
    assert.are.equal('master', M.gitBranchName())
  end)
end)
