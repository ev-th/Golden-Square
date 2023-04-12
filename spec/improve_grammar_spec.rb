require 'improve_grammar'

RSpec.describe "improve grammar method" do
  it "returns true when passed Hello, world!" do
    expect(check_grammar("Hello, world!")).to eq true
  end

  context "returns false" do
    it "when passed HELLO, world." do
      expect(check_grammar("HELLO, world.")).to eq false
    end

    it "when passed hello world" do
      expect(check_grammar("hello world")).to eq false
    end

    it "when passed hello WoRLD" do
      expect(check_grammar("hello WoRLD")).to eq false
    end

    it "when passed hello WORLD!" do
      expect(check_grammar("hello WORLD!")).to eq false
    end

    it "when passed Hello, world," do
      expect(check_grammar("Hello, world,")).to eq false
    end
  end

  context "fails" do
    it "when passed an empty string" do
      expect { check_grammar("") }.to raise_error "not a valid string"
    end

    it "when passed nil" do
      expect { check_grammar(nil) }.to raise_error "not a valid string"
    end

    it "when passed an integer" do
      expect { check_grammar(1) }.to raise_error "not a valid string"
    end

    it "when passed an array" do
      expect { check_grammar(["hello", "world"]) }.to raise_error "not a valid string"
    end
  end
end
