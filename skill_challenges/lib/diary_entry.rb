class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end

  def reading_time(wpm)
    (count_words.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    @bookmark_index ||= 0
    number_of_words = wpm * minutes
    words = @contents.split(" ")
    chunk = words.slice(@bookmark_index, number_of_words).join(" ")
    @bookmark_index += number_of_words
    @bookmark_index = 0 if @bookmark_index >= count_words
    chunk
  end
end