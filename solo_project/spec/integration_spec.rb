require 'dish'
require 'dish_list'
require 'order'
require 'text_message_sender'

RSpec.describe "integration" do
  xit "displays a list of menu items with prices" do
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
end

# 2 - Fail to create an order with no dishes

# 3 - Create an order with one available dish

# 4 - Create an order with several available dishes

# 5 - Fail to create an order when selecting one unavailable dish

# 6 - Fail to create an order when selecting several unavailable dishes

# 7 - Display an itemised receipt of an order with a grand total

# 8 - Send a text message to confirm order such as "Thank you! Your order was placed and will be delivered before 18:52"

# 9 - Fail to send a text message when order is not confirmed