# 5 Passing Parameters Part 3
# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end
# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:
# 1)

gather(items) do |*items, item|
  puts *items.join(', ')
  puts item
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
# 2)
puts
gather(items) do |item1, *items, item2|
  puts item1
  puts *items.join(', ')
  puts item2
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
# 3)
puts
gather(items) do |item1, *items|
  puts item1
  puts *items.join(', ')
end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
# 4)
puts
gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, #{item4}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!