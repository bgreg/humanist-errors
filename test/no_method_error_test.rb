require 'minitest/autorun'
require_relative '../test_helper'

class NoMethodErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_undefined_method_on_nil
    error            = assert_raises(NoMethodError) { 
      eval('nil.nonexistentMethod') 
    } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil]
    assert_message(expected_message, error)
  end  
end
