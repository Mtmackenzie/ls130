# 5 drop_while

def drop_while(arr)
  index = 0
  result = arr.clone
  while yield(arr[index]) && index < arr.size
    result.shift
    index += 1
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]