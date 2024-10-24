local M = require 'utils.strings'

describe("split", function()
  it("splits a string by a given delimiter", function()
    local result = M.split("a,b,c", ",")
    assert.are.same({ "a", "b", "c" }, result)
  end)

  it("returns an empty table if the string is empty", function()
    local result = M.split("", ",")
    assert.are.same({}, result)
  end)

  it("returns the entire string in a table if there's no delimiter", function()
    local result = M.split("abc ", ",")
    assert.are.same({ "abc " }, result)
  end)

  it("does not remove spaces", function()
    local result = M.split("   ", ",")
    assert.are.same({ "   " }, result)
  end)
end)


describe("to_pascal_case function", function()
  it("converts to pascal case with ::", function()
    local input = "hello_world_example"
    local expected = "HelloWorldExample"
    local result = M.to_pascal_case(input)
    assert.are.equal(expected, result)
  end)

  it("converts a string with underscores to PascalCase", function()
    local input = "hello_world_example"
    local expected = "HelloWorldExample"
    local result = M.to_pascal_case(input)
    assert.are.equal(expected, result)
  end)

  it("converts a string without underscores to PascalCase", function()
    local input = "helloworld"
    local expected = "Helloworld"
    local result = M.to_pascal_case(input)
    assert.are.equal(expected, result)
  end)

  it("returns an empty string if the input is empty", function()
    local input = ""
    local expected = ""
    local result = M.to_pascal_case(input)
    assert.are.equal(expected, result)
  end)
end)
