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

    result = first.to_i - second.to_i
    @io.puts "Here is your result:"
    @io.puts"#{first} - #{second} = #{result}"
  end
end