require '/Users/Chester/code/humanist-errors/lib/humanist_errors/humanist_errors'
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
    def initialize(original_error)
    end

    def found_error
      "You may have missed an argument and ended this line early with a semicolon."
    end

  end
end

class SyntaxErrorTest < Minitest::Test
  def setup
    @error = assert_raises SyntaxError do
      eval('1+;') 
    end
  end

  def test_message_for_unexpected_semicolon
    assert_match /#{HumanistErrors::STARTING_TOKEN} You may have missed an argument and ended this line early with a semicolon. #{HumanistErrors::ENDING_TOKEN}/, @error.message
  end

  def test_message_for_unterminated_string_meets_end_of_file
  end
end
