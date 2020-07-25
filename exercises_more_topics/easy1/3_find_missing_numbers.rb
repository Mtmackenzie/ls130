# 3 Find Missing Numbers
# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# Input: array
# Output: new array
# Rules: given array could only be one element or could have no missing elements. could start with negative integer.
# Problem: sort? iterate over a range of nums starting with the lowest el and ending with highest element. Every time a num is not included in given argument, add to new array object and return at end.

def missing(arr)
  (arr[0]..arr[-1]).select { |num| !arr.include?(num) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []