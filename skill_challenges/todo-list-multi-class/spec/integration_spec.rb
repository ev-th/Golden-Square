require 'todo'
require 'todo_list'

RSpec.describe "integration tests" do
  context "when incomplete tasks are added" do
    it "shows array of incomplete tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("task 1")
      todo_2 = Todo.new("task 2")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.incomplete).to eq ["task 1", "task 2"]
    end

    it "shows an empty array of complete tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("task 1")
      todo_2 = Todo.new("task 2")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.complete).to eq []
    end
  end
  
  context "when some tasks are completed" do
    it "shows an array of complete tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("task 1")
      todo_2 = Todo.new("task 2")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      expect(todo_list.complete).to eq ["task 1"]
    end
  end
  
  context "when user gives up" do
    it "completes all tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("task 1")
      todo_2 = Todo.new("task 2")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      expect(todo_list.complete).to eq ["task 1", "task 2"]
    end
  end
end
