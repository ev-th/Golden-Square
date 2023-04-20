require 'dish'
require 'dish_list'
require 'order'
require 'text_message_sender'

RSpec.describe "integration" do
  it "displays a list of menu items with prices" do
    pasta = Dish.new("Pasta", 1250)
    pizza = Dish.new("Pizza", 1599)
    risotto = Dish.new("Risotto", 1300, available=false)
    salad = Dish.new("Salad", 985)
    menu = DishList.new
    menu.add(pasta)
    menu.add(pizza)
    menu.add(salad)
    menu.add(risotto)
    expect(menu.list).to eq [pasta, pizza, salad, risotto]
  end


  # 2 - Fail to create an order with no dishes
  context "when no dishes are added" do
    it "fails to initialise an order" do
      choices = DishList.new
      expect {
        order = Order.new(choices)
      }.to raise_error "There must be at least one dish in the list to initialize order"
    end
  end
  
  # 5 - Fail to create an order when selecting one unavailable dish
  context "when one unavailable dishes is added" do
    it "fails to initialize an order" do
      choices = DishList.new
      pizza = Dish.new('pizza', 1199)
      pasta = Dish.new('pasta', 1250, availability=false)
      risotto = Dish.new('risotto', 960)
      choices.add(pizza)
      choices.add(pasta)
      choices.add(risotto)
      expect {
        order = Order.new(choices)
      }.to raise_error "All dishes must be available to initialize"
    end
  end
  
  # 6 - Fail to create an order when selecting several unavailable dishes
  context "when multiple unavailable dishes are added" do
    it "fails to initialize an order" do
      choices = DishList.new
      pizza = Dish.new('pizza', 1199, availability=true)
      pasta = Dish.new('pasta', 1250, availability=false)
      risotto = Dish.new('risotto', 960, availability=false)
      choices.add(pizza)
      choices.add(pasta)
      choices.add(risotto)
      expect {
        order = Order.new(choices)
      }.to raise_error "All dishes must be available to initialize"
    end
  end
  
  # 7 - Display an itemised receipt of an order with a grand total with one dish
  context "when one dish is in the order" do
    it "generates an itemised receipt" do
      choices = DishList.new
      pizza = Dish.new('pizza', 1101)
      choices.add(pizza)
      order = Order.new(choices)
      result = order.generate_receipt
      expect(result).to eq "pizza - £11.01\nTOTAL - £11.01"
    end
  end
  
  # 7 - Display an itemised receipt of an order with a grand total with multiple dishes
  context "when one dish is in the order" do
    it "generates an itemised receipt" do
      choices = DishList.new
      pizza = Dish.new('pizza', 1199)
      pasta = Dish.new('pasta', 1250)
      risotto = Dish.new('risotto', 960)
      choices.add(pizza)
      choices.add(pasta)
      choices.add(risotto)
      order = Order.new(choices)
      result = order.generate_receipt
      expect(result).to eq "pizza - £11.99\npasta - £12.50\nrisotto - £9.60\nTOTAL - £34.09"
    end
  end
  
  # 8 - Send a text message to confirm order such as "Thank you! Your order was placed and will be delivered before 18:52"
  context "when order is confirmed" do
    it "can send a confirmation text message" do
      choices = DishList.new
      pizza = Dish.new('pizza', 1199)
      choices.add(pizza)
      order = Order.new(choices)

      fake_time = double :Time, now: Time.new(2023, 2, 2, 19, 30, 0)

      expected_delivery_time = Time.new(2023, 2, 2, 20, 30, 0)
      order.confirm!(fake_time)

      fake_json_response = '{"body": "Hi there", "direction": "outbound-api", "error_code": null, "error_message": null, "from": "+15017122661", "num_media": "0", "num_segments": "1", "price": null, "price_unit": null, "status": "sent", "to": "+15558675310",}'

      fake_messages = double :messages
      allow(fake_messages).to receive(:create).with(
        from: ENV['PHONE_NUMBER_FROM'],
        to: ENV['PHONE_NUMBER_TO'],
        body: "Thank you! Your order was placed and will be delivered before 20:30"
      ).and_return(fake_json_response)

      fake_client = double :client, messages: fake_messages

      fake_api = double :text_message_api
      allow(fake_api).to receive(:new).with(
        ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      ).and_return(fake_client)

      messager = TextMessageSender.new(order, text_message_client=fake_api)
      response = messager.send

      expect(messager.send).to eq fake_json_response
    end
  end
  
  # 9 - Fail to send a text message when order is not confirmed
  context "when order is not yet confirmed" do
    it "fails to send" do
    choices = DishList.new
    pizza = Dish.new('pizza', 1199)
    choices.add(pizza)
    order = Order.new(choices)
    fake_api = double :fake_api
    messager = TextMessageSender.new(order, text_message_api=fake_api)
    expect { messager.send }.to raise_error(
      "The order must be confirmed before the text message can be sent"
    )
    end
  end
end

