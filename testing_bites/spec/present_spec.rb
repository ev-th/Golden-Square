require 'present'

describe Present do
  context "when no contents have been wrapped" do
    it "wraps the contents" do
      present = Present.new
      result = present.wrap('toy')
      expect(result).to eq 'toy'
    end

    it "fails when unwrapping" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end

  context "when contents have been wrapped" do
    it "fails to wrap content" do
      present = Present.new
      present.wrap('toy')
      expect { present.wrap('chocolate') }.to raise_error "A contents has already been wrapped."
    end

    it "reveals the content when unwrapped" do
      present = Present.new
      present.wrap('toy')
      result = present.unwrap
      expect(result).to eq 'toy'
    end
  end

end

