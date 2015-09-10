require 'minitest/autorun'
require_relative '../test_helper'

class ZeroDivisionErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_divide_by_zero
    error = assert_raises(ZeroDivisionError) { eval('12/0') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:zero_division_error][:divide_by_zero]
    assert_message(expected_message, error)
  end
end
