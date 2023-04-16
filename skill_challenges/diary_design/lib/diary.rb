class Diary
  def initialize
    @entries = []
    @todo_list = TodoList.new
  end

  def all
    @entries
  end

  def add(entry)
    @entries << entry
  end

  def get_longest_possible(wpm, time_available)    
    max_words = wpm * time_available
    readable_entries = @entries.select { |entry| entry.word_count <= max_words }
    
    fail "There are currently no diary entries of readable length" if readable_entries.empty?

    readable_entries.sort_by(&:word_count).last
  end

  def all_phone_numbers
    @entries.reduce([]) { |numbers, entry| numbers + entry.phone_numbers}
  end

  def todos(status = 'all')
    case status
    when 'complete'
      @todo_list.completed_tasks
    when 'incomplete'
      @todo_list.incomplete_tasks
    when 'all'
      @todo_list.all
    else
      fail "Invalid value for 'status'. Accepts 'all', 'complete', or 'incomplete'"
    end
  end

  def add_todo(todo)
    @todo_list.add(todo)
  end
end