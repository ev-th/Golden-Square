require 'get_most_common_letter'

describe 'get_most_common_letter method' do
  it "returns 'o' when passed 'the roof, the roof, the roof is on fire!'" do
    result = get_most_common_letter('the roof, the roof, the roof is on fire!')
    expect(result).to eq 'o'
  end
end
