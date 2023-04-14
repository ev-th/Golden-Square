require 'todo'

RSpec.describe Todo do
  context "returns" do
    it "task" do
      todo = Todo.new("task 1")
      expect(todo.task).to eq "task 1"
    end
  end

  describe "#done?" do
    it "returns false when task not completed" do
      todo = Todo.new("task")
      expect(todo.done?).to eq false
    end

    it "return true when task is completed" do
      todo = Todo.new("task")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end

  context "fails" do
    it "when passed nil" do
      expect { Todo.new(nil) }.to raise_error "No task provided."
    end

    it "when passed empty string" do
      expect { Todo.new("") }.to raise_error "No task provided."
    end
  end
end
