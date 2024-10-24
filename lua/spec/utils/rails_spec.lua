local M = require('utils.rails')

describe("is_controller_file function", function()
  it("returns true for controller files", function()
    local file_name = "users_controller.rb"
    assert.is_true(M.is_controller_file(file_name))
  end)

  it("returns false for non-controller files", function()
    local file_name = "user.rb"
    assert.is_false(M.is_controller_file(file_name))
  end)
end)

describe("remove_app_from_path function", function()
  it("removes 'app/' from the file path", function()
    local file_name = "app/models/user.rb"
    assert.are.equal("models/user.rb", M.remove_app_from_path(file_name))
  end)
end)

describe("remove_first_namespace_from_path function", function()
  it("removes 'app/' and the first segment from the file path", function()
    local file_name = "app/models/user.rb"
    assert.are.equal("user.rb", M.remove_first_namespace_from_path(file_name))
  end)

  it("returns file path if does not have any namespaces", function()
    local file_name = "user.rb"
    assert.are.equal("user.rb", M.remove_first_namespace_from_path(file_name))
  end)
end)

describe("class_name_from_path function", function()
  it("converts the file path to class name", function()
    assert.are.equal(
      "Namespaces::ModelUser",
      M.class_name_from_path("models/namespaces/model_user")
    )
  end)
end)
