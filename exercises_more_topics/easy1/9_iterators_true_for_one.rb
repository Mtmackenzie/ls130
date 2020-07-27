# 9 Iterators: True for One?
# Input: array, block
# Output: boolean
# Rules: stops searching the second time the block returns true. if empty, return false.
# Problem: 
# 
# DS: 
# 
# Algo: 
# It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

def one?(arr)
  counter = 0
  arr.each do |el|
    counter += 1 if yield(el) == true
    return false if counter > 1
  end
  counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    == true
p one?([1, 3, 5, 7]) { |value| value.odd? }     == false
p one?([2, 4, 6, 8]) { |value| value.even? }    == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true }           == false
p one?([1, 3, 5, 7]) { |value| false }          == false
p one?([]) { |value| true }                     == false
