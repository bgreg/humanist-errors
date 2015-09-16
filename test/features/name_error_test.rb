require 'test_helper'

class NoMethodErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_random_undefined_word
    # error = assert_raises(NameError) { eval('asdf') }
    # expected_message = HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word]
    # assert_message(expected_message, error)
  end
end
