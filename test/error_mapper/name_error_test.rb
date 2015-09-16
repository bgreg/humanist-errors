require "test_helper"

class NameErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_random_undefined_word
    assert_error_map("NameError: undefined local variable or method `asdf' for main:Object",
                     :name_error, :undefined_word) 
  end
end
