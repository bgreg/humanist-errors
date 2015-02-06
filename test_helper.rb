# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

require 'humanist_errors'
require 'humanist_errors/search'
require 'minitest/autorun'
require 'minitest/emoji'
require 'minitest/focus'

module HumanistErrorsSupport
  def assert_message(message, error)
    message_string = [
     HumanistErrors::STARTING_TOKEN,
     message, 
     HumanistErrors::ENDING_TOKEN
    ].join(" ")

    assert error.message.include?(message_string)
  end
end
