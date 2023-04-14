require 'diary'

describe Diary do
  context "when initialized" do
    it "has an empty list of entries" do
      diary = Diary.new
      result = diary.all
      expect(result).to eq []
    end

    it "counts 0 words" do
      diary = Diary.new
      result = diary.count_words
      expect(result).to eq 0
    end

    it "has a reading time of 0" do
      diary = Diary.new
      result = diary.reading_time(2)
      expect(result).to eq 0
    end

    it "fails when asked to best entry" do
      diary = Diary.new
      expect {
        diary.find_best_entry_for_reading_time(2, 3)
      }.to raise_error "There are no entries"
    end
  end
end