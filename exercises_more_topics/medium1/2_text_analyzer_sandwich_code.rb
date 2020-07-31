# 2 Text Analyzer - Sandwich Code
# Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

class TextAnalyzer
  def initialize(file)
    @file = file
  end

  def process
    new_file = File.open(@file)
    yield(new_file.read) if block_given?
    new_file.close
  end
end

analyzer = TextAnalyzer.new("sample_text.txt")
analyzer.process { |text| puts "#{text.split(".\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(" ").size} words" }

# Sample Output:

# 3 paragraphs
# 15 lines
# 126 words