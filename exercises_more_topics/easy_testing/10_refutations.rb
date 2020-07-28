# 10 Refutations
# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class ArrayTest < Minitest::Test
  def test_not_part_of_list
    refute_includes(['wxyz'], 'xyz')
  end
end