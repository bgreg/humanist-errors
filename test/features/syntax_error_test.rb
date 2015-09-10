require 'minitest/autorun'
require_relative '../test_helper'

class SyntaxErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_unexpected_semicolon
    error            = assert_raises(SyntaxError) { eval('1+;') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
    assert_message(expected_message, error)
  end

  def test_message_for_unterminated_string_meets_end_of_file
    error            = assert_raises(SyntaxError) { eval('"') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:open_quote]
    assert_message(expected_message, error)
  end

  def test_message_for_single_percent_sign
    error            = assert_raises(SyntaxError) { eval('%') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:string_formatter]
    assert_message(expected_message, error)
  end

  def test_message_for_missing_argument
    error            = assert_raises(SyntaxError) { eval('puts "foo", ') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:missing_argument]
    assert_message(expected_message, error)
  end

  def test_message_for_missing_block_closer
    error = assert_raises(SyntaxError) {
      eval('
        def test
          1
        en
      ')
    }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:missing_block_closer]
    assert_message(expected_message, error)
  end
end
