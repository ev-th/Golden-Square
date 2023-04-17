require 'task_formatter'

RSpec.describe TaskFormatter do
  it 'it constructs' do
    task_dbl = double :Task
    expect( TaskFormatter.new(task_dbl) ).to be
  end

  it 'formats not complete Task' do
    task_dbl = double :Task, complete?: false, title: 'title'
    task_formatter = TaskFormatter.new(task_dbl)
    expect(
      task_formatter.format
    ).to eq '- [ ] title'
  end

  it 'formats complete Task' do
    task_dbl = double :Task, complete?: true, title: 'title'
    task_formatter = TaskFormatter.new(task_dbl)
    expect(
      task_formatter.format
    ).to eq '- [X] title'
  end
end
