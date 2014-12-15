# require "humanist_errors/errors/version"

# module HumanistErrors
  # module Errors
    class SyntaxError
      def message
        # if super =~ /undefined/ 
          "Hi! You may have missed an argument and ended this line early with a semicolon. Here's the error from Ruby: " + super
        # end
      end
    end
  # end
# end
