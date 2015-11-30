module HumanistErrors
  class Search

    def self.run(error_object, ruby_error_message)
      searcher = new(error_object, ruby_error_message)
      searcher.find
    end

    def initialize(error_object, ruby_error_message)
      @error_object = error_object
      @ruby_error_message = ruby_error_message
    end

    def find
      error = keyify(error_object)
      return :no_result unless ERROR_MAPPER[error]
      ERROR_MAPPER[error][ruby_error_message]
    end

    private

    attr_reader :error_object, :ruby_error_message, :found_error

    # turn a CamelCase word into an underscored
    # symbol to make it nice for hash keys.
    # Basically the same as ActiveSupport#underscore
    def keyify(error)
      error.to_s
        .gsub(/::/, '__')
        .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        .gsub(/([a-z\d])([A-Z])/,'\1_\2')
        .tr("-", "_")
        .downcase
        .to_sym
    end
  end
end
