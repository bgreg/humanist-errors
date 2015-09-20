module HumanistErrors
  class Search
    attr_accessor :found_error
    attr_accessor :error_object, :ruby_error_message

    def self.run(error_object, ruby_error_message)
      searcher = new(error_object, ruby_error_message)
      searcher.find
      searcher
    end

    def initialize(error_object, ruby_error_message)
      @ruby_error_message = ruby_error_message
      @error_object       = error_object
    end

    def find
      error_sym    = underscore(error_object.to_s).to_sym
      @found_error = ERROR_MAPPER.fetch(error_sym, {})[ruby_error_message]
      @found_error ||= :no_result
    end

    private

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

