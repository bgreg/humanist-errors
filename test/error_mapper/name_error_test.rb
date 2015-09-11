require "test_helper"

class NameErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_random_undefined_word
    # error = assert_raises(NameError) { eval('asdf') }
    ruby_error = "NameError: undefined local variable or method `asdf' for main:Object"
    result = HumanistErrors::ERROR_MAPPER[:name_error][ruby_error]
    assert_result(result)
    assert_match(result, HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word])
  end
end
