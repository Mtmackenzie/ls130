# RB 130 Lesson 2: Answers

## Lesson 2

- Why do we write tests?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

    Tests prevent regression. As we make changes to our code, testing can ensure that everything still works the way we expect, without having to manually check everything. It saves time and protects against preventable bugs that can happen through human error.

- What kind of testing are we going to talk about in LS?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/554f5ac5)

    Unit testing - testing classes.

- What is regression?

    Essentially, a bug, a problem in the code that either causes an error or slows things down.

- What is unit testing?

    Testing simple classes.

---

### [Lecture: Minitest](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

- What is the default testing library that comes with Ruby?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

    Minitest

- What is Minitest?

    Minitest is Ruby's default testing library. It is written using plain Ruby syntax.

- What is a DSL? Which popular DSL do people often use to write testing code? What is the downside of this DSL?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

    A DSL is a Domain Specific Language - a language used specifically for writing tests. RSpec is one example for Ruby that provides alternative syntax to make writing tests more natural using syntax that is closer to English, but the downside is that it loses simplicity.

- What is a test suite?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

    A test suite is the entire set of all the tests needed for the program.

- What is a test?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

    A test is the specific scenario that we are checking to make sure we have the expected results. A test can contain various assertions, and in Minitest is an instance method within the test class (that inherits from Minitest) that is prefaced with: `test_`

- What is an assertion?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5)

    An assertion is a step in a test that compares an expected outcome against a real execution of code. By outcome, I mean return value, output, error, action, etc. Assertions in Ruby are methods with two arguments: expected, and actual. Several assertions can form part of one test.

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

    `test_`

- What do you have to do before you make an assertion?

    Set up any objects or values that you will need to be able to make the assertion, and execute any code that you need to execute in order to get the expected return value of the assertion.

- How many parameters does `assert_equal` take, and what happens if there's a discrepancy?

    2: the expected and the actual values. If there is a discrepancy, Minitest saves the error message and shows it to you when the test runs are complete.

- In the default Minitest format, what does the first "seed" tell Minitest? Why is it used?

    The "seed" tells Minitest the order in which to run the tests, and we can use this if we wanted to specify to Minitest a particular order in which we need to run the tests, instead of just running them randomly, as Minitest does by default. However, this is rarely used.

- After the seed, what does the dot mean? "S"?   "F"?

    The `.` means that the test passed. `S` means the test was skipped by using `skip` in the test, and `F` means the assertion failed - the actual code executed did not match the expected code. `E` means there was an error in the test that caused it to stop executing before it was able to invoke the assertion.

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

    `minitest/reporters`

- How do you skip a test?

    `skip` - can pass a string to it for custom message

- What is the difference between the assertion or assert-style syntax and the expectation or spec-style syntax?

    The assertion style syntax uses basic Ruby syntax. The spec-style syntax provides us with a different, more "natural" English way of writing the test, but it is perhaps less intuitive because it does not read like Ruby code.

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

    - 
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

Why does assert_includes count as two assertions?

---

### [SEAT Approach](https://launchschool.com/lessons/dd2ae827/assignments/5c80633e)

- What is the SEAT approach?

    The SEAT approach are the steps needed to write a test.

    - Setup: this is the process of instantiating any objects that we may use throughout the test suite. This could also be the step where we open any files needed or connect to a database. This method will be called before running every test. It allows us to extract repetitive object instantiation or other steps needed to one method: the `setup` method.
    - Execute: this is the process of actually running code from the program.
    - Assert: this is where we call one of the assertion (or refutation) instance methods, where we compare the expected return value, output, or outcome to the actual. Minitest will save the return value of this method call and report it at the end of running the tests.
    - Teardown: if we have created anything that needs to be destroyed to save on memory or if we have opened anything that needs to be closed, we do that in the `teardown` method. This is useful to avoid using up memory, slowing things down, and creating errors because we have either left something running that shouldn't be running or have taken up too much space in memory.

- What is the purpose of the `setup` method?

- What is the purpose of the `teardown` method?

---

### [Testing Equality](https://launchschool.com/lessons/dd2ae827/assignments/bcce2222)

- When we use `assert_equal`, what are we testing for?
- Which assertion do we use if we want to look for more strict object equality?

    `assert_same`

- What is a `HEREDOC` used for?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58) #16

- What is the squiggly heredoc?

    [Link](https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58) #16

---

### [Code Coverage](https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c)

---

[Summary](https://launchschool.com/lessons/dd2ae827/assignments/02f2490e)

[Practice test that has some code examples](https://www.notion.so/meganturley/RB-139-Practice-Test-1-a5ce20d0a8ea4f74866eac128c70b2c7)