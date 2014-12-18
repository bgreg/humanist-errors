require 'minitest/autorun'

class SyntaxError
  def message
    searcher = HumanistErrors::Search.new(super)
    "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN}" + super
  end
end

module HumanistErrors
  STARTING_TOKEN = "Hi!"
  ENDING_TOKEN   = "Here's the error from Ruby: "

  class Search
    attr_accessor :found_error

    def initialize(target)
      @found_error = find(target)
    end

    private 

    def find(target)
     case target.to_s
     when /syntax error, unexpected ';'/
      "You may have missed an argument and ended this line early with a semicolon."
     when /unterminated string meets end of file/
       "It looks like you typed an open quote near the end of the file."
     when /unterminated quoted string meets end of file/
       "% string formatter requires a string argument on the left, and a format argument on the right"
     when /expecting keyword_end/
       "a block or method was started, but you forgot to add 'end'"
     when /syntax error, unexpected end-of-input/
       "You indicated that you wanted to send another argument, but we did not see anything."
     end
    end
  end

end


class SyntaxErrorTest < Minitest::Test
  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  def test_message_for_unexpected_semicolon
    expected_message = "You may have missed an argument and ended this line early with a semicolon."
    error            = assert_raises(SyntaxError) { eval('1+;') }
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_unterminated_string_meets_end_of_file
    expected_message = "It looks like you typed an open quote near the end of the file."
    error            = assert_raises(SyntaxError) { eval('"') } 
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_single_percent_sign
    expected_message = "% string formatter requires a string argument on the left, and a format argument on the right"
    error            = assert_raises(SyntaxError) { eval('%') } 
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for_missing_argument
    expected_message = "You indicated that you wanted to send another argument, but we did not see anything."
    error            = assert_raises(SyntaxError) { eval('puts "foo", ') } 
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end

  def test_message_for
    expected_message = "a block or method was started, but you forgot to add 'end'"
    error            = assert_raises(SyntaxError) {
    eval('
          def test
            1
          en 
    ')} 
    assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  end
end
