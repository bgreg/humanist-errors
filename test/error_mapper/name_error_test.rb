require "test_helper"

class NameErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_random_undefined_word
    # error = assert_raises(NameError) { eval('asdf') }
    error = "NameError: undefined local variable or method `asdf' for main:Object"
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word]
    assert_match(expected_message, error)
  end
end
