require 'cat_facts'

describe CatFacts do
  it "provides a formatted fact about cats" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get)
      .with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"In just 7 years, one un-spayed female cat and one un-neutered male cat and their offspring can result in 420,000 kittens.","length":121}')

    cat_facts = CatFacts.new(requester=fake_requester)
    result = cat_facts.provide
    
    expected = "Cat fact: In just 7 years, one un-spayed female cat and one un-neutered male cat and their offspring can result in 420,000 kittens."
    expect(result).to eq expected
  end
end