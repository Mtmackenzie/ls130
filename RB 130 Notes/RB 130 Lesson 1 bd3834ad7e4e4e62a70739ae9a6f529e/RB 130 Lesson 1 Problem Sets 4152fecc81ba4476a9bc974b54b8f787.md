# RB 130 Lesson 1 Problem Sets

## Lesson 1

```ruby
# Version 1
def echo_with_yield(str)
  str
  yield
end

p echo_with_yield("hello!") { puts "world" }

# Version 2
def echo_with_yield(str)
  yield
  str
end

p echo_with_yield("hello!") { puts "world" }
```

- What will each of the versions of the `#echo_with_yield` method return above, and why?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def echo_with_yield(str)
  yield
  str
end

p echo_with_yield("hello!")
```

- What happens in the code above, and how do we fix it?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
```

- What happens in the code above and what is returned? Explain by tracing the code execution.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def implement(n)
  yield(n + 1) if block_given?
  n + 1
end

implement(6) do |num| 
  puts num
end
```

- Trace the code execution in the above code snipper.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
# Example 1
def test
  yield(1)
end

test { |num, num2| puts num * num2}

# Example 2
def test
  yield(1)
end

test { |num1, num2| puts "#{num1} #{num2}" }
```

- What happens in the code snippets above? What principle does this demonstrate?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def compare(word)
  puts "Before: #{word}"
  after = yield(word) if block_given?
  puts "After: #{after}"
end

compare("hi") { |word| puts word.upcase!}
```

- What happens in the code snippet above? What principle does this demonstrate?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          # etc, we could have a lot of 'when' clauses
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

compare("hello", :upcase)

# Before: hello
# After: HELLO
# => nil
```

- Describe what is happening in the code above. How is this different from using a block? What are the pros and cons of using a code similar to the one above as opposed to a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def time_it
  time_before = Time.now
  yield                       # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }                    # It took 3.003767 seconds.
                                        # => nil

time_it { "hello world" }               # It took 3.0e-06 seconds.
                                        # => nil
```

- What is happening in the code above? What is this an example of, and why is it useful?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```

- The `File::open` method above will automatically close the file once the block has been executed. How is this possible? Why is this a handy use case for blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
def test2(block)
  puts "hello"
  block.call                    # calls the block that was originally passed to test()
  puts "good-bye"
end

def test(&block)
  puts "1"
  test2(block)
  puts "2"
end

test { puts "xyz" }
```

- What is the output of the code above? Explain its signficance.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    # => 1
    # => hello
    # => xyz
    # => good-bye
    # => 2

```ruby
# Part 1
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code)

# Part 2
def call_me(some_code, name)
  name = "Griffster"
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code, name)

# Part 3
def call_me(some_code, name)
  name = "Griffster"
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code, name)

# Part 4
def call_me(some_code, name)
  name = "Griffster"
  some_code.call
end

name1 = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code, name)

# Part 5
def call_me(some_code, name)
  name = "Griffster"
  some_code(name).call
end

name = "Robert"
chunk_of_code = Proc.new(name) {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code, name)

# Part 6
def call_me(some_code, name)
  name = "Griffster"
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

p call_me(chunk_of_code, name)

name = "George"
```

- Try to guess what each of the code snippets above will output before running.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

```ruby
class Object
  def to_s_crazy_case
    self.to_s.chars.map.with_index do |char, idx|
      idx.odd? ? char.upcase : char.downcase
    end.join
  end
end

p ['hello', 'hi there', 4, :hi].map(&to_s_crazy_case)
```

- Based on what you know about `Proc` objects and blocks, make the above code work without touching the `Object` class or anything in the `map` invocation line.

    class Object
    def to_s_crazy_case
    self.to_s.chars.map.with_index do |char, idx|
    idx.odd? ? char.upcase : char.downcase
    end.join
    end
    end

    p ['hello', 'hi there', 4, :hi].map(&:to_s_crazy_case)

    1. & used in method invocation - tells Ruby to convert what follows to a block. In order to do this, it expects what follows to be a Proc object.

    2. Ruby either converts the Proc object to a block or tries to convert whatever it is to a Proc object so it can then convert to a block. In this case above, the object is a symbol. There is a Symbol#to_proc method, so it converts the symbol to a Proc and then to a block, to which it passes each element in the collection and returns a new `Array` object containing those neww values

```ruby
def to_s_crazy_case
  self.to_s.chars.map.with_index do |char, idx|
    idx.odd? ? char.upcase : char.downcase
  end.join
end

p ['hello', 'hi there', 4, :hi].map(&:to_s_crazy_case)
```

- Make the above code work.
    1. When we run it, we see a NoMethodError private method. This is because the method is defined in the `main` object's scope and `main` object's methods are usually private - only available to be called within the scope of `main`.