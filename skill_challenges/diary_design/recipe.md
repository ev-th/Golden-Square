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
│ - get(entry)                                │             │ - completed_tasks  │
│ - get_longest_possible(wpm, time_available) │             │ - incomplete_tasks │
│ - get_phone_numbers(entry)                  │             │ - add              │
└────────────┬────────────────────────────┬───┘             │                    │
             │                            │                 └─────────┬──────────┘
             │ has 0 to many              │ has a                     │
┌────────────▼──────────────┐       ┌─────▼─────┐                     │
│ DiaryEntry(title, content)│       │ Phonebook │                     │ has 0 to many
│                           │       │           │                     │
│ - title                   │       │ - add     │                     │
│ - content                 │       │ - all     │          ┌──────────▼───────────┐
│ - word_count              │       └───────────┘          │ Todo(title, content) │
└───────────────────────────┘                              │                      │
                                                           │ - title              │
                                                           │ - content            │
                                                           │ - word_count         │
                                                           │                      │
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

  def add(entry)
  end

  def get(entry)
  end

  def get_longest_possible(wpm, time_available)
  end

  def get_phone_numbers(entry)
  end
end

class DiaryEntry
  def initialize(title, content)
  end

  def title
  end

  def content
  end

  def word_count
  end
end

class TodoList
  def initialize
    # set up list for todos
  end

  def all
  end

  def completed_tasks
  end

  def incomplete_tasks
  end

  def add
  end
end

class Todo
  def initialize(title, content)
  end

  def title
  end

  def content
  end

  def word_count
  end
end

class Phonebook
  def initialize
    # set up list for numbers
  end

  def add
  end

  def all
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
#
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
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