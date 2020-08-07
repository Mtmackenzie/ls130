# RB 130 Lesson 2: Questions

## Lesson 2

- Why do we write tests?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

- What kind of testing are we going to talk about in LS?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

- What is regression?
- What is unit testing?

    Testing simple classes.

---

### [Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is the default testing library that comes with Ruby?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is a DSL? Which popular DSL do people often use to write testing code? What is the downside of this DSL?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is a test suite?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is a test?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is an assertion?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
```

- Look at the test file above and break down what is happening line by line.
- How do you prefix an instance method within a test class to let Minitest know which method needs to be run?
- What do you have to do before you make an assertion?
- How many parameters does `assert_equal` take, and what happens if there's a discrepancy?
- In the default Minitest format, what does the first "seed" tell Minitest? Why is it used?
- After the seed, what does the dot mean? "S"?   "F"?
- When the test fails, where does it indicate that it has done so? Identify at least three parts, and explain what is happening in each part.

    ```ruby
    Run options: --seed 8732

    # Running:

    CarTest F.

    Finished in 0.001222s, 1636.7965 runs/s, 1636.7965 assertions/s.

      1) Failure:
    CarTest#test_bad_wheels [car_test.rb:13]:
    Expected: 3
      Actual: 4

    2 runs, 2 assertions, 1 failures, 0 errors, 0 skips
    ```

- How do you add color to the output?
- How do you skip a test?
- What is the difference between the assertion or assert-style syntax and the expectation or spec-style syntax?

---

### [Assertions](https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a)

- [Full list of assertions](http://docs.seattlerb.org/minitest/Minitest/Assertions.html)
- Describe  `assert` .

    `assert(test)`   Fails unless `test` is truthy.

    ```ruby
    class Car
      attr_accessor :wheels, :name

      def initialize
        @wheels = 4
      end
    end

    def test_car_exists
      car = Car.new
      assert(car)
    end
    ```

- Describe `assert_equal`.

    `assert_equal(exp, act)`	Fails unless `exp == act`.

    ```ruby
    def test_wheels
      car = Car.new
      assert_equal(4, car.wheels)
    end
    ```

- Describe `assert_nil`.

    `assert_nil(obj)`	Fails unless `obj` is `nil`.

    ```ruby
    def test_name_is_nil
      car = Car.new
      assert_nil(car.name)
    end
    ```

- Describe `assert_raises`.

    `assert_raises(*exp) { ... }`	Fails unless block raises one of `*exp`.

    ```ruby
    def test_raise_initialize_with_arg
      assert_raises(ArgumentError) do
        car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
      end
    end
    ```

- Describe `assert_instance_of`.

    `assert_instance_of(cls, obj)`	Fails unless `obj` is an instance of `cls`. Mostly useful when used in inheritance.

    ```ruby
    def test_instance_of_car
      car = Car.new
      assert_instance_of(Car, car)
    end
    ```

- Describe `assert_includes`.

    `assert_includes(collection, obj)`	Fails unless `collection` includes `obj`.

    ```ruby
    def test_includes_car
      car = Car.new
      arr = [1, 2, 3]
      arr << car

      assert_includes(arr, car)
    end

    # assert_includes calls assert_equal in its implementation, and Minitest counts that call
    # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.
    ```

- What is a refutation?

---

### [SEAT Approach](https://launchschool.com/lessons/dd2ae827/assignments/5c80633e)

- What is the SEAT approach?
- What is the purpose of the `setup` method?
- What is the purpose of the `teardown` method?

---

### [Testing Equality](https://launchschool.com/lessons/dd2ae827/assignments/bcce2222)

- When we use `assert_equal`, what are we testing for?
- Which assertion do we use if we want to look for more strict object equality?

- What is a `HEREDOC` used for?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58) #16

- What is the squiggly heredoc?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58) #16

---

### [Code Coverage](https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c)

---

[Summary](https://launchschool.com/lessons/dd2ae827/assignments/02f2490e)