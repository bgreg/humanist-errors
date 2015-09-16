require 'test_helper'

class ZeroDivisionErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_divide_by_zero
    assert_error_map("ZeroDivisionError: divided by 0", :zero_division_error, :divide_by_zero)
  end
end
