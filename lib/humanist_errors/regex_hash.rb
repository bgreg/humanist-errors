module HumanistErrors
  class RegexHash < Hash
    def [](value)
      detect(-> { :no_result }) do |k,v|
        if k =~ value
          return v
        end
      end
    end
  end
end
