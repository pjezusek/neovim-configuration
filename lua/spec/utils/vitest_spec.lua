local M = require 'utils.vitest'

describe("spec_file", function()
  it("adds .spec to the file name", function()
    assert.are.equal('some_objects.spec.ts', M.spec_file('some_objects.ts'))
  end)
end)
