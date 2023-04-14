require 'diary_entry'

describe DiaryEntry do
  context "when initialized" do
    it "has a title" do
      diary_entry = DiaryEntry.new("title", "This is the contents")
      result = diary_entry.title
      expect(result).to eq "title"
    end
    
    it "has contents" do
      diary_entry = DiaryEntry.new("title", "This is the contents")
      result = diary_entry.contents
      expect(result).to eq "This is the contents"
    end
  end
end
