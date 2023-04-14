require 'diary'
require 'diary_entry'

describe "Diary and DiaryEntry integration" do
  context "when two DiaryEntry objects are added to Diary" do
    xit "returns a list of those instances of DiaryEntry" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      result = diary.all
      expect(result).to eq [diary_entry1, diary_entry2]
    end
    
    xit "counts the total number of words in all diary entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      result = diary.count_words
      expect(result).to eq 13
    end
    
    xit "returns an estimate of the reading time for all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      result = diary.reading_time(2)
      expect(result).to eq 7
    end
    
    xit "finds the best entry to read given wpm and minutes available for reading" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("title1", "diary entry 1 contents.")
      diary_entry2 = DiaryEntry.new("title2", "this is the contents for the second diary entry.")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.find_best_entry_for_reading_time(2, 3)
      expect(result).to eq diary_entry1
    end
  end
end