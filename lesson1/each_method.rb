#So what happens is that the Array#each method iterates through the array, yielding each element to the block, where the block can do whatever it needs to do to each element. Then, the method returns the calling object.

def each(arr)
  counter = 0

  while counter < arr.size
    yield(arr[counter])
    counter += 1
  end

  arr
end

lv = [1, 2, 3].each { |num| puts num }                           # still returns [1, 2, 3]
p lv

each([1, 2, 3, 4]) { |num| puts num }