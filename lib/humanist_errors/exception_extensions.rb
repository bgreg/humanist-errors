module HumanistErrors
  module ExceptionExtensions
    def to_s
      searcher = Search.run(self.class, super)
      if searcher.found_error == :no_result
        super
      else
        "\n#{STARTING_TOKEN}"+
        "#{COLORS[:cyan]}#{searcher.found_error}\n"+
        "#{ENDING_TOKEN}\n"+
        "#{COLORS[:text_reset]}"
        + super
      end
    end
  end
end

