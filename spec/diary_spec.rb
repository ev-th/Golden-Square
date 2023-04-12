require "diary"

describe "make_snippet method" do
  it "takes a string and returns the first five words followed by '...'" do
    str = "This is a test argument for this method"
    result = make_snippet(str)
    expect(result).to eq "This is a test argument..."
  end

  it "takes a string and returns all five words when exactly five words long" do
    str = "This is a test argument"
    result = make_snippet(str)
    expect(result).to eq "This is a test argument"
  end

  it "takes a string and returns all words if less than 5 words long" do
    str = "This is a test!"
    result = make_snippet(str)
    expect(result).to eq "This is a test!"
  end

  it "returns empty string when given empty string" do
    result = make_snippet("")
    expect(result).to eq ""
  end
end

describe "count_words method" do
  it "takes a string as argument and returns the number of words in the string" do
    result = count_words("This is a test")
    expect(result).to eq 4
  end

  it "returns 0 when given empty string" do
    result = count_words("")
    expect(result).to eq 0
  end
end
