require 'todo_list'

describe TodoList do
  context "when initialized" do
    it "has an empty list of tasks" do
      todo_list = TodoList.new
      expect(todo_list.all).to eq []
    end
    
    it "has an empty list of completed_tasks" do
      todo_list = TodoList.new
      expect(todo_list.completed_tasks).to eq []
    end
    
    it "has an empty list of incomplete_tasks" do
      todo_list = TodoList.new
      expect(todo_list.incomplete_tasks).to eq []
    end
  end
end