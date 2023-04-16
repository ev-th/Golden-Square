class DiaryEntry
  attr_reader :title, :content
  
  def initialize(title, content)
    @title = title
    @content = content
  end

  def word_count # => Integer
    @content.split(" ").length
  end

  def phone_numbers # => [String]
    numbers = @content.scan(/[0-9]+/)
    numbers.select { |n| n.length == 11 }
  end
end