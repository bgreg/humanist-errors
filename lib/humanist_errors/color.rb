module HumanistErrors
  class Color
    PREFIX  = '\033'
    POSTFIX = '\033[0m'
    COLORS  = {
      black:   '[30m',
      red:     '[31m',
      green:   '[32m',
      brown:   '[33m',
      blue:    '[34m',
      magenta: '[35m',
      cyan:    '[36m',
      gray:    '[37m',
    }

    def colorize_with(color, text)
      "#{PREFIX}#{COLORS[color]}#{text}#{POSTFIX}"
    end
  end
end
