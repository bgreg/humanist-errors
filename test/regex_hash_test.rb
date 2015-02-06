class RegexHashTest< Minitest::Test

  def a_regex_search_happens_on_key_send_test
    magic_string_hash = RegexHash.new["findme" => "hurray!"]
    assert_match(magic_string_hash['find'], "hurray!")
  end

  def a_failure_when_key_is_not_found_test
    magic_string_hash = RegexHash.new["findme" => "hurray!"]
    assert_raises(KeyError){ magic_string_hash['1'] }
  end
end
