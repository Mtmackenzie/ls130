# 4 Divisors

require 'benchmark'
# def divisors(n)
  
  # original slow
  # (1..n).select { |num| n % num == 0}

  # Initial thoughts, fast
  # result = []
  # num = 1
  # loop do
  #   result << num if n % num == 0
  #   ?? not sure
  # end
  # result.sort.uniq
# end

# Bob R.'s solution - look at this later
def divisors(num)
  arr = []
  Math.sqrt(num).to_i.downto(1) do |d|
    if (num % d).zero?
      arr << num / d
      arr.unshift d
    end
  end
  arr.uniq
end

# My version, testing out a loop
def divisors2(num)
  arr = [1, num]
  current_num = Math.sqrt(num).to_i
  loop do
    if num % current_num == 0
      arr << num / current_num
      arr.prepend(current_num)
    end
    current_num -= 1
    break if current_num == 1
  end
  arr.sort
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891]
# p divisors2(999962000357)
p Benchmark.realtime() { divisors(999962000357) } #== [1, 999979, 999983, 999962000357]
p Benchmark.realtime() { divisors2(999962000357) }