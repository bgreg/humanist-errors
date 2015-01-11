require 'minitest/autorun'

class SyntaxError
  def message
    searcher = HumanistErrors::Search.new(self, super)
    "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN} \n" + super
  end
end

class NoMethodError
  def message
    searcher = HumanistErrors::Search.new(self, super)
    "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN} \n" + super
  end  
end

class RegexHash < Hash
  def [](value)
    self.select {|k| k =~ value}.shift[1]
  end
end

module HumanistErrors
  STARTING_TOKEN = "Hi!\n"
  ENDING_TOKEN   = "Here's the error from Ruby: "

  MESSAGE_DICTIONARY = {
    syntax_error: {
      unexpected_semi_colon: "You may have missed an argument and ended this line early with a semicolon.",
    }
  }

  ERROR_MAPPER = {
    syntax_error: RegexHash[
      /syntax error, unexpected ';'/ => MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon],
    ],
    no_method_error: RegexHash[],
  }

# case ruby_error_message.to_s
     # when /syntax error, unexpected ';'/
     #  "You may have missed an argument and ended this line early with a semicolon."
     # when /unterminated string meets end of file/
     #   "It looks like you typed an open quote near the end of the file."
     # when /unterminated quoted string meets end of file/
     #   "% string formatter requires a string argument on the left, and a format argument on the right."
     # when /expecting keyword_end/
     #   "Syntax Error: The error is not on the last line. Go look in the file for an unclosed block."
     # when /syntax error, unexpected end-of-input/
     #   "You indicated that you wanted to send another argument, but we did not see anything."
     # end

  class Search
    attr_accessor :found_error

    def initialize(error_object, ruby_error_message)
      @found_error = find(error_object, ruby_error_message)
    end

    private 

    def find(error_object, ruby_error_message)
      case error_object
      when SyntaxError
        HumanistErrors::ERROR_MAPPER[:syntax_error][ruby_error_message]
      when NoMethodError
        HumanistErrors::ERROR_MAPPER[:no_method_error][ruby_error_message]
      end
    end
  end

end


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

  # def test_message_for_unterminated_string_meets_end_of_file
  #   expected_message = "It looks like you typed an open quote near the end of the file."
  #   error            = assert_raises(SyntaxError) { eval('"') } 
  #   assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  # end

  # def test_message_for_single_percent_sign
  #   expected_message = "% string formatter requires a string argument on the left, and a format argument on the right"
  #   error            = assert_raises(SyntaxError) { eval('%') } 
  #   assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  # end

  # def test_message_for_missing_argument
  #   expected_message = "You indicated that you wanted to send another argument, but we did not see anything."
  #   error            = assert_raises(SyntaxError) { eval('puts "foo", ') } 
  #   assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  # end

  # def test_message_for
  #   expected_message = "a block or method was started, but you forgot to add 'end'"
  #   error            = assert_raises(SyntaxError) {
  #   eval('
  #         def test
  #           1
  #         en 
  #   ')}

  #   assert_match /#{@starting_token} #{expected_message} #{@ending_token}/, error.message
  # end
end
