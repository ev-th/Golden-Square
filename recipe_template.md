## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# `minutes_to_read` extracts uppercase words from a string
minutes_to_read = calculate_read_time(text)

text: a string (e.g. "hello WORLD")
minutes_to_read: a float => text length / reading speed (e.g. 6.0)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

calculate_read_time(NO_WORD) => 0
calculate_read_time(ONE_WORD) => 1
calculate_read_time(TWO_HUNDRED_WORDS) => 1
calculate_read_time(TWO_THOUSAND_WORDS) => 10
calculate_read_time(TWO_THOUSAND_AND_ONE_WORDS) => 11
calculate_read_time(TWO_THOUSAND_ONE_HUNDRED_NINETY_NINE) => 11
calculate_read_time(1) throws an error => not a string
calculate_read_time(1.5) throws an error
calculate_read_time(AN_ARRAY) throws an error
calculate_read_time(nil) throws an error
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
