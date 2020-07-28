# 6 Exception Assertions
# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
require 'minitest/autorun'

class Employee
  def initialize(experience=nil)
    @experience = experience
  end

  def hire
    if @experience
      puts "Hired"
    else
      raise "NoExperienceError"
    end
  end
end

class EmployeeTest < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_hire
    assert_raises("NoExperienceError") {@employee.hire}
  end
end