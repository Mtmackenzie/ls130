# Our times method will exhibit the same behavior, yielding to the block starting with 0 and going up to 1 less than the method argument. We don't have a calling object, but we do have a method argument, so we'll return that.

# my version
# def times(n)
#   (0..n - 1).each do |num|
#     yield(num) if block_given?
#   end  
#   n
# end

# ls version

def times(n)
  counter = 0
  while counter < n
    yield(counter)
    counter += 1
  end

  n
end

lv = times(5) do |num|
  puts num
end

p lv