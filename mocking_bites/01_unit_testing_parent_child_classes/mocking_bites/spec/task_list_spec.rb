require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  context "all method testing" do
    it 'returns correctly for single task' do
      task_list = TaskList.new
      task_dbl = double :Task
      task_list.add(task_dbl)
      expect(
        task_list.all
      ).to eq [task_dbl]
    end
    it 'returns correctly for multiple tasks' do
      task_list = TaskList.new
      task_1_dbl = double :Task
      task_2_dbl = double :Task
      task_list.add(task_1_dbl)
      task_list.add(task_2_dbl)
      expect(
        task_list.all
      ).to eq [task_1_dbl, task_2_dbl]
    end
  end

  context "#all_complete" do
    it "returns false when all tasks are incomplete" do
      task_list = TaskList.new
      fake_task1 = double :Task, complete?: false
      fake_task2 = double :Task, complete?: false
      task_list.add(fake_task1)
      task_list.add(fake_task2)
      expect(
        task_list.all_complete?
      ).to eq false
    end
    
    it "returns true when all tasks are complete" do
      task_list = TaskList.new
      fake_task1 = double :Task, complete?: true
      fake_task2 = double :Task, complete?: true
      task_list.add(fake_task1)
      task_list.add(fake_task2)
      expect(
        task_list.all_complete?
      ).to eq true
    end
    
    it "returns false when some tasks are complete and some incomplete" do
      task_list = TaskList.new
      fake_task1 = double :Task, complete?: true
      fake_task2 = double :Task, complete?: false
      task_list.add(fake_task1)
      task_list.add(fake_task2)
      expect(
        task_list.all_complete?
      ).to eq false
    end
  end
end
