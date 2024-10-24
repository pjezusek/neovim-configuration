describe("map", function()
  local map = require 'utils.tables'.map

  it("should apply the function to each element of the table", function()
    local numbers = { 1, 2, 3, 4, 5 }
    local function square(x) return x * x end
    local squared_numbers = map(numbers, square)
    assert.are.same(squared_numbers, { 1, 4, 9, 16, 25 })
  end)

  it("should handle empty tables", function()
    local function identity(x) return x end
    local empty_table = {}
    local result = map(empty_table, identity)
    assert.are.same(result, {})
  end)

  it("should handle a table with one element", function()
    local function double(x) return x * 2 end
    local single_element = { 7 }
    local result = map(single_element, double)
    assert.are.same(result, { 14 })
  end)
end)

describe("clone_table", function()
  local clone_table = require 'utils.tables'.clone_table

  it("should create a shallow copy of the table", function()
    local original = { a = 1, b = 2, c = 3 }
    local copy = clone_table(original)
    assert.are.same(copy, original)
    copy.a = 10
    assert.are_not.same(copy, original)
    assert.are.same(original.a, 1)
    assert.are.same(copy.a, 10)
  end)

  it("should handle empty tables", function()
    local empty_table = {}
    local copy = clone_table(empty_table)
    assert.are.same(copy, empty_table)
  end)

  it("should handle tables with mixed types of keys", function()
    local original = { 1, 2, ["a"] = "test", ["b"] = { 3, 4 } }
    local copy = clone_table(original)
    assert.are.same(copy, original)
    copy[1] = 10
    assert.are_not.same(copy, original)
    assert.are.same(original[1], 1)
    assert.are.same(copy[1], 10)
  end)
end)
