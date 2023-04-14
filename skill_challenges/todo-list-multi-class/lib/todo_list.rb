class TodoList
  def initialize
    @todo_list = []
  end

  def all
    return @todo_list
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    # Returns all non-done todos
    incomplete_tasks = []
    @todo_list.each do |task|
      if !task.done?
        incomplete_tasks << task.task
      end
    end
    return incomplete_tasks
  end

  def complete
    completed_tasks = @todo_list.select { |todo| todo.done? }
    completed_tasks.map {|todo| todo.task}
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.each { |task| task.mark_done!}
  end
end