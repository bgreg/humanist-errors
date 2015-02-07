require 'yaml'
require 'humanist_errors/version'
require 'humanist_errors/exception_extensions'
require 'humanist_errors/monkey'
require 'humanist_errors/regex_hash'

module HumanistErrors
  STARTING_TOKEN = "Hi!\n"
  ENDING_TOKEN   = "Here's the error from Ruby: "

  MESSAGE_DICTIONARY = YAML.load(File.read(File.expand_path('../../dictionaries/humanist_errors.en.yml', __FILE__)) )

  ERROR_MAPPER = {
    syntax_error: HumanistErrors::RegexHash[
      /syntax error, unexpected ';'/                                 => MESSAGE_DICTIONARY[:syntax_error][:unexpected_semi_colon],
      /unterminated string meets end of file/                        => MESSAGE_DICTIONARY[:syntax_error][:open_quote],
      /unterminated quoted string meets end of file/                 => MESSAGE_DICTIONARY[:syntax_error][:string_formatter],
      /syntax error, unexpected end-of-input, expecting keyword_end/ => MESSAGE_DICTIONARY[:syntax_error][:missing_block_closer],
      /syntax error, unexpected end-of-input/                        => MESSAGE_DICTIONARY[:syntax_error][:missing_argument],
      /.*/                                                           => :no_result
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
