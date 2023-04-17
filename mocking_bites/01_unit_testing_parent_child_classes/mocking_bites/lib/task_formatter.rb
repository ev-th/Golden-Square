class TaskFormatter
  def initialize(task) # task is an instance of Task
    @task = task
  end

  def format
    # Returns the task formatted as a string.
    # If the task is not complete, the format is:
    # - [ ] Task title
    # If the task is complete, the format is:
    # - 
=begin
    if @task.complete?
      return "- [X] #{@task.title}"
    else
      return "- [ ] #{@task.title}"
    end
    #return "- [#{@task.complete? ? 'X' : ' '}] #{@task.title}"
=end
    

    prefix = @task.complete? ? '- [X] ' : '- [ ] '
    return prefix + @task.title
  end
end
