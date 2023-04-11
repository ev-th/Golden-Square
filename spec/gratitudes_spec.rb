require 'gratitudes'

describe Gratitudes do
  it "adds a gratitude and nicely formats it" do
    gratitudes = Gratitudes.new
    gratitudes.add("Kit Kats")
    result = gratitudes.format
    expect(result).to eq "Be grateful for: Kit Kats"
  end

  it "adds multiple gratitudes and format them in a comma separated list" do
    gratitudes = Gratitudes.new
    gratitudes.add("tests")
    gratitudes.add("more tests")
    gratitudes.add("even more tests")
    result = gratitudes.format
    expect(result).to eq "Be grateful for: tests, more tests, even more tests"
  end
end