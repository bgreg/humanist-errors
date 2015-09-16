require "test_helper"

class NoMethodErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_error_mapper_for_no_method_error
    assert_error_map("undefined method `nonexistentMethod' for nil:NilClass",
                     :no_method_error, :undefined_method_for_nil) 
  end
end
