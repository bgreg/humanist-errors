require 'humanist_errors/version'
require 'humanist_errors/human'
require 'humanist_errors/monkey'
require 'humanist_errors/regex_hash'

module HumanistErrors
  STARTING_TOKEN = "Hi!\n"
  ENDING_TOKEN   = "Here's the error from Ruby: "

  MESSAGE_DICTIONARY = {
    syntax_error: {
      unexpected_semi_colon: "You may have missed an argument and ended this line early with a semicolon.",
      open_quote:            "It looks like you typed an open quote near the end of the file.",
      string_formatter:      "% string formatter requires a string argument on the left, and a format argument on the right",
      missing_argument:      "You indicated that you wanted to send another argument, but we did not see anything.",
      missing_block_closer:  "a block or method was started, but you forgot to add 'end'",
    },
    no_method_error: {
      undefined_method_for_nil: "Most likely you forgot to define the variable, or it was turned to nil along the way."
    }, 
    name_error: {
      undefined_word:  "You typed a random string that wasn't defined. It is not a method or variable in this class, or it's ancestors"
    }
  }

  ERROR_MAPPER = {
    syntax_error: HumanistErrors::RegexHash[
      /syntax error, unexpected ';'/ => MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon],
      /unterminated string meets end of file/ => MESSAGE_DICTIONARY[:syntax_error][:open_quote],
      /unterminated quoted string meets end of file/ => MESSAGE_DICTIONARY[:syntax_error][:string_formatter],
      /syntax error, unexpected end-of-input, expecting keyword_end/ => MESSAGE_DICTIONARY[:syntax_error][:missing_block_closer],
      /syntax error, unexpected end-of-input/ => MESSAGE_DICTIONARY[:syntax_error][:missing_argument],
      /.*/ => :no_result
    ],
    no_method_error: HumanistErrors::RegexHash[
      /undefined method `.*' for nil:NilClass/ => MESSAGE_DICTIONARY[:no_method_error][:undefined_method_for_nil],
      /.*/ => :no_result
    ],
    name_error: HumanistErrors::RegexHash[
      /undefined local variable or method `.*'/ => MESSAGE_DICTIONARY[:name_error][:undefined_word],
      /.*/ => :no_result
    ]
  }
end
