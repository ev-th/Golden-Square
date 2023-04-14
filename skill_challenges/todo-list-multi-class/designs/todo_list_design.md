# Integration tests
```Ruby
# 1 - Todo list should return all tasks when all are incomplete
todo_list = TodoList.new
todo_1 = Todo.new("task 1")
todo_2 = Todo.new("task 2")
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_list.incomplete 
# => ["task 1", "task 2"]

# 2 - Todo list should return all complete tasks
todo_list = TodoList.new
todo_1 = Todo.new("task 1")
todo_2 = Todo.new("task 2")
todo_list.add(todo_1)
todo_1.mark_done!
todo_list.add(todo_2)
todo_list.complete 
# => ["task 1"]
```