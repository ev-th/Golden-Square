# File: lib/diary.rb
class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    @entries.sum(&:count_words)
  end

  def reading_time(wpm)
    words = count_words
    (words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "There are no entries" if @entries.empty?

    max_words = wpm * minutes
    possible_reads = @entries.select { |entry| entry.count_words <= max_words }
    fail "All the entries are too long to read" if possible_reads.empty?
    
    possible_reads.max {|entry| entry.count_words }
  end
end
