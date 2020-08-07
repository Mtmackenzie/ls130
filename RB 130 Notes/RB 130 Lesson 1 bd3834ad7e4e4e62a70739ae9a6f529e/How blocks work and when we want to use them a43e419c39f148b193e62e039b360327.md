# How blocks work and when we want to use them

## General definition

Blocks are closures, unnamed chunks of code that are passed into methods as an argument to give the person calling the method more flexibility in using the method during method invocation time. This makes the method more powerful because it is able to be more generic by deferring some of the implementation decisions to the developer.  Blocks in Ruby are written using curly braces: `{ }` or `do..end` blocks. The method implementor must decide 1) how the method will use the block and 2) what the return value of the method will be: will it use values returned by the block or ignore them?

- For example, the `Array#each` method uses a block to do something with each of the values in the calling object. It is powerful because we decide what it is we want to do with these values/objects - print them? Add them to a new collection? It is up to the developer to decide at method invocation time.

    ```ruby
    [1, 2, 3].each { |num| puts num } # => output: 1, 2 and 3 on new lines
    																	# => return value: calling object
    ```

- A method doesn't necessarily have to "use" a block in order to be able to accept it as an argument. This is one way in which passing in blocks as an argument to a method is different from passing in values to explicit parameters. The block is passed to the method as an implicit argument during method invocation time, but whether this block is used by the method depends on the method definition. In the example below, the method `a_method` takes one explicit argument, but it also accepts a block as an implicit argument, even though it doesn't do anything with the block. `b_method` also accepts a block as an implicit argument, but it actually uses it via the keyword `yield`, which executes the code that is in the block.

    ```ruby
    def a_method(str)
      str
    end

    a_method("hi") { puts "HOWDY" } # => return value: "hi"

    def b_method
      yield
    end

    b_method { puts "HOWDY" } # => output: HOWDY, return value: nil
    ```

## Blocks have return values

Like methods, blocks have return values. This is important to take into consideration when we decide where to `yield` to the block when we are writing the method definition.

- To be able to use the block, we must call the `yield` method in the block. The code will execute whatever is in the block and return the return value of the block.

    ```ruby
    def a_method(str)
      yield
      str
    end

    a_method("hi") { puts "HOWDY" } # => output: HOWDY
    															  # => return value: "hi"
    ```

    The return value of the code executed in the block is `nil`, since we call the `puts` method in the block and pass in a `String` object to it as an argument. This value is not used by the method. 

    ```ruby
    def a_method(str)
      str
      yield
    end

    a_method("hi") { puts "HOWDY" } # => output: HOWDY
    																# => return value: nil
    ```

    In the example above, we have only changed one thing: the `yield` method call is the last line evaluated when we invoke `a_method` . Since the return value of the method is `nil`, the return value of `a_method` becomes `nil`. For this reason, it is important to consider where we place the `yield` keyword within the method definition and take into account if the methods or return values used in the block affect the rest of the method, especially the return value of the method.

## When a method expects a block as an implicit argument, but the block isn't passed to the method during method invocation

A method can receive a block as an implicit argument even if the method does not use the block, but when we are writing methods we need to prepare for the possibility of our method expecting a block but not receiving one. If the `yield` keyword is used but it cannot find a block, it will raise a `LocalJumpError`. The way to prevent this is to use `yield` only if the method invocation `block_given?`  evaluates to a boolean `true`. 

```ruby
def a_method(str)
  yield if block_given?  #No invocation of yield
  str
end

a_method("hi")  # => "hi"
```

- All methods in Ruby take a block as an argument - how or if the method uses the block is a different story.

# Bindings

A block uses references to whatever is in scope - its bindings - in order to implement the code within the block.

A block will determine the current value of whatever object it uses in the code within the block (or `Proc` object). For a local variable, this means that as long as the local variable is initialized before the `Proc` object is instantiated, whatever value is currently referenced by the local variable will be used by the block upon method invocation.

- In the example below, the local variable `string` initialized on line 5 is part of the `Proc` object's binding on line 7.
- When we invoke the `example` method on line 9, the current value of the `string` local variable is used by the `Proc` object referenced by the local variable `proc_object` when we pass  `proc_object` to the `example` method as an argument.
- The parameter local variable `arg2` references the `Proc` object referenced by local variable `proc_object`. `arg2` is converted to a block in line 2 by the use of the `&` operator.
- `map` passes each element of the `Array` object to the block via the block parameter, where the value referenced by the block local variable `el` is used in string interpolation along with the value of `string`.

```ruby
def example(arg1, arg2)
  arg1.map(&arg2)
end

string = '!'

proc_object = proc { |el| "#{el}#{string}" }
  
p example(['hi', 'bye'], proc_object) # => ["hi!", "bye!"]
```

If we were to reassign the value referenced by local variable `string`, even after the `Proc` object's instantiation in line 7, we would see the updated value when the method is invoked. If we were to initialize the local variable after the block was created, we would see a `NoMethodError` because the block would not recognize the local variable because "local variables initialized outside of the block are available inside the scope of the block, but not vice versa". For this reason, we can say that a closure is bound to its surrounding environment, its bindings, because it is only able to use what's in scope when the block is created.

## Block parameters and arity

A block can have a parameter called a block parameter. In the example below, the block passed in to `a_method` as an argument has one parameter: `n` , which is the block local variable and is scoped at the block level. Within the method definition, we can see that the `map` method is called on the provided `Array` argument and passes each element of the `Array` object to the block by using the `yield` keyword with an argument: `yield(el)` . This then returns a new `Array` object with the return values of the code evaluated in the last line of the block (important to remember when we have multi-line blocks).

```ruby
def a_method(arg1)
  arg1.map { |el| yield(el) }
end

p a_method([1, 2]) { |n| n.to_s } # => ["1", "2"]
```

A block parameter has more lenient arity rules than a method parameter. It will not raise an error if there is an inconsistency in the number of elements that the block parameter expects and the number of elements that are passed to the block. Blocks don't enforce argument count. If there are fewer arguments passed in, Ruby will use what is available but the rest will have a value of nil, if there are more arguments passed in, the extra are ignored.

```ruby
# Block has two parameters but only passed in one argument
def a_method(arg1)
  arg1.each_cons(2) { |el1, el2|  puts (yield(el1)) }
end

p a_method([1, 2]) { |n1, n2| "#{n1}, and #{n2}" } 
# => output: 1, and
# => return: nil

# Block has one parameter but is passed two arguments
def a_method(arg1)
  arg1.each_cons(2) { |el1, el2|  puts (yield(el1, el2)) }
end

p a_method([1, 2]) { |n| "#{n}, and #{n}" } 
# => output: 1, and 1
# => return: nil
```

## Variable shadowing

```ruby
def a_method(arg1)
  arg1.map { |el| yield(el) }
end

n = '!'
p a_method([1, 2]) { |n| "#{n}" } # => ["1", "2"]
```

## Passing a block to a method as an explicit argument

All methods in Ruby take a block as an implicit argument, but sometimes it can be useful to pass in a block to the method as an explicit argument. The `&` operator used in a method parameter will look for a block and convert that block to a simple  `Proc` object, which within the method we can access by invoking the `call` method on the local variable used in the parameter to reference this `Proc` object. We can still use the `block_given?` method to avoid any errors when using the block-turned- `Proc` inside the method. 

```ruby
def a_method(str, &block)
  block.call if block_given?
  str
end

p a_method("hi")  # => "hi"
```

Passing a block to a method as an explicit argument can be useful to give the block a handle via the local variable - we can then pass this block (now `Proc` ) to another method as an argument from within the method definition, or reference it in other ways as a more explicit reference to the chunk of code we are executing in the block.

In the method below, we are passing in the block to `a_method` as an explicit argument. The block is now referenced by local variable `block` and with the `&` operator has been converted to a `Proc` object. We can access the code in the block by calling the `call` method on the `block` local variable. We can pass this in as an argument to `other_method` and in line 2 we can concatenate the value of the code in the block (`String` object) with another `String` object. Since this is the last line evaluated in both `other_method` and `a_method`, the return value of the method invocation on line 9 is a `String` object with value `"WOW!!!"`

```ruby
def other_method(arg1)
  arg1 + '!!!'
end

def a_method(str, &block)
  other_method(block.call)
end

p a_method("hi") { 'WOW' } # => "WOW!!!"
```

Blocks passed in as explicit arguments through the `&` block-to-simple `Proc` object conversion have different arity rules than other types of arguments. We might expect an argument error for the code below since no block is present at method invocation time, but we see the `NoMethodError` error because we are trying to call `call` on `nil`. This demonstrates that the `&` operator searched for a block, didn't find one, and now the local variable `block` used in the scope of the method definition evaluates to `nil`.

```ruby
def a_method(str, &block)
  block.call 
  str
end

p a_method("hi")  # => NoMethodError: undefined method 'call' for nil
```

## Sandwich code

```ruby
def sandwich
  # sandwich code
  yield
  # other sandwich code
end

sandwich { puts "hi" } # => output: hi, return value: whatever the last line of sandwich evaluates to
```

## Using Procs

A block is a type of `Proc` object. A `Proc` object is a closure that can be referenced by a local variable and used in different parts of the program. This is useful to DRY up code, especially if we see ourselves repeating the same block. 

In the code below, we instantiate a `Proc` object closure that contains the code we want to be able to reuse in both methods. In `a_method`, we are adding additional functionality to the code that is already within the block. In `b_method`, we are not adding any additional functionality, so we can convert the `Proc` object back to a block by passing it to the `map` method on line 10 as an argument. We use the `&` operator and the local variable that is currently pointing to the `proc_object` since we have passed it to the `b_method` as an argument in line 17. The `&` operator used in the context of an argument will convert the `Proc` object back to a block. 

These examples demonstrate the flexibility of `Proc` objects and their ability to make code less redundant.

```ruby
# Pass in each element of the given Array argument as an argument to the call method
def a_method(arg1, arg2)
  arr = []
  arg1.each { |el| arr << arg2.call(el) + '!' }
  arr
end

# Simple Proc-to-block conversion when using a Proc object as an argument
def b_method(arg1, arg2)
  arg1.map(&arg2)
end

proc_object = Proc.new { |n| n.to_s }
integers = [1, 2]

p a_method(integers, proc_object) # => ["1!", "2!"]
p b_method(integers, proc_object) # => ["1", "2"]
```

## Symbol to Proc

If we are passing a block to a method that works with collections, and in that block we are only calling one method that doesn't take an argument on each element of the collection, Ruby provides us with way to write this block in shorthand: using the `&` operator and writing the name of the method as a `Symbol` object. `Symbol` has a method called `Symbol#to_proc` that will look for the name of an existing method available to the class of whatever type of object is being passed to the block.

In the example below, we are only calling `String#upcase` on each element of the `words` `Array` object referenced by local variable `arg1` in each of the method definitions below. The `String#upcase` method does not take an argument. Version 1 below is the long way of writing this method call.

Version 2 shortens the block using the `&` operator in the argument. Here are the steps:

- the `&` operator converts the object to a block. If the object is not a `Proc` object, Ruby will call `to_proc` on the object to turn it into a `Proc` object, which it then  If it is unable to do so, it will raise an error. It will be able to do so if the object has a `#to_proc` method available to it.
- In Version 2 below, the object after the `&` operator is a `Symbol` object, and this means it will call `Symbol#to_proc` on the `Symbol`. This converts the `Symbol` object to a `Proc`, and the `&` converts this to a block, which we then use in the method implementation by using the keyword `yield` in line 12.
- In Version 3, at method invocation time we do the same process of `Symbol#to_proc` then `Proc` to block conversion, but we pass in this block to the method as an explicit argument. The `&` operator in the method definition parameter will convert this block to a `Proc` object, which we then use by invoking the `call` method on it in line 19.
- In Version 4, we use the same process as version 3, but we use the `&` operator in the `map` invocation argument in line 26 to convert the `Proc` object referenced by `arg2` back to a block.

```ruby
words = ['hi', 'bye']

# Version 1
def a_method(arg1)
  arg1.map { |el| yield(el) }
end

p a_method(words) { |word| word.upcase } # => ["HI", "BYE"]

# Version 2
def b_method(arg1)
  arg1.map { |el| yield(el) }
end

p b_method(words, &:upcase) # => ["HI", "BYE"]

#Version 3
def c_method(arg1, &arg2)
  arg1.map { |el| arg2.call(el) }
end

p c_method(words, &:upcase) # => ["HI", "BYE"]

#Version 4
def d_method(arg1, &arg2)
  arg1.map(&arg2)
end

p d_method(words, &:upcase) # => ["HI", "BYE"]
```

To summarize:

- the `&` operator used in a method invocation argument will convert what comes after it to a block. It expects a `Proc` object.
- If what comes after it is not a `Proc` object, Ruby will try to call `#to_proc` on that object. If the object does not have a `#to_proc` method that returns a `Proc` object, it will raise an error
- `Symbol#to_proc` looks for a method with the same name as the `Symbol` object and converts this to a `Proc` object.
- Since this is now a `Proc` object, the `&` operator can convert it to a block.

`&`

if proc?

- return block

else

- call #to_proc on object - is this possible?
    - if so, return `Proc`, otherwise, raise error
- convert `Proc` to block and return it

end