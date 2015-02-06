require 'humanist_errors'
require 'humanist_errors/search'
require 'minitest/autorun'
require 'minitest/emoji'

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
