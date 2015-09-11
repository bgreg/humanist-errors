require "test_helper"

class NoMethodErrorTest < Minitest::Test
  def test_error_mapper_for_no_method_error
    humanist_message = HumanistErrors::ERROR_MAPPER[:no_method_error]["undefined method `nonexistentMethod' for nil:NilClass"]
    real_humanist_message = HumanistErrors::MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil]
    assert_match(humanist_message, real_humanist_message)
  end
end
