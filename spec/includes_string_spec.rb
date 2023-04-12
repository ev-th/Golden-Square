require "includes_string"

describe "includes_string? method" do
  it "returns true when passed '#TODO Hello world'" do
    result = includes_string?('#TODO Hello world')
    expect(result).to eq true
  end
  
  it "returns true when passed 'Hello world #TODO'" do
    result = includes_string?('Hello world #TODO')
    expect(result).to eq true
  end
  
  it "returns false when passed 'Hello world'" do
    result = includes_string?('Hello world')
    expect(result).to eq false
  end
  
  it "returns false when passed empty string" do
    result = includes_string?('')
    expect(result).to eq false
  end
end
