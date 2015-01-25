require_relative '../test_helper'

class NoMethodErrorTest < Minitest::Test

  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  def test_message_for_undefined_method_on_nil
    error            = assert_raises(NoMethodError) { 
      eval('nil.nonexistentMethod') 
    } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end  

end
