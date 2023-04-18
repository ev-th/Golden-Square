class Order
  def initialize(dish_list) # dish_list is an instance of DishList
    #  fails if some of the dishes are not available
  end

  def confirm!
    # Marks the order as complete
    # Records the time of order confirmation
  end

  def complete?
    # Returns a boolean based on whether order is marked complete
  end

  def display_as_receipt
    # Displays the dish list without availability
    # Displays a Total price
  end
end