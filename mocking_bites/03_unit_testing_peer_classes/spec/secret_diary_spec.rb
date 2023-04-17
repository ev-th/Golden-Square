require 'secret_diary'

RSpec.describe SecretDiary do
  it 'it constructs' do
    diary_dbl = double :Diary
    expect( SecretDiary.new(diary_dbl) ).to be
  end

  it 'raises an error on a locked diary' do
    diary_dbl = double :Diary
    secret_diary = SecretDiary.new(diary_dbl)
    expect{
      secret_diary.read
    }.to raise_error 'Go away!'
  end

  it 'unlocks and reads' do
    diary_dbl = double :Diary, read: 'contents'
    secret_diary = SecretDiary.new(diary_dbl)
    secret_diary.unlock
    expect(
      secret_diary.read
    ).to eq "contents"
  end

  it 'relocks' do
    diary_dbl = double :Diary, read: 'contents'
    secret_diary = SecretDiary.new(diary_dbl)
    secret_diary.unlock
    secret_diary.lock
    expect{
      secret_diary.read
    }.to raise_error "Go away!"
  end
end
