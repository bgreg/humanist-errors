module HumanistErrors
  module ExceptionExtensions
    def to_s
      error = Search.run(self.class, super)
      if :no_result == error
        super
      else
        color = Color.new
        "\n#{STARTING_TOKEN}" \
        "\t#{color.cyan(error)}\n" \
        "#{ENDING_TOKEN}" + super
      end
    end
  end
end
