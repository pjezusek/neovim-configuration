local M = require 'utils.vitest'

describe("spec_file", function()
  it("adds .spec to the file name", function()
    assert.equal('some_objects.spec.ts', M.spec_file('some_objects.ts'))
  end)
end)

describe("check_if_vitest_block", function()
  it("returns true if the line matches a Vitest block structure", function()
    assert.is_true(M.check_if_vitest_block("test('does something', () => {"))
    assert.is_true(M.check_if_vitest_block("test.only('does something', () => {"))
    assert.is_true(M.check_if_vitest_block("describe('a thing', () => {"))
    assert.is_true(M.check_if_vitest_block("describe.only('a thing', () => {"))
    assert.is_true(M.check_if_vitest_block("it('works', () => {"))
    assert.is_true(M.check_if_vitest_block("it.only('works', () => {"))
  end)

  it("returns false if the line does not match a Vitest block structure", function()
    assert.is_false(M.check_if_vitest_block("tests('does something', () => {"))
    assert.is_false(M.check_if_vitest_block("random line of code"))
  end)
end)
