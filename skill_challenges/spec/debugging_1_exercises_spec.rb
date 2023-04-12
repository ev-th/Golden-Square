require 'debugging_1_exercises'

describe "say_hello method" do
  it "returns 'hello Kay' when passed 'Kay" do
    result = say_hello("Kay")
    expect(result).to eq "hello Kay"
  end
end

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

describe "encode method" do
  it "returns 'EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL' when passed ('theswiftfoxjumpedoverthelazydog', 'secretkey')" do
    result = encode('theswiftfoxjumpedoverthelazydog', 'secretkey')
    expect(result).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  end
end

describe "decode method" do
  it "returns 'theswiftfoxjumpedoverthelazydog' when passed ('EMBAXNKEKSYOVQTBJSWBDEMBPHZGJS', 'secretkey')" do
    result = decode('EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL', 'secretkey')
    expect(result).to eq "theswiftfoxjumpedoverthelazydog"
  end
end
