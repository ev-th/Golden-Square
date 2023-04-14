require 'todo_list'

RSpec.describe TodoList do
  context "constructs" do
    it "empty hash when passed nothing" do
      todo_list = TodoList.new()
      expect(todo_list.all).to eq []
    end
  end

  context "when adding tasks" do
    it "returns task when one task added" do
      todo_list = TodoList.new()
      todo_list.add("string")
      expect(todo_list.all).to eq ["string"]
    end

    it "returns list of tasks when multiple tasks added" do
      todo_list = TodoList.new()
      todo_list.add("string")
      todo_list.add("string two")
      expect(todo_list.all).to eq ["string", "string two"]
    end
  end
end
