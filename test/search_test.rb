require 'test_helper'

class SearchTest < Minitest::Test

  def test_finds_a_human_error
    searcher = HumanistErrors::Search.run(NameError,
                                          "NameError: undefined local variable or method `asdf' for main:Object")
    expected_result =  HumanistErrors::MESSAGE_DICTIONARY[:name_error][:undefined_word]
    assert(searcher.found_error == expected_result, "#{searcher.found_error.inspect} does not equal: #{expected_result.inspect}") 
  end
end


