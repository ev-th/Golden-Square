require 'diary_entry'

describe DiaryEntry do
  context "passed incompatible arguments to initialize" do
    it "fails when title is empty string" do
      expect { DiaryEntry.new("", "contents") }.to raise_error "title and contents must not be empty"
    end

    it "fails when contents is empty string" do
      expect { DiaryEntry.new("title", "") }.to raise_error "title and contents must not be empty"
    end

    it "fails when title is not a string" do
      expect { DiaryEntry.new(1, "contents") }.to raise_error "title and contents must be strings"
    end

    it "fails when contents is not a string" do
      expect { DiaryEntry.new("title", nil) }.to raise_error "title and contents must be strings"
    end
  end

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
  
  it "counts the total number of words" do
    diary_entry = DiaryEntry.new("title", "This is the contents")
    result = diary_entry.count_words
    expect(result).to eq 4
  end
  
  describe "#reading_time" do
    it "calculates reading time based on words per minute" do
      diary_entry = DiaryEntry.new("title", "This is the contents")
      result = diary_entry.reading_time(2)
      expect(result).to eq 2
    end

    it "rounds up to the nearest minute" do
      diary_entry = DiaryEntry.new("title", "This is the contents of the diary entry")
      result = diary_entry.reading_time(3)
      expect(result).to eq 3
    end
    
    context "fails when passed anything other than Integer" do
      it "fails when passed nil" do
        diary_entry = DiaryEntry.new("title", "This is the contents of the diary entry")
        expect {diary_entry.reading_time(nil)}.to raise_error "Expected wpm to be an Integer"
      end

      it "fails when passed String" do
        diary_entry = DiaryEntry.new("title", "This is the contents of the diary entry")
        expect {diary_entry.reading_time("string")}.to raise_error "Expected wpm to be an Integer"
      end
    end
  end

  describe "#reading_chunk" do
    context "when disible perfectly into readable chunks" do
      it "returns the first readable chunk" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "read the"
      end

      it "returns the next readable chunk" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "contents of"
      end

      it "returns the last readable chunk" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "the entry"
      end

      it "loops back to the beginning once complete" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        diary_entry.reading_chunk(2, 1)
        result = diary_entry.reading_chunk(2, 1)
        expect(result).to eq "read the"
      end
    end
    
    context "when not disible perfectly into readable chunks" do
      it "returns the remainder of the contents when there's not enough left" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        diary_entry.reading_chunk(4, 1)
        result = diary_entry.reading_chunk(4, 1)
        expect(result).to eq "the entry"
      end

      it "loops back to the beginning once complete" do
        diary_entry = DiaryEntry.new("title", "read the contents of the entry")
        result = diary_entry.reading_chunk(4, 1)
        expect(result).to eq "read the contents of"
      end
    end
  end
end
