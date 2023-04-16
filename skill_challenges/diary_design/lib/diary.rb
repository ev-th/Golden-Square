class Diary
  def initialize
    # set up a list for diary entries
    # set up a todo list
    @entries = []
  end

  def all # => []
    @entries
  end

  def add(entry) # => nil
    @entries << entry
  end

  def get_longest_possible(wpm, time_available) # => DiaryEntry
    # Get the longest possible entry that can be read in the time available
    # given the speed in wpm
    fail "There are currently no diary entries" if @entries.empty?
    
    max_words = wpm * time_available
    readable_entries = @entries.select { |entry| entry.word_count <= max_words }
    
    fail "All of the current entries are too long to read" if readable_entries.empty?

    readable_entries.sort_by(&:word_count).last
  end

  def all_phone_numbers
    @entries.reduce([]) { |numbers, entry| numbers + entry.phone_numbers}
  end

  def todos(status = 'all')
    # Returns a list of todos based on whether status == 'all', 'complete', 'incomplete'
    []
  end

  def add_todo(todo)
    # Adds the todo to the Diary's todo list
  end
end