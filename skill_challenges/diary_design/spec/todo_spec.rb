#Todo
  # #mark_complete!
    #complete? == true
    # fails when already marked as complete

require 'todo'

RSpec.describe Todo do
  context "when initialized" do
    it "has a title" do
      todo = Todo.new("title1", "content1")
      expect(todo.title).to eq "title1"
    end

    it "has content" do
      todo = Todo.new("title1", "content1")
      expect(todo.content).to eq "content1"
    end
    
    it "is marked as incomplete" do
      todo = Todo.new("title1", "content1")
      expect(todo.complete?).to eq false
    end
    
    describe "#word_count" do
      context "when content is an empty string" do
        it "returns 0" do
          todo = Todo.new("title1", "")
          expect(todo.word_count).to eq 0
        end
      end

      context "when content is one word" do
        it "returns 1" do
          todo = Todo.new("title1", "content1")
          expect(todo.word_count).to eq 1
        end
      end

      context "when content is multiple words" do
        it "returns the number of words in content" do
          todo = Todo.new("title1", "This content contains multiple words")
          expect(todo.word_count).to eq 5
        end
      end
    end
  end

  describe "#mark_complete!" do
    context "when called and todo is not complete" do
      it "marks the todo as complete" do
        todo = Todo.new("title1", "content1")
        todo.mark_complete!
        expect(todo.complete?).to eq true
      end
    end

    context "when called and todo is already complete" do
      it "fails" do
        todo = Todo.new("title1", "content1")
        todo.mark_complete!
        expect { todo.mark_complete! }.to raise_error "todo is already complete"
      end
    end
  end
end
