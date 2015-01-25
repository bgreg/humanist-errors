require_relative '../test_helper'

class SyntaxErrorTest < Minitest::Test
  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  def test_message_for_unexpected_semicolon
    error            = assert_raises(SyntaxError) { eval('1+;') }
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_unterminated_string_meets_end_of_file
    error            = assert_raises(SyntaxError) { eval('"') } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:open_quote]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_single_percent_sign
    error            = assert_raises(SyntaxError) { eval('%') } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:string_formatter]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_missing_argument
    error            = assert_raises(SyntaxError) { eval('puts "foo", ') } 
    expected_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:missing_argument]
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
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
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end
end
