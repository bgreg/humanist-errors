require 'test_helper'

class ColorTest < Minitest::Test
  def colors
    { black:   '[30m',
      red:     '[31m',
      green:   '[32m',
      brown:   '[33m',
      blue:    '[34m',
      magenta: '[35m',
      cyan:    '[36m',
      gray:    '[37m', }
  end

  def colorizer
    @colorizer ||= HumanistErrors::Color.new
  end

  def test_wraps_given_string_with_color
    test_string   = "Test"

    colors.each do |color_name, code|
      assert_equal(
        colorizer.colorize_with(color_name, test_string),
        "\\033#{code}#{test_string}\\033[0m")
    end
  end
end
