require 'test_helper'

class SyntaxErrorTest < Minitest::Test
  def test_message_for_unexpected_semicolon
    error_message = human_fork(SyntaxError) { eval('1+;') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
    assert_match(expected_message, error_message)
  end

  def test_message_for_missing_end
    error_message = human_fork(SyntaxError) do
      eval(
        " def stuff
            opps = 'I did it again'
        "
      )
    end
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:missing_block_closer]
    assert_match(expected_message, error_message)
  end
end
