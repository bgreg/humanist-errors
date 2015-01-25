require_relative  '../test_helper'

class HumanistTest < Minitest::Test
  def setup
    @starting_token = HumanistErrors::STARTING_TOKEN
    @ending_token   = HumanistErrors::ENDING_TOKEN
  end

  def test_error_mapper_for_syntax_error
    humanist_message = HumanistErrors::ERROR_MAPPER[:syntax_error]["syntax error, unexpected ';'"]
    real_humanist_message = HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon]
    assert_match(humanist_message, real_humanist_message)
  end

  def test_error_mapper_for_no_method_error
    humanist_message = HumanistErrors::ERROR_MAPPER[:no_method_error]["undefined method `nonexistentMethod' for nil:NilClass"]
    real_humanist_message = HumanistErrors::MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil]
    assert_match(humanist_message, real_humanist_message)
  end

  def test_unexpected_semicolon
    ruby_message = "syntax error, unexpected ';'"
    syntax_error = SyntaxError.new
    search = HumanistErrors::Search.new(syntax_error, ruby_message)
    assert_match(search.found_error, HumanistErrors::MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon])
  end
end
