require_relative '../lib/humanist_errors/humanist_errors'
require_relative '../lib/humanist_errors/search'
require 'minitest/autorun'
require 'minitest/emoji'

class SyntaxErrorTest < Minitest::Test
  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  # unit test
    def test_error_mapper
      humanist_message = HumanistErrors::ERROR_MAPPER[:syntax_error]["syntax error, unexpected ';'"]
      real_humanist_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
      assert_match(humanist_message, real_humanist_message)
    end

    def test_unexpected_semicolon
      ruby_message = "syntax error, unexpected ';'"
      syntax_error = SyntaxError.new
      search = HumanistErrors::Search.new(syntax_error, ruby_message)
      assert_match(search.found_error, HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon])
    end
  # /unit test

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

  def test_message_for
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
