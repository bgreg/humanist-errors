module HumanistErrors
  module ExceptionExtensions
    def to_s
      searcher = Search.run(self.class, super)
      if searcher.found_error == :no_result
        super
      else
        "#{STARTING_TOKEN} #{searcher.found_error} #{ENDING_TOKEN} \n" + super
      end
    end
  end
end

