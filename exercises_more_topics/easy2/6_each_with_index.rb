# 6 each_with_index

def each_with_index(arr)
  arr.each_with_index { |el, idx| yield(el, idx) }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# should output:

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true