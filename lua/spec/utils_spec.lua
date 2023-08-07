local M = require 'utils'

describe("remove_extension", function()
  it("removes the extension from a file name", function()
    assert.are.equal("example", M.remove_extension("example.txt"))
  end)

  it("returns the original file name if there's no extension", function()
    assert.are.equal("example", M.remove_extension("example"))
  end)
end)

describe("spec_file", function()
  it("appends '.spec' to a file name without an extension", function()
    assert.are.equal("example_spec", M.spec_file("example"))
  end)

  it("adds spec to the file '.spec'", function()
    assert.are.equal("example_spec.txt", M.spec_file("example.txt"))
  end)

  it("does not add spec to the file if spec is already there", function()
    assert.are.equal("example_spec.txt", M.spec_file("example_spec.txt"))
  end)
end)

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

describe("significant_file_path_segments", function()
  it("returns all segments if the number of segments is less than significant_segments", function()
    local result = M.significant_file_path_segments("a/b/c", 4)
    assert.are.equal("a/b/c", result)
  end)

  it("returns the last significant_segments if the number of segments is greater than significant_segments", function()
    local result = M.significant_file_path_segments("a/b/c/d/e", 3)
    assert.are.equal("c/d/e", result)
  end)

  it("returns the whole path if significant_segments is equal to the number of segments", function()
    local result = M.significant_file_path_segments("a/b/c", 3)
    assert.are.equal("a/b/c", result)
  end)
end)

describe("file_exists function", function()
  it("returns true if file exists", function()
    local temp_file = io.open("temp.txt", "w")
    if not temp_file then return end

    temp_file:write("temporary content")
    temp_file:close()

    assert.True(M.file_exists("temp.txt"))

    os.remove("temp.txt")
  end)

  it("returns false if file does not exist", function()
    assert.False(M.file_exists("nonexistent_file.txt"))
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

describe("map function", function()
  it("applies the given function to each element of the table", function()
    local numbers = {1, 2, 3, 4, 5}
    local expected = {2, 4, 6, 8, 10}
    local result = M.map(numbers, function(x) return x * 2 end)
    assert.are.same(expected, result)
  end)

  it("returns an empty table if the input table is empty", function()
    local numbers = {}
    local expected = {}
    local result = M.map(numbers, function(x) return x * 2 end)
    assert.are.same(expected, result)
  end)

  it("handles tables with non-numeric values", function()
    local words = {"hello", "world"}
    local expected = {"HELLO", "WORLD"}
    local result = M.map(words, function(x) return string.upper(x) end)
    assert.are.same(expected, result)
  end)
end)



