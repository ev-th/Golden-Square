class Todo
  attr_reader :title, :content

  def initialize(title, content)
    @title = title
    @content = content
    @complete = false
  end

  def mark_complete!
    fail "todo is already complete" if @complete
    @complete = true
  end

  def word_count
    @content.split(" ").length
  end

  def complete?
    @complete
  end
end