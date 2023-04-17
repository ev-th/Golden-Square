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
end
