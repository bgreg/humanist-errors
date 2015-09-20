require 'yaml'
require 'humanist_errors/version'
require 'humanist_errors/exception_extensions'
require 'humanist_errors/regex_hash'
require 'humanist_errors/search'

module HumanistErrors
  STARTING_TOKEN     = "Hi!\n"
  ENDING_TOKEN       = "Here's the error from Ruby: "
  MESSAGE_DICTIONARY = YAML.load(File.read(File.expand_path('../../dictionaries/humanist_errors.en.yml', __FILE__)))


  def with_human_errors
    require 'humanist_errors/monkey'
    yield
  end
end

require 'humanist_errors/error_mapper'



