require 'task_manager'

describe TaskManager do
  context "when has no tasks listed" do
    describe "#tasks" do
      it "returns 'No tasks to complete.'" do
        task_manager = TaskManager.new
        result = task_manager.tasks
        expect(result).to eq "No tasks to complete."
      end
    end
  end

  context "when one task added" do
    describe "#tasks" do
      it "returns formatted prefix + task" do
        task_manager = TaskManager.new
        task_manager.add_task("Walk the dog")
        result = task_manager.tasks
        expect(result).to eq "TODO: Walk the dog"
      end
    end

    describe "#mark_as_complete" do
      it "returns formatted prefix + task" do
        task_manager = TaskManager.new
        task_manager.add_task("Walk the dog")
        result = task_manager.mark_as_complete("Walk the dog")
        expect(result).to eq "Completed: Walk the dog"
      end

      it "removes task from the list" do
        task_manager = TaskManager.new
        task_manager.add_task("Walk the dog")
        task_manager.mark_as_complete("Walk the dog")
        result = task_manager.tasks
        expect(result).to eq "No tasks to complete."
      end

      context "when task is not in task list" do
        it "raises an error" do
          task_manager = TaskManager.new
          expect {
            task_manager.mark_as_complete("Walk the dog")
          }.to raise_error "Task is not in the task list."
        end
      end
    end
  end

  context "when two tasks added" do
    describe "#tasks" do
      it "returns formatted prefix + comma separated tasks" do
        task_manager = TaskManager.new
        task_manager.add_task("Walk the dog")
        task_manager.add_task("Do the dishes")
        result = task_manager.tasks 
        expect(result).to eq "TODO: Walk the dog, Do the dishes"
      end
    end

    context "and then one task removed" do
      describe "# mark_as_complete" do
        it "removes only that task from the list." do
          task_manager = TaskManager.new
          task_manager.add_task("Walk the dog")
          task_manager.add_task("Do the dishes")
          task_manager.mark_as_complete("Walk the dog")
          result = task_manager.tasks # => "TODO: Do the dishes"
          expect(result).to eq "TODO: Do the dishes"
        end
      end
    end
  end
end