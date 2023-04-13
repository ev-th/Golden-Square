class TaskManager
  def initialize
    @tasks = []
  end

  def tasks
    return "No tasks to complete." if @tasks.empty?
    return "TODO: #{@tasks.join(", ")}"
  end

  def add_task(task)
    @tasks << task
  end

  def mark_as_complete(task)
    fail "Task is not in the task list." if !@tasks.include?(task)
    @tasks.delete(task)
    "Completed: #{task}"
  end
end