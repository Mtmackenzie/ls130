# 5 Included Object Assertions
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

class IncludeTest < Minitest::Test
  def test_include
    arr1 = ['xyz', 1]
    assert_includes(arr1, 'xyz')
  end
end