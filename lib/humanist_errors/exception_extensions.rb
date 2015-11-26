module HumanistErrors
  module ExceptionExtensions
    def to_s
      error = Search.run(self.class, super)
      if :no_result == error
        super
      else
        color = Color.new
        "\n\n#{color.colorize_with(:green, STARTING_TOKEN)}" \
        " #{color.colorize_with(:cyan, error)}\n" \
        "#{color.colorize_with(:green, ENDING_TOKEN)}\n" + super
      end
    end
  end
end
