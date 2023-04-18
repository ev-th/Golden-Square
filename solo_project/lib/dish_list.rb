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
    fail "there are no dishes in the list" if @dishes.empty?
    @dishes.all?(&:available?)
  end

  def list
    @dishes
  end
end