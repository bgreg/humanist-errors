require "test_helper"

class SyntaxErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_error_mapper_for_syntax_error
    assert_error_map("syntax error, unexpected ';'", :syntax_error, :unexpected_semi_colon)
  end

  def test_message_for_unterminated_string_meets_end_of_file
     assert_error_map("unterminated string meets end of file", :syntax_error,  :open_quote)
  end

  def test_message_for_single_percent_sign
    assert_error_map("unterminated quoted string meets end of file", :syntax_error, :string_formatter)
  end

  def test_message_for_missing_block_closer
    assert_error_map(
      'syntax error, unexpected end-of-input, expecting keyword_end',
      :syntax_error,
      :missing_block_closer)
  end
end
