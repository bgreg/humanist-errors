module HumanistErrors
  class Color

    def black(string)
      "\033[30m#{string}\033[0m"
    end

    def red(string)
      "\033[31m#{string}\033[0m"
    end

    def green(string)
      "\033[32m#{string}\033[0m"
    end

    def brown(string)
      "\033[33m#{string}\033[0m"
    end

    def blue(string)
      "\033[34m#{string}\033[0m"
    end

    def magenta(string)
      "\033[35m#{string}\033[0m"
    end

    def cyan(string)
      "\033[36m#{string}\033[0m"
    end

    def gray(string)
      "\033[37m#{string}\033[0m"
    end
  end
end
