require 'counter'

describe Counter do
  it "reports its total count" do
    counter = Counter.new
    result = counter.report
    expect(result).to eq "Counted to 0 so far."
  end

  it "Adds to itself by the number that's passed to the add method." do
    counter = Counter.new
    counter.add(4)
    counter.add(3)
    result = counter.report
    expect(result).to eq "Counted to 7 so far."
  end
end
