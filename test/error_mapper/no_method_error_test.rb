require "test_helper"

class NoMethodErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_error_mapper_for_no_method_error
    ruby_error = "undefined method `nonexistentMethod' for nil:NilClass"
    result = HumanistErrors::ERROR_MAPPER[:no_method_error][ruby_error]
    assert_result(result)
    assert_match(result, HumanistErrors::MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil])
  end
end
