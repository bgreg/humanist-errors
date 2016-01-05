require 'test_helper'

class SearchTest < Minitest::Test
  def test_finds_a_human_error
    error = HumanistErrors::Search.run(
      NameError,
     "NameError: undefined local variable or method `asdf' for main:Object"
    )
    expected_result =  HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word]
    assert(error == expected_result, "#{error.inspect} does not equal: #{expected_result.inspect}")
  end

  class DefinitelyNotARealException; end

  def test_cannot_find_a_error_message
    error = HumanistErrors::Search.run(DefinitelyNotARealException, "blah blah blah")
    assert(error == :no_result, "#{error.inspect} does not equal: :no_result")
  end
end
