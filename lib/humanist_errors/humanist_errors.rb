require_relative 'monkey'
require_relative 'regex_hash'

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
    }
  }

  ERROR_MAPPER = {
    syntax_error: HumanistErrors::RegexHash[
      /syntax error, unexpected ';'/                 => MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon],
      /unterminated string meets end of file/        => MESSAGE_DICTIONARY[:syntax_error][:open_quote],
      /unterminated quoted string meets end of file/ => MESSAGE_DICTIONARY[:syntax_error][:string_formatter],
      /syntax error, unexpected end-of-input, expecting keyword_end/ => MESSAGE_DICTIONARY[:syntax_error][:missing_block_closer],
      /syntax error, unexpected end-of-input/        => MESSAGE_DICTIONARY[:syntax_error][:missing_argument],
      /.*/ => :no_result
    ],
    no_method_error: HumanistErrors::RegexHash[],
  }
end