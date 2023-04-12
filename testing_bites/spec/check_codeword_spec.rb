require 'check_codeword'

describe 'check_codeword method' do
  it "returns 'Correct! Come in.' when passed 'horse'" do
    result = check_codeword('horse')
    expect(result).to eq 'Correct! Come in.'
  end

  it "returns 'Close, but nope.' when passed 'home'" do
    result = check_codeword('home')
    expect(result).to eq 'Close, but nope.'
  end 

  it "returns 'WRONG!' when passed 'hello'" do
    result = check_codeword('hello')
    expect(result).to eq 'WRONG!'
  end 
end