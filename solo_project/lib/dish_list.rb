class DishList
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def remove(dish)
    fail "This item is not in the list" unless @dishes.include?(dish)
    @dishes.delete(dish)
  end

  def all_available?
    @dishes.all?(&:available?)
  end

  def empty?
    @dishes.empty?
  end

  def list
    @dishes
  end

  def total_price
    @dishes.sum(&:price)
  end
end