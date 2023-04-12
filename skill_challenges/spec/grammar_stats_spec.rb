require 'grammar_stats'

describe GrammarStats do
  describe "#check" do
    context "given a sentence" do
      it "returns true if it starts with a capital letter and ends with appropriate punctuation" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello world!")
        expect(result).to eq true
      end

      it "returns false if it starts with a lowercase letter" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("hello world!")
        expect(result).to eq false
      end

      it "returns false if it doesn't end with punctuation" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello world")
        expect(result).to eq false
      end

      it "returns false if it ends with inappropriate punctuation" do
        grammar_stats = GrammarStats.new
        result = grammar_stats.check("Hello world,")
        expect(result).to eq false
      end
    end
    
    context "given the wrong type as argument" do
      it "raises an error when nil" do
        grammar_stats = GrammarStats.new
        expect { grammar_stats.check(nil) }.to raise_error "Wrong type argument provided. Should be String."
      end

      it "raises an error when Integer" do
        grammar_stats = GrammarStats.new
        expect { grammar_stats.check(1) }.to raise_error "Wrong type argument provided. Should be String."
      end
    end
  end

  describe "#percentage_good" do
    context "when a positive number of texts have been checked" do
      it "returns 50 with one passed and one failed check" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello, world!")
        grammar_stats.check("hello, world")
        result = grammar_stats.percentage_good
        expect(result).to eq 50
      end
      
      it "returns 0 with one failed check" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("hello, world")
        result = grammar_stats.percentage_good
        expect(result).to eq 0
      end

      it "returns 67 with one failed and two passed checks" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello, world.")
        grammar_stats.check("Hello, world.")
        grammar_stats.check("hello, world")
        result = grammar_stats.percentage_good
        expect(result).to eq 67
      end
    end
    
    context "when there have been no checks" do
      it "fails" do
        grammar_stats = GrammarStats.new
        expect { grammar_stats.percentage_good }.to raise_error "There have not been any checks yet."
      end
    end
  end
end
