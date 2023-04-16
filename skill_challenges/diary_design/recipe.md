# Diary Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌─────────────────────────────────────────────┐             ┌────────────────────┐
│ Diary                                       │             │ TodoList           │
│                                             │    has a    │                    │
│ - add(entry)                                ├────────────►│ - all              │
│ - todos(status='all')                       │             │ - completed_tasks  │
│ - get_longest_possible(wpm, time_available) │             │ - incomplete_tasks │
│ - all_phone_numbers(entry)                  │             │ - add              │
└────────────┬────────────────────────────–───┘             │                    │
             │                                              └─────────┬──────────┘
             │ has 0 to many                                          │
┌────────────▼──────────────┐                                         │
│ DiaryEntry(title, content)│                                         │ has 0 to many
│                           │                                         │
│ - title                   │                                         │
│ - content                 │                              ┌──────────▼───────────┐
│ - word_count              │                              │ Todo(title, content) │
| - phone_numbers           |                              |                      |
└───────────────────────────┘                              │ - title              │
                                                           │ - content            │
                                                           │ - mark_complete!     │
                                                           │ - word_count         │
                                                           │ - complete?          │
                                                           └──────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # set up a list for diary entries
    # set up a phonebook
    # set up a todo list
  end

  def all # => []
  end

  def add(entry) # => nil
    # adds a DiaryEntry object to the list
  end

  def get_longest_possible(wpm, time_available) # => DiaryEntry
    # Get the longest possible entry that can be read in the time available
    # given the speed in wpm
  end

  def all_phone_numbers # => [String]
    # Returns a list of phone numbers in all diary entries
  end

  def todos(status = 'all')
    # Returns a list of todos based on whether status == 'all', 'complete', 'incomplete'
  end

  def add_todo(todo)
    # Adds the todo to the Diary's todo list
  end
end

class DiaryEntry
  def initialize(title, content)
  end

  def title # => String
  end

  def content # => String
  end

  def word_count # => Integer
  end

  def phone_numbers # => [String]
  end
end

class TodoList
  def initialize
    # set up list for todos
  end

  def all # => [Todo]
  end

  def completed_tasks # => [Todo]
  end

  def incomplete_tasks # => [Todo]
  end

  def add # => nil
    # Adds a Todo to the list
  end
end

class Todo
  def initialize(title, content)
  end

  def title # => String
  end

  def content # => String
  end

  def mark_complete! # => nil
    # updates the state from incomplete to complete
  end

  def word_count # => Integer
  end

  def complete? # => bool
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Diary
  # When set up
    # Provides an empty list of phone numbers
    # Provides an empty list of diary entries
    # Fails to get longest possible entry
    # Has a list of todos
      # Complete == [], Incomplete == [], all == []
  # When provided with multiple entries
    # provides a list of them
    # #get_longest_possible
      # Fails to get longest possible entry when none are short enough
      # When there is an entry exactly the right length, it will return that as the longest possible entry
      # When there is a selection of longer and shorter entries, it will return the longest that is possible to read
    # #all_phone_numbers
      # Returns empty list when entries don't have phone numbers
      # Returns all phone numbers when entries have one or more phone numbers
  # When todos are added
    # #todos returns all of them
    # #todos(status = 'complete') returns completed todos
    # #todos(status = 'incomplete') returns incomplete todos
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._


```ruby
# DiaryEntry
  # Has a title
  # Has content
  # Has a word count
    # Returns 0 for no content
    # Returns 1 for one word
    # Returns x for x words
  # Gets a list of phone numbers from content
    # Returns an empty list when no numbers
    # Returns a list with one number
    # Returns a list with multiple numbers
    # Does not recognise numbers that are not 11 digits long

# TodoList
  # When intialized
    # Has empty lists
      # #completed_tasks => []
      # #incomplete_tasks => []
      # #all_tasks => []

#Todo
  # Has a title
  # Has a content
  # complete? == false
  # Has a word count
    # Returns 0 for no content
    # Returns 1 for one word
    # Returns x for x words
  # #mark_complete!
    #complete? == true
    # fails when already marked as complete

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->