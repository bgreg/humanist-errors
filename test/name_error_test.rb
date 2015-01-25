require_relative '../test_helper'

class NoMethodErrorTest < Minitest::Test
  
  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  def test_message_for_random_undefined_word
    error = assert_raises(NameError) { 
      eval('asdf') 
    } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

end
