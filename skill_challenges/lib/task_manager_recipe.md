# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

```ruby
class TaskManager
  def initialize
    # ...
  end

  def tasks
    # Return list of tasks
  end

  def add_task(task) # task is a string
    # No return value
    # Add task to list
  end

  def mark_as_complete(task) # task is a string
    # Return "Completed - task"
    # Remove task from the list
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
task_manager = TaskManager.new
task_manager.tasks # => "No tasks to complete."

# 2
task_manager = TaskManager.new
task_manager.add_task("Walk the dog")
task_manager.tasks # => "TODO: Walk the dog"

# 3
task_manager = TaskManager.new
task_manager.add_task("Walk the dog")
task_manager.add_task("Do the dishes")
task_manager.tasks # => "TODO: Walk the dog, Do the dishes"

# 4
task_manager = TaskManager.new
task_manager.add_task("Walk the dog")
task_manager.mark_as_complete("Walk the dog") # => "Completed: Walk the dog"

# 5
task_manager = TaskManager.new
task_manager.add_task("Walk the dog")
task_manager.mark_as_complete("Walk the dog")
task_manager.tasks # => "No tasks to complete."

# 6
task_manager = TaskManager.new
task_manager.add_task("Walk the dog")
task_manager.add_task("Do the dishes")
task_manager.mark_as_complete("Walk the dog")
task_manager.tasks # => "TODO: Do the dishes"

# 7
task_manager = TaskManager.new
task_manager.mark_as_complete("Walk the dog") # => error "Task is not in the task list."
```

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->