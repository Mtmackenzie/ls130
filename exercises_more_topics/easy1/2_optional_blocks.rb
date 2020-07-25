# 2 Optional Blocks

def compute(n)
  block_given? ? yield(n, n) : "Does not compute."
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'
p compute(2) { |num| num + num } == 4
p compute(1) { |num1, num2| "#{num1}#{num2}".to_i } == 11
p compute(3) == "Does not compute."
