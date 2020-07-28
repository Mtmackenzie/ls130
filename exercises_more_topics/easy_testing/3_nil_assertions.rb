# 3 Nil Assertions
# Write a minitest assertion that will fail if value is not nil.
require 'minitest/autorun'

class Niltest < Minitest::Test
  def test_nil
    arr = [1]
    assert_nil(arr.slice(1))
  end
end