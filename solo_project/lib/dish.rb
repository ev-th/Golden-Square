class Dish
  attr_reader :name, :price

  def initialize(name, price, availability=true)
    fail "price must be an integer" unless price.is_a?(Integer)

    @name = name
    @price = price
    @availability = availability
  end

  def available?
    @availability
  end

  def to_s
    pounds = @price / 100
    pence = @price % 100
    "#{@name} - #{price_to_s}"
  end

  private

  def price_to_s
    pounds = @price / 100
    pence = @price % 100
    pence = "#{0}#{pence}" if pence < 10
    "£#{pounds}.#{pence}"
  end
end