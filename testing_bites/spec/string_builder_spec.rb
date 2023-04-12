require 'string_builder'

describe StringBuilder do
  it "concatenates a new string onto the end of itself" do
    str = StringBuilder.new
    str.add("hello")
    result = str.output
    expect(result).to eq "hello"
  end

  it "concatenates a new string onto the end of itself multiple times" do
    str = StringBuilder.new
    str.add("hello")
    str.add("hello")
    str.add("hello")
    result = str.output
    expect(result).to eq "hellohellohello"
  end

  it "returns its own length with size method" do
    str = StringBuilder.new
    str.add("hello, world!")
    result = str.size
    expect(result).to eq 13
  end
end