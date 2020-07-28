# 1 From-To-Step Sequence Generator

def step(start, ending, step_num)
  counter = start
  while counter <= ending
    yield(counter)
    counter += step_num
  end
  step_num
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
# What do you think would be a good return value for this method, and why?