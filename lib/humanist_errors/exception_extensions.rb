module HumanistErrors
  module ExceptionExtensions
    def to_s
      searcher = Search.run(self.class, super)
      if searcher.found_error == :no_result
        super
      else
        color = Color.new
        "\n#{STARTING_TOKEN}"+
        "\t#{color.cyan(searcher.found_error)}\n"+
        "#{ENDING_TOKEN}" +
        super
      end
    end
  end
end

