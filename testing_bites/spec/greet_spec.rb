require 'greet'

describe "greet method" do
  it "returns 'Hello, Evan!' when passed 'Evan'" do
    expect(greet('Evan')).to eq 'Hello, Evan!'
  end
end
