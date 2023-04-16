require "diary"
require "diary_entry"
require "todo_list"
require "todo"

describe "integration" do
  context "when Diary is initialized" do
    it "has an empty list of phone numbers" do
      diary = Diary.new
      expect(diary.all_phone_numbers).to eq []
    end

    it "has an empty list of diary entries" do
      diary = Diary.new
      expect(diary.all).to eq []
    end

    it "fails to get the longest possible entry" do
      diary = Diary.new
      expect { diary.get_longest_possible(2, 2) }.to raise_error(
        "There are currently no diary entries"
      )
    end

    describe "#todos" do
      it "returns an empty list of todos" do
        diary = Diary.new
        expect(diary.todos).to eq []
      end
      
      it "returns an empty list of completed todos" do
        diary = Diary.new
        result = diary.todos(status='complete')
        expect(result).to eq []
      end

      it "returns an empty list of incomplete todos" do
        diary = Diary.new
        result = diary.todos(status='incomplete')
        expect(result).to eq []
      end
    end
  end

  context "when Diary has multiple entries" do
    xit "has a list of them" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title 1", "content 1")
      entry2 = DiaryEntry.new("title 2", "content 2")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [entry1, entry2]
    end
  end
end

# Diary
  # When provided with multiple entries
    # provides a list of them
    # #get_longest_possible
      # Fails to get longest possible entry when none are short enough
      # When there is an entry exactly the right length, it will return that as the longest possible entry
      # When there is a selection of longer and shorter entries, it will return the longest that is possible to read
    # #all_phone_numbers
      # Returns empty list when entries don't have phone numbers
      # Returns all phone numbers when entries have one or more phone numbers
  # When todos are added
    # #todos returns all of them
    # #todos(status = 'complete') returns completed todos
    # #todos(status = 'incomplete') returns incomplete todos