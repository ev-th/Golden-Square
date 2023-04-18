# Solo Project Class Design Recipe

## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class Dish
  def initialize
    # ...
  end

  def available?
    # returns boolean based on availability
  end

  def inspect
    # returns readable string including name and price
  end
end

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

  display_as_receipt
    # Displays the dish list without availability
    # Displays a Total price
  end
end

class TextMessageSender
  def initialize(order, requester, text_message_api)
    # order is an instance of Order
      # fails if not marked as complete
    # requester expected to use NET::HTTP or fake for unit tests
    # text_message_api expected to be twilio or fake for unit tests
  end

  def send
    # Sends the message
    # Returns json??
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
reminder = Reminder("Kay")
reminder.remind_me_to("Walk the dog")
reminder.remind() # => "Walk the dog, Kay!"

# 2
reminder = Reminder("Kay")
reminder.remind() # fails with "No task set."

# 3
reminder = Reminder("Kay")
reminder.remind_me_to("")
reminder.remind() # => ", Kay!"
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fsingle_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->