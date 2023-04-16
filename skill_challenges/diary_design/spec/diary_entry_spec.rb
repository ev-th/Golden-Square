require 'diary_entry'

describe DiaryEntry do
  it "has a title" do
    entry = DiaryEntry.new("title1", "content1")
    expect(entry.title).to eq "title1"
  end
  
  it "has content" do
    entry = DiaryEntry.new("title1", "content1")
    expect(entry.content).to eq "content1"
  end
  
  context "given no content" do
    it "has a word_count of 0" do
      entry = DiaryEntry.new("title1", "")
      expect(entry.word_count).to eq 0
    end
  end
  
  context "given one word of content" do
    it "has a word_count of 1" do
      entry = DiaryEntry.new("title1", "content1")
      expect(entry.word_count).to eq 1
    end
  end
  
  context "given multiple words of content" do
    it "counts all the words" do
      entry = DiaryEntry.new("title1", "content of multiple words")
      expect(entry.word_count).to eq 4
    end
  end

  describe "#phone_numbers" do
    context "when content contains no phone numbers" do
      it "returns an empty list" do
        content = "This entry contains no phone numbers."
        entry = DiaryEntry.new("title", content)
        expect(entry.phone_numbers).to eq []
      end
    end

    context "when content contains one phone number" do
      it "returns a list containing that phone number" do
        content = "This is a phone number 12436954723"
        entry = DiaryEntry.new("title", content)
        expect(entry.phone_numbers).to eq ["12436954723"]
      end
    end

    context "when content contains multiple phone numbers" do
      it "returns a list containing all those phone numbers" do
        content = "Phone1 - 12436954723, phone2 - 20683578965, 13579864234"
        entry = DiaryEntry.new("title", content)
        expect(entry.phone_numbers).to eq ["12436954723", "20683578965", "13579864234"]
      end
    end

    context "when content contains invalid phone numbers" do
      it "returns an empty list" do
        content = "6 digits - 123456, 12 digits - 123456789098"
        entry = DiaryEntry.new("title", content)
        expect(entry.phone_numbers).to eq []
      end
    end

    context "when content contains valid and invalid numbers" do
      it "returns an empty list" do
        content = "11 digits - 12345678909, 12 digits - 123456789098"
        entry = DiaryEntry.new("title", content)
        expect(entry.phone_numbers).to eq ["12345678909"]
      end
    end
  end
end