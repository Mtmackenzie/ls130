# 9 Same Object Assertions
# Write a test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'

class SameObjectTest < Minitest::Test
  def test_same_object
    assert_same(list, list.process)
  end
end