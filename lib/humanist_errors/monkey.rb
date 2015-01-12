class SyntaxError
  def message
    searcher = HumanistErrors::Search.new(self, super)
    if searcher.found_error == :no_result
      super
    else
      "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN} \n" + super
    end
  end
end

class NoMethodError
  def message
    searcher = HumanistErrors::Search.new(self, super)
    if searcher.found_error == :no_result
      super
    else
      "#{HumanistErrors::STARTING_TOKEN} #{searcher.found_error} #{HumanistErrors::ENDING_TOKEN} \n" + super
    end
  end  
end
