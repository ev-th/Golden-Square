require 'report_length'

describe "report_length method" do
  it "returns 'This string was 5 characters long.' when passed 'hello'" do
    result = report_length('hello')
    expect(result).to eq "This string was 5 characters long."
  end

  it "returns 'This string was 0 characters long.' when passed empty string" do
    result = report_length('')
    expect(result).to eq "This string was 0 characters long."
  end

  it "returns 'This string was 1 character long.' when passed 'a'" do
    result = report_length('a')
    expect(result).to eq "This string was 1 character long."
  end
end