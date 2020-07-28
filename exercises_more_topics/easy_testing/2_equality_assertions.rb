# 2 Equality Assertions
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

class Downcase_test < Minitest::Test
  def test_downcase
    value1 = "xyz"
    value2 = "Xyz"
    value3 = "XYZ"

    assert_equal('xyz', value1.downcase)
    assert_equal('xyz', value2.downcase)
    assert_equal('xyz', value3.downcase)
  end
end