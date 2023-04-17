require 'secret_diary'

RSpec.describe 'SecretDiary integration 'do
  it "reads the diary" do
    diary = Diary.new("my_contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(
      secret_diary.read
    ).to eq "my_contents"
  end
end