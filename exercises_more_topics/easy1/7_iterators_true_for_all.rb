# 7 Iterators: True for All?
# Input: array with argument and a block
# Output: boolean
# Rules: if array is empty, always returns true
# Problem: block must return true for every element, returns false and stops searching as soon as block returns false
# Algo: 
# Iterate over elements of the array, passing each to a block. if the block returns false, explicitly return false, otherwise return true.
def all?(arr)
  arr.each { |el| return false if yield(el) == false}
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true