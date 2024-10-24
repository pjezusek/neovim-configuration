local M = require 'utils.rspec'

describe("spec_file", function()
  it("removes _controller and adds _spec if it is controller", function()
    assert.are.equal('some_objects_spec.rb', M.spec_file('some_objects_controller.rb'))
  end)

  it("adds _spec to the file name", function()
    assert.are.equal('some_objects_spec.rb', M.spec_file('some_objects_spec.rb'))
  end)
end)

describe("check_if_rspec_do_block", function()
  it("returns true if the line ends with an RSpec keyword followed by ' do'", function()
    assert.is_true(M.check_if_rspec_do_block("it 'does something' do"))
    assert.is_true(M.check_if_rspec_do_block("describe 'a thing' do"))
    assert.is_true(M.check_if_rspec_do_block("context 'in a context' do"))
  end)

  it("returns false if the line does not end with an RSpec keyword followed by ' do'", function()
    assert.is_false(M.check_if_rspec_do_block("its 'does something'"))
    assert.is_false(M.check_if_rspec_do_block("it 'does something' do not"))
    assert.is_false(M.check_if_rspec_do_block("context 'in a context'"))
    assert.is_false(M.check_if_rspec_do_block("random line"))
  end)
end)
