require "test_helper"

class LoadErrorTest < Minitest::Test
  include HumanistErrorsSupport

  def test_message_for_missing_file
    assert_error_map("no such file to load",
   :load_error, :no_file) 
  end

end
