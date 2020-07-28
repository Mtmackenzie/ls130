# 7 Type Assertions
# Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly. value may not be an instance of one of Numeric's superclasses.

require 'minitest/autorun'

class NumericTest < Minitest::Test
  def test_numeric_class
    assert_instance_of(Numeric, Numeric.new)
  end
end