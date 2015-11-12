module HumanistErrors
  module ExceptionExtensions
    def to_s
      error = Search.run(self.class, super)
      if :no_result == error
        super
      else
        color = Color.new
        "\n\n#{STARTING_TOKEN}" \
        " #{color.cyan(error)}\n" \
        "#{ENDING_TOKEN}\n" + super
      end
    end
  end
end
