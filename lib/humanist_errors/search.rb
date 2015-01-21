module HumanistErrors
  class Search
    attr_accessor :found_error

    def initialize(error_object, ruby_error_message)
      @found_error = find(error_object, ruby_error_message)
    end

    private 

    def find(error_object, ruby_error_message)
      klass = underscore(error_object.to_s)
      HumanistErrors::ERROR_MAPPER[klass.to_sym][ruby_error_message]
    end

    def underscore(string)
      string
        .gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        .gsub(/([a-z\d])([A-Z])/,'\1_\2')
        .tr("-", "_")
        .downcase
    end
  end
end

