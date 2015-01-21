require_relative 'human'

class SyntaxError
  include HumanistErrors::Human
end

class NoMethodError
  include HumanistErrors::Human
end

class NameError
  include HumanistErrors::Human
end
