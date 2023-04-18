class DishList
  def initialize
    # ...
  end

  def add(dish) #dish is an instance of Dish
    # adds a dish to the list
  end

  def remove(dish) #dish is an instance of Dish
    # removes a dish from the list
  end

  def display(availability=true) # toggle availability to display without availability
    # prints the list of dishes
  end

  def all_available?
    # returns a boolean
    # true if all available, false if any not available
  end
end