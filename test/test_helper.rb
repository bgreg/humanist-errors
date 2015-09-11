# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

require 'humanist_errors'
require 'humanist_errors/search'
require 'minitest/focus'
require 'minitest/emoji'
require 'minitest/autorun'

module HumanistErrorsSupport
  def assert_message(message, error)
    message_string = [HumanistErrors::STARTING_TOKEN, message, HumanistErrors::ENDING_TOKEN].join(" ")
    assert error.message.include?(message_string)
  end
end


# integration tests should run bad ruby in a seperate thread and watch it crash
