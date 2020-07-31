# 3 Passing Parameters Part 1

items = ['apple', 'corn', 'cabbage', 'cucumber']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "We now have some lovely #{items.map { |item| item + 's'}.join(', ')}!" }
