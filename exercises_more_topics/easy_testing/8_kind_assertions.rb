# 8 Kind Assertions
# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class NumericTest < Minitest::Test
  def test_numeric
    assert_kind_of(Numeric, 3)
    assert_kind_of(Numeric, 3.2)
  end
end