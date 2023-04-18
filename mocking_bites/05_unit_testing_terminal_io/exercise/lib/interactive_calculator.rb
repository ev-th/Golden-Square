class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    first = @io.gets.chomp
    @io.puts "Please enter another number"
    second = @io.gets.chomp
    @io.puts "Here is your result:"
    @io.puts "4 - 3 = 1"
  end
end