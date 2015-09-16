require 'test_helper'
require "stringio"

class SyntaxErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_unexpected_semicolon
    error_message = human_fork(SyntaxError) do 
      eval('1+;')
    end

    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
    assert_match(expected_message, error_message)
  end
end
