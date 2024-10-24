local M = require 'utils.generic'

describe("remove_extension", function()
  it("removes the extension from a file name", function()
    assert.are.equal("example", M.remove_extension("example.txt"))
  end)

  it("returns the original file name if there's no extension", function()
    assert.are.equal("example", M.remove_extension("example"))
  end)
end)

describe("spec_file", function()
  it("appends '_spec' to a file name without an extension", function()
    assert.are.equal("example_spec", M.spec_file("example", '_'))
  end)

  it("adds spec to the file '_spec'", function()
    assert.are.equal("example_spec.txt", M.spec_file("example.txt", '_'))
  end)

  it("does not add spec to the file if spec is already there", function()
    assert.are.equal("example_spec.txt", M.spec_file("example_spec.txt", '_'))
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
