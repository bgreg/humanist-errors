module HumanistErrors
  class RegexHash < Hash
    def [](value)
      result = self.select { |k| k =~ value }
      if result.empty?
        :no_result
      else
        result.shift[1]
      end
    end
  end
end
