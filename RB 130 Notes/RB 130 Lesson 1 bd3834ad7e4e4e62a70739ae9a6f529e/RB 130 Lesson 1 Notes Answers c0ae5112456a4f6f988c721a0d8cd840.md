# RB 130 Lesson 1 Notes: Answers

## Lesson 1

- What is a closure?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

    A programming concept that allows us to save chunks of code for later use.

- Why is it called a closure?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

    It encloses all related parts of the environment around it to be used when it is executed later on in the code.

- In Ruby, how is a closure implemented?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

    Blocks, proc objects, lamdas

- When thinking about closures, why not just use a named method?

    It is very handy because you can pass it in to existing methods.

- What is a binding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

    Giving value to something to be used in the closure.

- What are three ways to work with closures in Ruby?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

    Blocks, Proc objects, lamdas

---

```ruby
[1, 2, 3].each do |num|
	puts num
end
```

- Describe in detail what is happening in the code above. What is the `do..end` block in relation to the `Array#each` method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

    We are calling the `#each` method on the `Array` object and passing in the `do..end` block to `#each` as an argument.

- Why does a block sometimes affect the return value of a method and sometimes not?
- How does the code in the block affect the return value - on what does it depend?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

    It depends on what the method is designed to return in its implementation.

---

- True or false: only some methods take a block.

    False - all methods take a block. Whether or not they decide to use it in the implementation is a different story.

- What is the difference between passing in a block to a method and passing in a parameter?

    When we pass in a block to a method, it is an optional, implicit parameter.

    A block needs to use the method call  `yield`. A parameter is a local variable, a block is not. It won't raise an `ArgumentError` if you don't include it.

- How can you make sure a method has access to a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Call `yield` in the method implementation.

- What is yielding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    It is a way to pass a block in to a method. When we call the `yield` method in the method implementation, the code in the block is executed.

- What is one of the major use cases of blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    A developer can add additional implementation details to the method without affecting the overall structure of the method implementation itself. It makes the method more flexible and generic, and thus more powerful.

- What does it mean when we see a `LocalJumpError`?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    This means that there is a `yield` method call within the method implementation, but no block was passed to the method as an argument upon method execution.

- Where does `block_given?` come from and how is it available for use?
- How do you allow calling a method with or without a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    We can call the `yield` method and add a conditional `if` statement that also calls the method `Kernel#block_given?` which returns a boolean `true` or `false`. Depending on how this evaluates, the block is either executed or the `yield` method call is ignored.

```ruby
def say(words)
  yield if block_given?
  puts "> " + words
end

say("hi there") do
  system 'clear'
end
```

- In the code above, which part is the method invocation and which part is the method implementation? Why is this important to distinguish?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    The method invocation is from lines 6 - 8, starting with the `say` invocation. The implementation comes first, delineated by the `def` and `end` keywords. It is important to distinguish to be able to trace where code is executing, to be able to track expected outputs and return values. It is also important when reading code to not get confused between a possibly longer method invocation and a possibly shorter method implementation.

- Where do you start tracing code execution?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Tracing code execution starts with the method invocation.

- What does it mean when you say that the block is an implicit parameter?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    A block is also passed in to a method, but with unspecified values.

- Why is it useful to think of a block as an unnamed or anonymous method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    It's all about execution and how the execution can jump from one part of the code to another and then back again, like methods are able to do.

```ruby
3.times do |num|
  puts num
end
```

- Describe the code above in detail.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    `3` is the calling object, `times` is the method invocation, `do..end` is the block, `num` is the local block variable used by the block parameter.

- What is a block parameter? A block local variable?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    A block parameter is an argument to the block, and the block local variable is the local variable used by the block and only scoped at the block level.

- Why is it important to make sure the block parameter has a unique name?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Local variable shadowing - since the block local variable has its own scope, it will override local variables of the same name if you try to use them in the block. For example:

    ```ruby
    num = 3

    2.times do |num|
      puts num
    end

    # => 0, 1

    2.times do |_|
      puts num
    end

    # => 3, 3
    ```

- What happens if you pass in the wrong number of arguments to a block? Explain what happens when you pass in more arguments to a block and what happens when you pass in fewer arguments to a block at block invocation time than provided by the block implementation?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)
    Blocks have more lenient arity than methods, so it won't raise an error. If you pass in more arguments to a block than used at block invocation time, it will simply ignore the extra arguments. If you pass in fewer arguments, the block will use what's available and the rest will be `nil`.

- What is the value of block local variable that has no argument passed to it upon block invocation?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is arity?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    The rules regarding the number of arguments.

- What is the arity rule for blocks in Ruby?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    BLOCKS DON'T ENFORCE ARGUMENT COUNT. If there are fewer arguments passed in, Ruby will use what is available but the rest will have a value of  `nil`, if there are more arguments passed in, the extra are ignored.

- What are some behaviors of blocks that are similar to normal methods? (hint: tracing code execution and return value) What are some behaviors of blocks that are different? (hint: arity)

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Blocks also have a tracing code execution that jumps back and forth between the method invocation and the implementations of those methods or blocks. Blocks have a return value, so thinking about the return value of the block is also important when considering a block and when considering the return value of the method that uses a block. It is also important to consider whether or not the block mutates the argument. Block's arity is different because a block doesn't enforce argument count.

- Can blocks mutate the argument?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Yes - if a block uses a destructive method, it can mutate the argument. We need to notice the return values and potentially destructive behaviors of blocks, similarly to how we view methods.

- What do we need to be aware of when working with blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Return value

- What are the two main use cases of blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    The first use case of blocks is to use the block as an active part of implementation, making it more generic and flexible, adding more specific implementation power to the method by passing in the block as an argument. The second use case is to use the block as a companion in order to do something else alongside the method - log extra information, or open and close something in order to clean up the process, or keep track of time it took to do something.

- What are the two roles involved with any method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Method implementation and method invocation.

- How can you achieve similar functionality to a block without using a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Using flags and case statement or conditional statement, but the method implementor would have to provide functionality. With blocks, the functionality decisions are deferred to the method invocation, providing greater flexibility.

- What is sandwich code?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    The method implementation is "sandwiched" in between a start and end implementation that allows us to track things or allows us to clean up any processes that have been started in the method (close files, delete unneccessary objects, etc.) to keep memory clean and prevent bugs.

- Name two areas where before/after actions are important.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Timing processes and resource management.

- How do you pass a block to a method explicitly?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Using the `&` symbol in the method definition parameter, we can convert the argument to a simple `Proc` object.

- "Every method, regardless of its definition, takes an _______ ________."

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is `&block` ? (Or & anything used as a parameter)

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Why do we use `#call` instead of `#yield` to invoke a `Proc` object?

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

- The code above is clearly using a `Proc` object, but we only see the `&` symbol once. Why is this?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

---

- Why is it useful to write a generic iterating method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/c7af0c78)

- What is an accumulator object?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/c1edc867)

    ```ruby

    ```

---

- Why build a custom collection class? Name at least 3 reasons.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/b2926256)

- Why is it preferred to implement a custom iterator? Name at least 3 reasons.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/490f885c)

- 

---

- Why is it important to be aware if something is a method or a local variable?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

- Blocks are a form of ___.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

- What is a Proc's binding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

---