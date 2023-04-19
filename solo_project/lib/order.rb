class Order
  attr_reader :order_time

  def initialize(dish_list)
    fail "There must be at least one dish in the list to initialize order" if dish_list.empty?
    fail "All dishes must be available to initialize" unless dish_list.all_available?

    @dish_list = dish_list
    @complete = false
    @order_time = nil
  end

  def confirm!(time=Time)
    @complete = true
    @order_time = time.now
  end

  def complete?
    @complete
  end

  def generate_receipt
    items = @dish_list.list.join("\n")
    total = @dish_list.total_price
    pounds, pence = total / 100, total % 100
    pence = "#{0}#{pence}" if pence < 10
    "#{items}\nTOTAL - £#{pounds}.#{pence}"
  end
end