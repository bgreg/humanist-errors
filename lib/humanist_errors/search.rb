module HumanistErrors
  class Search
    attr_accessor :found_error

    def initialize(error_object, ruby_error_message)
      @found_error = find(error_object, ruby_error_message)
    end

    private 

    def find(error_object, ruby_error_message)
      case error_object
      when SyntaxError
        HumanistErrors::ERROR_MAPPER[:syntax_error][ruby_error_message]
      when NoMethodError
        HumanistErrors::ERROR_MAPPER[:no_method_error][ruby_error_message]
      end
    end
  end
end

