require 'test_helper'

class ZeroDivisionErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_divide_by_zero
    ruby_error = "ZeroDivisionError: divided by 0"
    assert_result(HumanistErrors::ERROR_MAPPER[:zero_division_error][ruby_error])
    assert_match(HumanistErrors::ERROR_MAPPER[:zero_division_error][ruby_error], 
                 HumanistErrors::MESSAGE_DICTIONARY[:zero_division_error][:divide_by_zero])
  end
end
