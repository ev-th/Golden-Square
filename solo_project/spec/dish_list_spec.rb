require 'dish_list'

RSpec.describe DishList do
  context "initially" do
    it "has an empty list" do
      menu = DishList.new
      expect(menu.empty?).to eq true
    end
    
    it "has a total price of 0" do
      menu = DishList.new
      expect(menu.total_price).to eq 0
    end
  end

  context "when dishes are added" do
    it "has a list of those dishes" do
      menu = DishList.new
      fake_pasta = double :Dish
      fake_pizza = double :Dish
      menu.add(fake_pasta)
      menu.add(fake_pizza)
      expect(menu.list).to eq [fake_pasta, fake_pizza]
    end
    
    it "is not empty" do
      menu = DishList.new
      fake_pasta = double :Dish
      fake_pizza = double :Dish
      menu.add(fake_pasta)
      menu.add(fake_pizza)
      expect(menu.empty?).to eq false
    end
    
    it "has a total price" do
      menu = DishList.new
      fake_pasta = double :Dish, price: 850
      fake_pizza = double :Dish, price: 799
      fake_risotto = double :Dish, price: 1020
      menu.add(fake_pasta)
      menu.add(fake_pizza)
      menu.add(fake_risotto)
      expect(menu.total_price).to eq 2669
    end
  end
  
  describe "#remove" do
    it "can remove dishes from the list" do
      menu = DishList.new
      fake_pasta = double :Dish
      fake_pizza = double :Dish
      fake_risotto = double :Dish
      menu.add(fake_pasta)
      menu.add(fake_pizza)
      menu.add(fake_risotto)
      menu.remove(fake_pizza)
      expect(menu.list).to eq [fake_pasta, fake_risotto]
    end

    it "fails when attempting to remove dishes that are not present" do
      menu = DishList.new
      fake_pasta = double :Dish
      fake_risotto = double :Dish
      menu.add(fake_pasta)
      expect {
        menu.remove(fake_risotto)
      }.to raise_error "This item is not in the list"
    end
  end
  
  describe "#all_available?" do
    context "when all dishes are available" do
      it "returns true" do
        menu = DishList.new
        fake_pasta = double :Dish, available?: true
        fake_pizza = double :Dish, available?: true
        fake_risotto = double :Dish, available?: true
        menu.add(fake_pasta)
        menu.add(fake_pizza)
        menu.add(fake_risotto)
        expect(menu.all_available?).to eq true
      end
    end

    context "when one dish is not available" do
      it "returns false" do
        menu = DishList.new
        fake_pasta = double :Dish, available?: true
        fake_pizza = double :Dish, available?: false
        fake_risotto = double :Dish, available?: true
        menu.add(fake_pasta)
        menu.add(fake_pizza)
        menu.add(fake_risotto)
        expect(menu.all_available?).to eq false
      end
    end

    context "when all dishes are unavailable" do
      it "returns false" do
        menu = DishList.new
        fake_pasta = double :Dish, available?: false
        fake_pizza = double :Dish, available?: false
        fake_risotto = double :Dish, available?: false
        menu.add(fake_pasta)
        menu.add(fake_pizza)
        menu.add(fake_risotto)
        expect(menu.all_available?).to eq false
      end
    end
  end
end