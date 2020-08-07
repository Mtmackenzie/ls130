# Block notes

```ruby
def true_or_false(&block) # turns the block into a proc object
  puts "The block is #{yield if block_given?}"  # why is this possible if it's a proc object?
end

true_or_false { 5 < 8 }  # if there is no block to turn into a proc object, &block will not turn anything into a proc object and the block variable will evaluate to nil.  ???
```

An example of binding

```ruby
# Version 1
def exclaim(array)
  array.map {|item| yield(item)} # when we use the keyword yield, we are passing each item individually to the block for evaluation. 
end

# Version 2
def exclaim(array, &block) #turns block into Proc object
  value = '!'
  array.map(&block)# turns Proc into block - the block's binding is still outside of this method definition
end

value = '!!!'

p exclaim(["hi", "bye"]) { |n| n + value }
```