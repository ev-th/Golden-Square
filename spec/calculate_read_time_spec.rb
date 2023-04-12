require 'calculate_read_time'

RSpec.describe "calculate_read_time method" do
  it "returns 0 when passed empty string" do
    result = calculate_read_time("")
    expect(result).to eq 0
  end

  it "returns 1 when passed one word" do
    result = calculate_read_time("hello")
    expect(result).to eq 1
  end

  it "returns 1 when passed 200 words" do
    result = calculate_read_time("hello " * 200)
    expect(result).to eq 1
  end

  it "returns 10 when passed 2000 words" do
    result = calculate_read_time("hello " * 2000)
    expect(result).to eq 10
  end

  it "returns 11 when passed 2001 words" do
    result = calculate_read_time("hello " * 2001)
    expect(result).to eq 11
  end

  it "returns 11 when passed 2199 words" do
    result = calculate_read_time("hello " * 2199)
    expect(result).to eq 11
  end

  context "fails when passed the wrong type" do
    it "fails when passed integer" do
      expect { calculate_read_time(1) }.to raise_error "invalid input - not a string"
    end
    it "fails when passed nil" do
      expect { calculate_read_time(nil) }.to raise_error "invalid input - not a string"
    end
    it "fails when passed float" do
      expect { calculate_read_time(1.5) }.to raise_error "invalid input - not a string"
    end
    it "fails when passed an array" do
      expect { calculate_read_time(["hello", "hello"]) }.to raise_error "invalid input - not a string"
    end
  end
end