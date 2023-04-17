require 'diary'

RSpec.describe Diary do
  it "reads the contents" do
    diary = Diary.new("my_contents")
    expect(diary.read).to eq "my_contents"
  end
end