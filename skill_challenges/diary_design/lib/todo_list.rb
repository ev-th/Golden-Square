class TodoList
  def initialize
    # set up list for todos
    @todos = []
  end

  def all # => [Todo]
    @todos
  end

  def completed_tasks # => [Todo]
    @todos.select(&:complete?)
  end
  
  def incomplete_tasks # => [Todo]
    @todos.reject(&:complete?)
  end

  def add(todo)
    @todos << todo
  end
end