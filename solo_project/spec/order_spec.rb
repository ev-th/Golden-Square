require 'order'

RSpec.describe Order do
  context "when passed a dish_list that is not all available" do
    it "fails to initialize" do
      fake_dish_list = double :DishList, all_available?: false
      expect {
        Order.new(fake_dish_list)
      }.to raise_error "There must be at least one dish in the list to initialize order"
    end
  end

  context "initially" do
    it "is not marked as complete" do
      fake_dish_list = double :DishList, all_available?: true
      order = Order.new(fake_dish_list)
      expect(order.complete?).to eq false
    end

    it "has no recorded order time" do
      fake_dish_list = double :DishList, all_available?: true
      order = Order.new(fake_dish_list)
      expect(order.order_time).to be_nil
    end
  end
  
  describe "#confirm!" do
    it "marks the order as complete" do
      fake_dish_list = double :DishList, all_available?: true
      order = Order.new(fake_dish_list)
      order.confirm!
      expect(order.complete?).to eq true
    end
    
    it "records the time of order completion" do
      fake_dish_list = double :DishList, all_available?: true
      order = Order.new(fake_dish_list)

      time_obj = Time.new(2023, 4, 19, 14, 1, 3)
      fake_time_class = double :Time, now: time_obj
      order.confirm!(fake_time_class)
      expect(order.order_time).to eq time_obj
    end
  
  end

  describe "#generate_receipt" do
    context "when dish_list has one item" do
      it "returns the item and total price as multiline string" do
        fake_pizza = double :Dish, inspect: "fake pizza - £9.99"
        fake_dish_list = double :DishList, list: [fake_pizza], all_available?: true, total_price: 999
        order = Order.new(fake_dish_list)
        expect(order.generate_receipt).to eq(
          "fake pizza - £9.99\nTOTAL - £9.99"
        )
      end
    end
    
    context "when dish_list has several dishes" do
      it "returns the items and total price as a multiline string" do
        fake_pizza = double :Dish, inspect: "fake pizza - £9.99"
        fake_pasta = double :Dish, inspect: "fake pasta - £10.99"
        fake_risotto = double :Dish, inspect: "fake risotto - £11.99"
        fake_dish_list = double :DishList, list: [fake_pizza, fake_pasta, fake_risotto], all_available?: true, total_price: 2297
        order = Order.new(fake_dish_list)
        expect(order.generate_receipt).to eq(
          "fake pizza - £9.99\nfake pasta - £10.99\nfake risotto - £11.99\nTOTAL - £22.97"
        )
      end
    end
  end
end