module HumanistErrors
  module ExceptionExtensions
    def to_s
      searcher = Search.run(self.class, super)
      if :no_result == searcher.found_error
        super
      else
        color = Color.new
        "\n#{STARTING_TOKEN}" \
        "\t#{color.cyan(searcher.found_error)}\n" \
        "#{ENDING_TOKEN}" + super
      end
    end
  end
end
