# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

require 'humanist_errors'
require 'humanist_errors/search'
require 'minitest/focus'
require 'minitest/emoji'
require 'minitest/autorun'

module HumanistErrorsSupport
  def assert_result(message)
    assert(message != :no_result, "no result was found")
  end
end


# integration tests should run bad ruby in a seperate thread and watch it crash
