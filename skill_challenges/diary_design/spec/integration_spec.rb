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
    it "has a list of them" do
      diary = Diary.new
      entry1 = DiaryEntry.new("title 1", "content 1")
      entry2 = DiaryEntry.new("title 2", "content 2")
      diary.add(entry1)
      diary.add(entry2)
      expect(diary.all).to eq [entry1, entry2]
    end
  
    describe "#get_longest_possible" do
      context "when none of the entries are short enough to read" do
        it "fails" do
          diary = Diary.new
          entry1 = DiaryEntry.new("title1", "Content for entry1")
          entry2 = DiaryEntry.new("title1", "Even longer content for entry2")
          diary.add(entry1)
          diary.add(entry2)
          expect { diary.get_longest_possible(1, 1) }.to raise_error(
            "All of the current entries are too long to read"
          )
        end
      end
      
      context "when there is an entry of the exact length to read" do
        it "returns that entry" do
          diary = Diary.new
          entry1 = DiaryEntry.new("title1", "Short content")
          entry2 = DiaryEntry.new("title1", "1, 2, 3")
          entry3 = DiaryEntry.new("title1", "Exactly the right length")
          entry4 = DiaryEntry.new("title1", "The length of entry 4 is too long")
          diary.add(entry1)
          diary.add(entry2)
          diary.add(entry3)
          diary.add(entry4)
          result = diary.get_longest_possible(2, 2)
          expect(result).to eq entry3
        end
      end
      
      context "when there are some longer and some shorter entries" do
        it "returns the longest that can be read in the time" do
          diary = Diary.new
          entry1 = DiaryEntry.new("title1", "Short content")
          entry2 = DiaryEntry.new("title1", "1, 2, 3")
          entry3 = DiaryEntry.new("title1", "This is moderately lengthy")
          entry4 = DiaryEntry.new("title1", "The length of entry 4 is too long")
          diary.add(entry1)
          diary.add(entry2)
          diary.add(entry3)
          diary.add(entry4)
          result = diary.get_longest_possible(3, 2)
          expect(result).to eq entry3
        end
      end
    end
    
    describe "#all_phone_numbers" do
      context "when none of the entries contain valid phone numbers" do
        it "returns an empty array" do
          diary = Diary.new
          entry1 = DiaryEntry.new("title1", "Content with no phone number")
          entry2 = DiaryEntry.new("title1", "Content with an invalid number 12345678")
          diary.add(entry1)
          diary.add(entry2)
          result = diary.all_phone_numbers
          expect(result).to eq []
        end
      end

      context "when entries contain one or more phone numbers" do
        it "returns a list of all the phone numbers" do
          diary = Diary.new
          entry1 = DiaryEntry.new("title1", "12345678901")
          entry2 = DiaryEntry.new("title2", "09876543212, 13579864213")
          entry3 = DiaryEntry.new("title3", "no phone number")
          diary.add(entry1)
          diary.add(entry2)
          diary.add(entry3)
          result = diary.all_phone_numbers
          expect(result).to eq [
            "12345678901",
            "09876543212",
            "13579864213"
          ]
        end
      end
    end
  end

  context "when todos are added" do
    describe "#todos" do
      context "when passed status='all' (default)" do
        it "returns all todos in the todo list" do
          diary = Diary.new
          todo1 = Todo.new("title1", "content1")
          todo2 = Todo.new("title2", "content2")
          diary.add_todo(todo1)
          diary.add_todo(todo2)
          expect(diary.todos).to eq [todo1, todo2]
        end
      end
      
      context "when passed status='complete'" do
        xit "returns all completed todos in the todo list" do
          diary = Diary.new
          todo1 = Todo.new("title1", "content1")
          todo2 = Todo.new("title2", "content2")
          diary.add_todo(todo1)
          diary.add_todo(todo2)
          todo1.mark_complete!
          result = diary.todos(status='complete')
          expect(result).to eq [todo1]
        end
      end

    end
  end
end
# Diary
  # When todos are added
    # #todos returns all of them
    # #todos(status = 'complete') returns completed todos
    # #todos(status = 'incomplete') returns incomplete todos