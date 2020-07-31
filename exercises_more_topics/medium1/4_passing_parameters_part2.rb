# 4 Passing Parameters Part 2

birds = %w(raven finch hawk eagle)

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.

def types(array)
  yield(array)
end

raptors = nil
types(birds) { |type1, type2, *types| raptors = *types }
p raptors