# RB 130 Lesson 1 Notes: Questions

## Lesson 1

- What is a closure?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

- Why is it called a closure?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

- In Ruby, how is a closure implemented?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

- What is a binding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

- What are three ways to work with closures in Ruby?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/0a7a9177)

---

```ruby
[1, 2, 3].each do |num|
	puts num
end
```

- Describe in detail what is happening in the code above. What is the `do..end` block in relation to the `Array#each` method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

- Why does a block sometimes affect the return value of a method and sometimes not?
- How does the code in the block affect the return value - on what does it depend?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/ff802368)

---

- What is the difference between passing in a block to a method and passing in a parameter?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- How can you make sure a method has access to a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is yielding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is one of the major use cases of blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What does it mean when we see a `LocalJumpError`?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- How do you allow calling a method with or without a block?

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

- In the code above, which part is the method invocation and which part is the method implementation? Why is this important to distinguish?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Where do you start tracing code execution?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What does it mean when you say that the block is an implicit parameter?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Why is it useful to think of a block as an unnamed or anonymous method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

```ruby
3.times do |num|
  puts num
end
```

- Describe the code above in detail.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is a block parameter? A block local variable?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Why is it important to make sure the block parameter has a unique name?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What happens if you pass in the wrong number of arguments to a block? Explain what happens when you pass in more arguments to a block and what happens when you pass in fewer arguments to a block at block invocation time than provided by the block implementation?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is the value of block local variable that has no argument passed to it upon block invocation?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is arity?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is the arity rule for blocks in Ruby?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What are some behaviors of blocks that are similar to normal methods? (hint: tracing code execution and return value) What are some behaviors of blocks that are different? (hint: arity)

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Can blocks mutate the argument?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What do we need to be aware of when working with blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

    Return value

- What are the two main use cases of blocks?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What are the two roles involved with any method?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- How can you achieve similar functionality to a block without using a block?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- What is sandwich code?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- Name two areas where before/after actions are important.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

- How do you pass a block to a method explicitly?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/5a060a20)

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

- Why is it important to use the class's interface when possible?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/490f885c)

---

- Why is it important to be aware if something is a method or a local variable?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

- Blocks are a form of ___.

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

- What is a Proc's binding?

    [Link](https://launchschool.com/lessons/c0400a9c/assignments/fd86ea2e)

---