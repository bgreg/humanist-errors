module HumanistErrors
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
      /.*/                                     => :no_result
    ],
    name_error: HumanistErrors::RegexHash[
      /undefined local variable or method `.*'/ => MESSAGE_DICTIONARY[:name_error][:undefined_word],
      /.*/                                      => :no_result
    ],
    zero_division_error: HumanistErrors::RegexHash[
      /divided by 0/ => MESSAGE_DICTIONARY[:zero_division_error][:divide_by_zero],
      /.*/           => :no_result
    ],

    load_error: HumanistErrors::RegexHash[
      /no such file to load/ => MESSAGE_DICTIONARY[:load_error][:no_file],
      /.*/                   => :no_result
    ]
  }
end
