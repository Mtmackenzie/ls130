# 4 Empty Object Assertions
# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class Arraytest < Minitest::Test
  def test_array_not_empty
    array1 = []
    array2 = [1]
    array3 = [nil]

    assert_empty(array1)
    assert_equal(false, array2.empty?)
    assert_equal(false, array3.empty?)
  end
end