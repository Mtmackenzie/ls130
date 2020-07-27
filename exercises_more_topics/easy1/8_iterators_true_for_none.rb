# 8 Iterators: True for None?
# Input: array
# Output: boolean
# Rules: return true if array is empty. return false as soon as block returns true. otherwise, return true
# Problem: iterate over elements, passing in each el to the block and checking to see if it evaluates to true, if so, explicitly return false, otherwise, true

def none?(arr)
  arr.each { |el| return false if yield(el) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true