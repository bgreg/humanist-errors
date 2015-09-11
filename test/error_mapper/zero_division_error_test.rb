require 'test_helper'

class ZeroDivisionErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_divide_by_zero
    error = "ZeroDivisionError: divided by 0"
    expected_message = HumanistErrors::ERROR_MAPPER[:zero_division_error][error]
    assert_message(expected_message, error)
  end
end
