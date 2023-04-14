class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    fail "title and contents must be strings" unless title.is_a?(String) && contents..is_a?(String)
    fail "title and contents must not be empty" if title.empty? || contents.empty?
    
    @title = title
    @contents = contents
    @bookmark = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    words = @contents.split(" ")
    words.length
  end

  def reading_time(wpm)
    fail "Expected wpm to be an Integer" unless wpm.is_a?(Integer) 
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    readable_words = wpm * minutes
    words = @contents.split(" ")
    chunk = words.slice(@bookmark, readable_words).join(" ")
    @bookmark += readable_words
    @bookmark = 0 if @bookmark >= count_words
    chunk
  end
end