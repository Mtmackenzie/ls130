# 6 Iterators: True for Any?
# Input: array, block
# Output: boolean
# Rules: takes argument and a block. return true as soon as block returns true, otherwise return false. accepts empty array objects but returns false. cannot use all? any? none? or one?
# Problem: iterate over the elements of the array and return true as soon as the block returns true.
#
# DS: Array
#
# Algo: 
# define a method called any? that takes an array argument and a block
# iterate over the elements of the array and return true explicitly as soon as block evaluates to true
# otherwise, returns false

def any?(arr)
  counter = 0
  while arr[counter]
    return true if yield(arr[counter]) == true
    counter += 1
  end
  false
end

# Notes: the LS version uses Enumerable#each because this provides added funcionality of being able to work with other types of collections that also have #each available to them.

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false