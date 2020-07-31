# 6 Method to Proc

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc  # #method looks for method with the name of the symbol and returns a Method object, which we then convert to a proc object

p [8, 10, 12, 14, 16, 33].map(&base8_proc)  # since base8_proc is now a proc object, we need to convert it to a block by using the & operator
# could also be written as: arr.map { |num| convert_to_base_8(num) } or arr.map { |n| n.to_s(8).to_i }
# "Remember that using just & (and not &:) lets us turn a Proc object to a block."

# The expected return value of map on this number array should be:
# [10, 12, 14, 16, 20, 41]