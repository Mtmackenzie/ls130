# Try to write a reduce method on your own that exhibits this behavior. Your reduce should take at least 1 argument that represents the array we'll operate on. It should also take an optional second argument that represents the default value for the accumulator. Here's a few examples that we should be able to call on your method.



def reduce(arr, other=nil)
  counter = 0
  if other
    accum = other
  elsif arr[0].to_s.to_i == arr[0]
    accum = 0
  else
    accum = arr[0].class.new
  end

  while counter < arr.size
    accum = yield(accum, arr[counter]) if block_given?
    counter += 1
  end

  accum
end


array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: und
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']