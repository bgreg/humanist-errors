# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

require 'humanist_errors'
require 'humanist_errors/search'
require 'humanist_errors/error_mapper'
require 'minitest/focus'
require 'minitest/emoji'
require 'minitest/autorun'

module HumanistErrorsSupport

  def assert_result(message)
    assert(message != :no_result, "no result was found")
  end

  def assert_no_result(message)
    assert(message == :no_result, "no result was found")
  end

  def assert_error_map(ruby_error, exception_symbol, error_symbol)
    result = HumanistErrors::ERROR_MAPPER[exception_symbol][ruby_error]
    assert_result(result)
    assert_match(result, HumanistErrors::MESSAGE_DICTIONARY[exception_symbol][error_symbol])
  end

  def human_fork(exception)
    reader, writer = IO.pipe

    fork do
      reader.close
      require 'humanist_errors/monkey'
      begin
        yield
      rescue exception => e
        writer.puts e.message
      end
    end

    writer.close
    reader.gets(nil)
  ensure
    reader.close
  end
end
