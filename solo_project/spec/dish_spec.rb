require 'dish'

RSpec.describe Dish do
  context "when price is not an integer" do
    it "fails to initialise with string" do
      expect {
        Dish.new("pasta", "1199")
      }.to raise_error "price must be an integer"
    end

    it "fails to initialise with float" do
      expect {
        Dish.new("pasta", 11.99)
      }.to raise_error "price must be an integer"
    end
  end

  it "has a name" do
    dish = Dish.new("pasta", 1199)
    expect(dish.name).to eq "pasta"
  end
  
  it "has a price in pence" do
    dish = Dish.new("pasta", 1199)
    expect(dish.price).to eq 1199
  end
  
  it "has an availability of true by default" do
    dish = Dish.new("pasta", 1199)
    expect(dish.available?).to eq true
  end
  
  context "when availability=false is passed at init" do
    it "has an availability of false" do
      dish = Dish.new("pasta", 1199, availability=false)
      expect(dish.available?).to eq false
    end
  end
  
  it "returns a formatted string with name and price when printed" do
    dish = Dish.new("pasta", 1199, availability=false)
    expect(dish.to_s).to eq "pasta - £11.99"
  end
end
