module HumanistErrors
  class Search
    attr_accessor :found_error
    attr_accessor :error_object, :ruby_error_message

    def self.run(error_object, ruby_error_message)
      searcher = new(error_object, ruby_error_message)
      searcher.found_error = searcher.find
      searcher
    end

    def initialize(error_object, ruby_error_message)
      @error_object = error_object
      @ruby_error_message = ruby_error_message
    end

    def find
      error = keyify(error_object)
      return :no_result unless ERROR_MAPPER.keys.include?(error)
      ERROR_MAPPER[error][ruby_error_message]
    end

    private

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

