require 'diary_entry'

describe DiaryEntry do
  context "initialized with ('TDD', 'Today I learned to test-drive')" do
    it "returns title 'TDD'" do
      diary_entry = DiaryEntry.new('TDD', 'Today I learned to test-drive')
      result = diary_entry.title
      expect(result).to eq "TDD"
    end

    it "returns contents 'Today I learned to test-drive'" do
      diary_entry = DiaryEntry.new('TDD', 'Today I learned to test-drive')
      result = diary_entry.contents
      expect(result).to eq 'Today I learned to test-drive'
    end
    
    it "returns number of words in the contents when count_words is called" do
      diary_entry = DiaryEntry.new('TDD', 'Today I learned to test-drive')
      result = diary_entry.count_words
      expect(result).to eq 5
    end
    
    it "returns the estimated reading time calculated using passed wpm" do
      diary_entry = DiaryEntry.new('TDD', 'Today I learned to test-drive')
      result = diary_entry.reading_time(200)
      expect(result).to eq 1
    end

    it "returns a chunk of the entry using wpm and time available to read" do
      diary_entry = DiaryEntry.new('TDD', 'Today I learned to test-drive')
      result = diary_entry.reading_chunk(1, 4)
      expect(result).to eq "Today I learned to"
    end
  end

  context "initialized with ('Second Title', 'On the second day, I practised debugging. ' * 100)" do
    it "returns title 'Second Title'" do
      diary_entry = DiaryEntry.new('Second Title', 'On the second day, I practised debugging. ' * 100)
      result = diary_entry.title
      expect(result).to eq "Second Title"
    end

    it "returns contents 'On the second day, I practised debugging.'" do
      diary_entry = DiaryEntry.new('Second Title', 'On the second day, I practised debugging. ' * 100)
      result = diary_entry.contents
      expect(result).to eq 'On the second day, I practised debugging. ' * 100
    end
    
    it "returns number of words in the contents when count_words is called" do
      diary_entry = DiaryEntry.new('Second Title', 'On the second day, I practised debugging. ' * 100)
      result = diary_entry.count_words
      expect(result).to eq 700
    end
    
    it "returns the estimated reading time calculated using passed wpm" do
      diary_entry = DiaryEntry.new('Second Title', 'On the second day, I practised debugging. ' * 100)
      result = diary_entry.reading_time(200)
      expect(result).to eq 4
    end

    it "returns sequential chunks of text to read based on wpm and time available to read" do
      diary_entry = DiaryEntry.new('Second Title', 'On the second day, I practised debugging. ' * 100)

      first_chunk = diary_entry.reading_chunk(3, 1)
      expect(first_chunk).to eq "On the second"

      second_chunk = diary_entry.reading_chunk(1, 2)
      expect(second_chunk).to eq "day, I"

      third_chunk = diary_entry.reading_chunk(1, 2)

      fourth_chunk = diary_entry.reading_chunk(200, 200)
      expect(fourth_chunk).to eq 'On the second day, I practised debugging. ' * 98 + 'On the second day, I practised debugging.'

      fifth_chunk = diary_entry.reading_chunk(1, 2)
      expect(fifth_chunk).to eq 'On the'
    end
  end
end
