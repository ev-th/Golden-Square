class Diary
  def initialize
    # set up a list for diary entries
    # set up a phonebook
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
    fail "There are currently no diary entries"
  end

  def all_phone_numbers # => [String]
    # Returns a list of phone numbers in all diary entries
    []
  end

  def todos(status = 'all')
    # Returns a list of todos based on whether status == 'all', 'complete', 'incomplete'
    []
  end

  def add_todo(todo)
    # Adds the todo to the Diary's todo list
  end
end