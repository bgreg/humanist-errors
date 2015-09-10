module HumanistErrors
  module ExceptionExtensions
    def to_s
      searcher = HumanistErrors::Search.new(self.class, super)
      puts "searcher.found_error: #{searcher.found_error.inspect}"
      if searcher.found_error == :no_result
        super
      else
        "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN} \n" + super
      end
    end
  end
end

