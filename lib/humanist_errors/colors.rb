module HumanistErrors
  class Color

    def black(sting)
      "\033[30m#{string}\033[0m"
    end

    def red(sting)
      "\033[31m#{string}\033[0m"
    end

    def green(sting)
      "\033[32m#{string}\033[0m"
    end

    def brown(sting)
      "\033[33m#{string}\033[0m"
    end

    def blue(sting)
      "\033[34m#{string}\033[0m"
    end

    def magenta(sting)
      "\033[35m#{string}\033[0m"
    end

    def cyan(sting)
      "\033[36m#{string}\033[0m"
    end

    def gray(sting)
      "\033[37m#{string}\033[0m"
    end

  end
end
