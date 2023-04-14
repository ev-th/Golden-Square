require 'diary'
require 'diary_entry'

describe "Diary and DiaryEntry integration" do
  it "returns a list of diary entries" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
    diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    result = diary.all
    expect(result).to eq [diary_entry1, diary_entry2]
  end
  
  it "counts the total number of words in all diary entries" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
    diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    result = diary.count_words
    expect(result).to eq 13
  end
  
  it "returns an estimate of the reading time for all entries" do
    diary = Diary.new
    diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
    diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
    diary.add(diary_entry1)
    diary.add(diary_entry2)
    result = diary.reading_time(2)
    expect(result).to eq 7
  end
  
  describe "#find_best_entry_for_reading_time" do
    it "doesn't return an entry that's too long" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      result = diary.find_best_entry_for_reading_time(2, 3)
      expect(result).to eq diary_entry1
    end
    
    it "finds the longest entry that the user can read in the time" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary_entry3 = DiaryEntry.new("title3", "this is the contents for the third diary entry that is too long to read.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      result = diary.find_best_entry_for_reading_time(2, 5)
      expect(result).to eq diary_entry2
    end
    
    it "fails when all the entries are too long to read" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary.add(diary_entry1)
      expect {
        diary.find_best_entry_for_reading_time(1, 1)
      }.to raise_error "All the entries are too long to read"
    end
  end
end